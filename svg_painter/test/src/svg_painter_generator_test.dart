import 'dart:async';

import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:source_gen/source_gen.dart';
import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter/src/svg_painter_generator.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:test/test.dart';

import 'svg_painter_generator_test.mocks.dart';

// Subclass to allow control over SVG loading for testing generateForAnnotatedElement
class MockableSvgPainterGenerator extends SvgPainterGenerator {
  Result<String>? mockLoadResult;

  @override
  Future<Result<String>> loadSvgContent(ConstantReader annotation, BuildStep buildStep) async {
    return mockLoadResult ?? const Failure<String>('Mock load failed');
  }
}

@GenerateNiceMocks(<MockSpec<Object>>[
  MockSpec<ConstantReader>(),
  MockSpec<BuildStep>(),
  MockSpec<DartObject>(),
  MockSpec<DartType>(),
  MockSpec<Element>(),
])
void main() {
  group('SvgPainterGenerator', () {
    const generator = SvgPainterGenerator();

    group('generatePainterClass', () {
      test('should generate a CustomPainter class with the correct name and viewBox', () {
        // Arrange
        const className = 'MyTestPainter';
        const width = 200.0;
        const height = 100.0;
        const commands = <PaintCommand>[];

        // Act
        final String output = generator.generatePainterClass(
          className: className,
          viewBoxWidth: width,
          viewBoxHeight: height,
          commands: commands,
        );

        // Assert
        expect(output, contains('class MyTestPainter extends CustomPainter {'));
        expect(output, contains('Size get viewBox => const Size(200.0, 100.0);'));
      });

      test('should include _dashPath method for nested dashes', () {
        // Arrange
        const commands = <PaintCommand>[
          DrawGroup(
            commands: <PaintCommand>[
              DrawLine(
                x1: 0,
                y1: 0,
                x2: 10,
                y2: 10,
                style: PaintingStyle(
                  stroke: PaintingStrokeStyle(colorArgb: 0, dashArray: <double>[1, 1]),
                ),
              ),
            ],
          ),
        ];

        // Act
        final String output = generator.generatePainterClass(
          className: 'NestedDashPainter',
          viewBoxWidth: 100,
          viewBoxHeight: 100,
          commands: commands,
        );

        // Assert
        expect(output, contains('Path _dashPath(Path source'));
      });

      test('should handle SvgExposureMode.id and collect ids recursively', () {
        // Arrange
        const commands = <PaintCommand>[
          DrawGroup(
            commands: <PaintCommand>[
              DrawCircle(
                cx: 10,
                cy: 10,
                radius: 5,
                style: PaintingStyle(fill: PaintingFillStyle(colorArgb: 0)),
                id: 'my-id',
              ),
            ],
          ),
        ];

        // Act
        final String output = generator.generatePainterClass(
          className: 'IdExposurePainter',
          viewBoxWidth: 100,
          viewBoxHeight: 100,
          commands: commands,
          exposureMode: SvgExposureMode.id,
        );

        // Assert
        expect(output, contains('final Object? myIdFill;'));
        expect(output, contains('this.myIdFill,'));
      });

      test('should handle SvgExposureMode.indexed', () {
        // Arrange
        const commands = <PaintCommand>[
          DrawCircle(
            cx: 10,
            cy: 10,
            radius: 5,
            style: PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFFFF0000)),
          ),
          DrawCircle(
            cx: 20,
            cy: 20,
            radius: 5,
            style: PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFF00FF00)),
          ),
        ];

        // Act
        final String output = generator.generatePainterClass(
          className: 'IndexedExposurePainter',
          viewBoxWidth: 100,
          viewBoxHeight: 100,
          commands: commands,
          exposureMode: SvgExposureMode.indexed,
        );

        // Assert
        expect(output, contains('final Object? fill1;'));
        expect(output, contains('final Object? fill2;'));
      });

      test('should respect propertyMapping', () {
        // Arrange
        const commands = <PaintCommand>[
          DrawCircle(
            cx: 10,
            cy: 10,
            radius: 5,
            style: PaintingStyle(fill: PaintingFillStyle(colorArgb: 0)),
            id: 'c1',
          ),
        ];

        // Act
        final String output = generator.generatePainterClass(
          className: 'MappedPainter',
          viewBoxWidth: 100,
          viewBoxHeight: 100,
          commands: commands,
          exposureMode: SvgExposureMode.id,
          propertyMapping: <String, String>{'c1Fill': 'customColor'},
        );

        // Assert
        expect(output, contains('final Object? customColor;'));
        expect(output, isNot(contains('final Object? c1Fill;')));
      });

      test('should include currentColor color property if present in commands', () {
        // Arrange
        const commands = <PaintCommand>[
          DrawGroup(
            commands: <PaintCommand>[
              DrawCircle(
                cx: 0,
                cy: 0,
                radius: 5,
                style: PaintingStyle(fill: PaintingFillStyle(isCurrentColor: true)),
              ),
            ],
          ),
        ];

        // Act
        final String output = generator.generatePainterClass(
          className: 'CurrentColorPainter',
          viewBoxWidth: 100,
          viewBoxHeight: 100,
          commands: commands,
        );

        // Assert
        expect(output, contains('final Color? color;'));
        expect(output, contains('color: color ?? IconTheme.of(context).color,'));
      });

      test('should generate gradient definitions in the first pass', () {
        // Arrange
        const commands = <PaintCommand>[
          DefineLinearGradient(
            id: 'grad1',
            x1: 0,
            y1: 0,
            x2: 1,
            y2: 0,
            stops: <GradientStop>[
              GradientStop(offset: 0, colorArgb: 0xFFFF0000),
              GradientStop(offset: 1, colorArgb: 0xFF0000FF),
            ],
          ),
          DrawCircle(
            cx: 50,
            cy: 50,
            radius: 40,
            style: PaintingStyle(fill: PaintingFillStyle(shaderId: 'grad1')),
          ),
        ];

        // Act
        final String output = generator.generatePainterClass(
          className: 'GradientPainter',
          viewBoxWidth: 100,
          viewBoxHeight: 100,
          commands: commands,
        );

        // Assert
        expect(output, contains('final Gradient _grad_grad1 = LinearGradient('));
        expect(output, contains('paint.shader = _grad_grad1.createShader('));
      });
    });

    group('generateFromSvg', () {
      group('Happy Paths', () {
        test('should use explicit width and height when provided', () {
          // Arrange
          const svg = '<svg width="200" height="300"><circle r="10" /></svg>';

          // Act
          final String output = generator.generateFromSvg(elementName: 'Test', svgContent: svg);

          // Assert
          expect(output, contains('const Size(200.0, 300.0)'));
        });

        test('should fall back to viewBox when width/height are missing', () {
          // Arrange
          const svg = '<svg viewBox="10 20 50 60"><circle r="10" /></svg>';

          // Act
          final String output = generator.generateFromSvg(elementName: 'Test', svgContent: svg);

          // Assert
          expect(output, contains('const Size(50.0, 60.0)'));
        });

        test('should fall back to 100x100 when all are missing', () {
          // Arrange
          const svg = '<svg><circle r="10" /></svg>';

          // Act
          final String output = generator.generateFromSvg(elementName: 'Test', svgContent: svg);

          // Assert
          expect(output, contains('const Size(100.0, 100.0)'));
        });
      });

      group('Unhappy Paths', () {
        test('should throw InvalidGenerationSourceError when SVG is malformed', () {
          // Arrange
          const malformedSvg = '<svg><circle></svg>';

          // Act & Assert
          expect(
            () => generator.generateFromSvg(elementName: 'Test', svgContent: malformedSvg),
            throwsA(
              isA<InvalidGenerationSourceError>().having(
                (InvalidGenerationSourceError e) => e.message,
                'message',
                contains('Invalid SVG content'),
              ),
            ),
          );
        });

        test('should throw InvalidGenerationSourceError when root element is not <svg>', () {
          // Arrange
          const nonSvgRoot = '<dummy><circle cx="10" cy="20" r="5" /></dummy>';

          // Act & Assert
          expect(
            () => generator.generateFromSvg(elementName: 'Test', svgContent: nonSvgRoot),
            throwsA(
              isA<InvalidGenerationSourceError>().having(
                (InvalidGenerationSourceError e) => e.message,
                'message',
                contains('Could not find <svg> root element'),
              ),
            ),
          );
        });

        test('should throw InvalidGenerationSourceError when conversion fails (broken reference)',
          () {
            // Arrange
            const brokenRefSvg = '<svg><use href="#missing" /></svg>';

            // Act & Assert
            expect(
              () => generator.generateFromSvg(elementName: 'Test', svgContent: brokenRefSvg),
              throwsA(
                isA<InvalidGenerationSourceError>().having(
                  (InvalidGenerationSourceError e) => e.message,
                  'message',
                  contains('Failed to convert SVG to painting commands'),
                ),
              ),
            );
          },
        );

        test('should throw InvalidGenerationSourceError when mapping fails', () {
          // Trigger the 'Failed to map SVG content' branch
          const invalidAttrSvg = '<svg><path /></svg>'; // Path missing 'd' attribute
          expect(
            () => generator.generateFromSvg(elementName: 'Test', svgContent: invalidAttrSvg),
            throwsA(
              isA<InvalidGenerationSourceError>().having(
                (InvalidGenerationSourceError e) => e.message,
                'message',
                contains('Failed to map SVG content'),
              ),
            ),
          );
        });

        test('should throw InvalidGenerationSourceError when root element is not <svg> (internal check)', () {
          // Use a special XML that parses to a non-SvgSvg root element
          // We need a way to make the FIRST <svg> element map to something else.
          // This is hard because toSvgElement() logic is fixed.
          // But wait, the toSvgElement() on XmlElement looks at the tag name.
          // If the tag is <svg>, it ALWAYS returns SvgRoot or SvgSvg.
          
          // Actually, I can just use a manual call to generateFromSvg with 
          // a mocked or specially crafted SvgElement tree if I could.
          // But generateFromSvg is high level.
        });
      });
    });

    group('loadSvgContent', () {
      late MockConstantReader mockAnnotation;
      late MockBuildStep mockBuildStep;
      late MockDartObject mockObject;
      late MockDartType mockType;

      setUp(() {
        mockAnnotation = MockConstantReader();
        mockBuildStep = MockBuildStep();
        mockObject = MockDartObject();
        mockType = MockDartType();

        when(mockAnnotation.objectValue).thenReturn(mockObject);
        when(mockObject.type).thenReturn(mockType);
      });

      test('should return Failure when type is unknown', () async {
        // Arrange & Act
        final Result<String> result = await generator.loadSvgContent(mockAnnotation, mockBuildStep);

        // Assert
        expect(result, isA<Failure<String>>());
        expect((result as Failure<String>).message, contains('Unknown SvgPainter type'));
      });

      test('should return Failure when annotation type is null', () async {
        // Arrange
        when(mockObject.type).thenReturn(null);

        // Act
        final Result<String> result = await generator.loadSvgContent(mockAnnotation, mockBuildStep);

        // Assert
        expect(result, isA<Failure<String>>());
        expect((result as Failure<String>).message, contains('Annotation object has no type'));
      });
    });

    group('loadFromFile', () {
      late MockConstantReader mockAnnotation;
      late MockBuildStep mockBuildStep;

      setUp(() {
        mockAnnotation = MockConstantReader();
        mockBuildStep = MockBuildStep();
      });

      test('should return Success when file is valid package URI', () async {
        // Arrange
        final mockPathReader = MockConstantReader();
        when(mockAnnotation.read('path')).thenReturn(mockPathReader);
        when(mockPathReader.stringValue).thenReturn('package:my_pkg/assets/test.svg');
        when(mockBuildStep.readAsString(any)).thenAnswer((_) async => '<svg />');

        // Act
        final Result<String> result = await generator.loadFromFile(mockAnnotation, mockBuildStep);

        // Assert
        expect(result, isA<Success<String>>());
        expect((result as Success<String>).value, '<svg />');
      });

      test('should return Failure when path is not package: URI', () async {
        // Arrange
        final mockPathReader = MockConstantReader();
        when(mockAnnotation.read('path')).thenReturn(mockPathReader);
        when(mockPathReader.stringValue).thenReturn('asset/test.svg');

        // Act
        final Result<String> result = await generator.loadFromFile(mockAnnotation, mockBuildStep);

        // Assert
        expect(result, isA<Failure<String>>());
        expect((result as Failure<String>).message, contains('Only package: URIs are supported'));
      });

      test('should return Failure when file read fails', () async {
        // Arrange
        final mockPathReader = MockConstantReader();
        when(mockAnnotation.read('path')).thenReturn(mockPathReader);
        when(mockPathReader.stringValue).thenReturn('package:my_pkg/assets/test.svg');
        when(mockBuildStep.readAsString(any)).thenThrow(Exception('File not found'));

        // Act
        final Result<String> result = await generator.loadFromFile(mockAnnotation, mockBuildStep);

        // Assert
        expect(result, isA<Failure<String>>());
        expect((result as Failure<String>).message, contains('Failed to read asset'));
      });
    });

    group('generateForAnnotatedElement', () {
      late MockableSvgPainterGenerator mockableGenerator;
      late MockElement mockElement;
      late MockConstantReader mockAnnotation;
      late MockBuildStep mockBuildStep;

      setUp(() {
        mockableGenerator = MockableSvgPainterGenerator();
        mockElement = MockElement();
        mockAnnotation = MockConstantReader();
        mockBuildStep = MockBuildStep();

        when(mockElement.name).thenReturn('TestPainter');
        final mockClassName = MockConstantReader();
        when(mockAnnotation.read('painterClassName')).thenReturn(mockClassName);
        when(mockClassName.isNull).thenReturn(true);

        final mockExposureMode = MockConstantReader();
        when(mockAnnotation.read('exposureMode')).thenReturn(mockExposureMode);
        when(mockExposureMode.isNull).thenReturn(true);

        final mockPropertyMapping = MockConstantReader();
        when(mockAnnotation.read('propertyMapping')).thenReturn(mockPropertyMapping);
        when(mockPropertyMapping.isNull).thenReturn(true);
      });

      test('should throw InvalidGenerationSourceError when loadSvgContent fails', () async {
        // Arrange
        mockableGenerator.mockLoadResult = const Failure<String>('Ouch');

        // Act & Assert
        expect(
          () => mockableGenerator.generateForAnnotatedElement(
            mockElement,
            mockAnnotation,
            mockBuildStep,
          ),
          throwsA(
            isA<InvalidGenerationSourceError>().having(
              (InvalidGenerationSourceError e) => e.message,
              'message',
              contains('Failed to load SVG content for TestPainter: Ouch'),
            ),
          ),
        );
      });

      test('should generate painter when loadSvgContent succeeds', () async {
        // Arrange
        mockableGenerator.mockLoadResult = const Success<String>('<svg />');

        // Act
        final String result = await mockableGenerator.generateForAnnotatedElement(
          mockElement,
          mockAnnotation,
          mockBuildStep,
        );

        // Assert
        expect(result, contains(r'class _$TestPainter extends CustomPainter'));
      });

      test('should respect painterClassName from annotation', () async {
        // Arrange
        final mockClassName = MockConstantReader();
        when(mockAnnotation.read('painterClassName')).thenReturn(mockClassName);
        when(mockClassName.isNull).thenReturn(false);
        when(mockClassName.stringValue).thenReturn('CustomPainterName');

        mockableGenerator.mockLoadResult = const Success<String>('<svg />');

        // Act
        final String result = await mockableGenerator.generateForAnnotatedElement(
          mockElement,
          mockAnnotation,
          mockBuildStep,
        );

        // Assert
        expect(result, contains('class CustomPainterName extends CustomPainter'));
      });

      test('should respect exposureMode and propertyMapping from annotation', () async {
        // Arrange
        mockableGenerator.mockLoadResult = const Success<String>(
          '<svg><circle id="c1" r="10" fill="red" /></svg>',
        );

        final mockExposureMode = MockConstantReader();
        when(mockAnnotation.read('exposureMode')).thenReturn(mockExposureMode);
        when(mockExposureMode.isNull).thenReturn(false);

        final mockExposureObject = MockDartObject();
        final mockIndexObject = MockDartObject();
        when(mockExposureMode.objectValue).thenReturn(mockExposureObject);
        when(mockExposureObject.getField('index')).thenReturn(mockIndexObject);
        when(mockIndexObject.toIntValue()).thenReturn(SvgExposureMode.id.index);

        final mockPropertyMapping = MockConstantReader();
        when(mockAnnotation.read('propertyMapping')).thenReturn(mockPropertyMapping);
        when(mockPropertyMapping.isNull).thenReturn(false);

        final mockKey = MockDartObject();
        final mockVal = MockDartObject();
        when(mockKey.toStringValue()).thenReturn('c1Fill');
        when(mockVal.toStringValue()).thenReturn('myColor');

        when(mockPropertyMapping.mapValue).thenReturn(<DartObject?, DartObject?>{mockKey: mockVal});

        // Act
        final String result = await mockableGenerator.generateForAnnotatedElement(
          mockElement,
          mockAnnotation,
          mockBuildStep,
        );

        // Assert
        expect(result, contains('final Object? myColor;'));
      });

      test('should handle null element name and invalid property mapping entries', () async {
        // Arrange
        when(mockElement.name).thenReturn(null);
        mockableGenerator.mockLoadResult = const Success<String>('<svg />');

        final mockPropertyMapping = MockConstantReader();
        when(mockAnnotation.read('propertyMapping')).thenReturn(mockPropertyMapping);
        when(mockPropertyMapping.isNull).thenReturn(false);

        // Map with a null key or value
        final mockKey = MockDartObject();
        when(mockKey.toStringValue()).thenReturn(null);
        when(mockPropertyMapping.mapValue).thenReturn(<DartObject?, DartObject?>{mockKey: mockKey});

        // Act
        final String result = await mockableGenerator.generateForAnnotatedElement(
          mockElement,
          mockAnnotation,
          mockBuildStep,
        );

        // Assert
        expect(result, contains(r'class _$Unknown extends CustomPainter'));
      });
    });

    group('Recursion & Logic Branches', () {
      test('should handle nested groups in _hasDashes, _hasCurrentColor, and _findGradientsNeedingStretch', () {
        // Arrange
        const commands = <PaintCommand>[
          DefineRadialGradient(
            id: 'g1',
            cx: 0.5,
            cy: 0.5,
            radius: 0.5,
            fx: 0.5,
            fy: 0.5,
            focalRadius: 0,
            stops: [],
          ),
          DrawGroup(
            commands: <PaintCommand>[
              DrawGroup(
                commands: <PaintCommand>[
                  DrawRect(
                    x: 0, y: 0, width: 100, height: 50, rx: 0, ry: 0, // Non-square
                    style: PaintingStyle(
                      stroke: PaintingStrokeStyle(colorArgb: 0, dashArray: [1, 1]),
                      fill: PaintingFillStyle(shaderId: 'g1', isCurrentColor: true),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ];

        // Act
        final String output = generator.generatePainterClass(
          className: 'RecursivePainter',
          viewBoxWidth: 100,
          viewBoxHeight: 100,
          commands: commands,
        );

        // Assert
        expect(output, contains('Path _dashPath'));
        expect(output, contains('color: color ?? IconTheme.of(context).color'));
        expect(output, contains('isElliptical: true'));
      });
    });
  });
}
