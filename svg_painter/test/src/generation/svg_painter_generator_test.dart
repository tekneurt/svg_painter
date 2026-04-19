import 'dart:async';

import 'package:analyzer/dart/constant/value.dart';
import 'package:build/build.dart';
import 'package:mockito/mockito.dart';
import 'package:source_gen/source_gen.dart';
import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/generation/svg_painter_generator.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

import 'svg_painter_generator_test.mocks.dart';

// Subclass to allow control over SVG loading for testing generateForAnnotatedElement
class MockableSvgPainterGenerator extends SvgPainterGenerator {
  MockableSvgPainterGenerator({
    this.mockSvgContent,
    this.mockFailure,
  });

  final String? mockSvgContent;
  final Failure<String>? mockFailure;

  @override
  Future<Result<String>> loadSvgContent(ConstantReader annotation, BuildStep buildStep) async {
    if (mockFailure != null) {
      return mockFailure!;
    }
    return Success<String>(mockSvgContent ?? '<svg/>');
  }
}

void main() {
  group('SvgPainterGenerator', () {
    const generator = SvgPainterGenerator();

    group('generateFromSvg', () {
      test('should generate painter class for simple SVG', () async {
        // Arrange
        const svgContent = '''
<svg width="100" height="100">
  <rect x="10" y="10" width="80" height="80" fill="red" />
</svg>
''';

        // Act
        final String output = await generator.generateFromSvg(
          elementName: 'TestPainter',
          svgContent: svgContent,
        );

        // Assert
        expect(output, contains(r'class _$TestPainter extends CustomPainter {'));
        expect(output, contains('canvas.drawRect(Rect.fromLTWH(10.0, 10.0, 80.0, 80.0), paint)'));
      });

      test('should throw InvalidGenerationSourceError for invalid XML', () async {
        // Arrange
        const svgContent = '<svg><rect></svg>'; // Missing closing tag

        // Act & Assert
        expect(
          () => generator.generateFromSvg(elementName: 'Test', svgContent: svgContent),
          throwsA(isA<InvalidGenerationSourceError>()),
        );
      });

      test('should throw InvalidGenerationSourceError when <svg> is missing', () async {
        // Arrange
        const svgContent = '<not-svg></not-svg>';

        // Act & Assert
        expect(
          () => generator.generateFromSvg(elementName: 'Test', svgContent: svgContent),
          throwsA(isA<InvalidGenerationSourceError>()),
        );
      });
    });

    group('generatePainterClass', () {
      test('should generate class structure and basic methods', () {
        // Arrange
        final commands = <PaintCommand>[
          const DrawGroup(
            commands: <PaintCommand>[
              DrawCircle(
                cx: 10,
                cy: 10,
                radius: 5,
                style: PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFF00FF00)),
              ),
            ],
          ),
        ];

        // Act
        final String output = generator.generatePainterClass(
          className: 'MyPainter',
          viewBoxWidth: 100,
          viewBoxHeight: 100,
          commands: commands,
        );

        // Assert
        expect(output, contains('class MyPainter extends CustomPainter {'));
        expect(output, contains('Size get viewBox => const Size(100.0, 100.0);'));
        expect(output, contains('void paint(Canvas canvas, Size size) {'));
        expect(output, contains('bool shouldRepaint(covariant MyPainter oldDelegate) {'));
      });

      test('should include image bytes constants when DrawImage commands exist', () {
        // Arrange
        final commands = <PaintCommand>[
          const DrawImage(
            href: 'assets/test.png',
            x: 0,
            y: 0,
            width: 100,
            height: 100,
            bytes: <int>[1, 2, 3],
            style: PaintingStyle(),
            imageIndex: 0,
          ),
        ];

        // Act
        final String output = generator.generatePainterClass(
          className: 'ImagePainter',
          viewBoxWidth: 100,
          viewBoxHeight: 100,
          commands: commands,
        );

        // Assert
        expect(output, contains('const List<int> _imageBytes_ImagePainter_0 = <int>[1, 2, 3];'));
      });

      test('should generate gradient transform helper when needed', () {
        // Arrange
        final commands = <PaintCommand>[
          const DefineLinearGradient(
            id: 'grad1',
            x1: 0,
            y1: 0,
            x2: 1,
            y2: 1,
            stops: <GradientStop>[],
            transformAttributes: SvgTransformAttributes(<SvgTransformOperation>[
              SvgRotate(45),
            ]),
          ),
          const DrawRect(
            x: 0,
            y: 0,
            width: 100,
            height: 100,
            rx: 0,
            ry: 0,
            style: PaintingStyle(fill: PaintingFillStyle(colorArgb: 0, shaderId: 'grad1')),
          ),
        ];

        // Act
        final String output = generator.generatePainterClass(
          className: 'TransformPainter',
          viewBoxWidth: 100,
          viewBoxHeight: 100,
          commands: commands,
        );

        // Assert
        expect(
          output,
          contains('class _SvgGradientTransform_TransformPainter extends GradientTransform {'),
        );
      });
    });

    group('generateForAnnotatedElement', () {
      late MockConstantReader mockAnnotation;
      late MockBuildStep mockBuildStep;

      setUp(() {
        mockAnnotation = MockConstantReader();
        mockBuildStep = MockBuildStep();
      });

      test('should throw InvalidGenerationSourceError when loadSvgContent fails', () async {
        // Arrange
        final gen = MockableSvgPainterGenerator(
          mockFailure: const Failure<String>('Ouch'),
        );
        final mockElement = MockElement();
        when(mockElement.name).thenReturn('TestPainter');

        // Act & Assert
        expect(
          () => gen.generateForAnnotatedElement(mockElement, mockAnnotation, mockBuildStep),
          throwsA(
            isA<InvalidGenerationSourceError>().having(
              (e) => e.message,
              'message',
              contains('Failed to load SVG content for TestPainter: Ouch'),
            ),
          ),
        );
      });

      test('should generate painter when loadSvgContent succeeds', () async {
        // Arrange
        final gen = MockableSvgPainterGenerator(
          mockSvgContent: '<svg><rect width="10" height="10"/></svg>',
        );
        final mockElement = MockElement();
        when(mockElement.name).thenReturn('TestPainter');

        final mockExposureReader = MockConstantReader();
        when(mockAnnotation.read('exposureMode')).thenReturn(mockExposureReader);
        when(mockExposureReader.isNull).thenReturn(true);

        final mockPropertyMappingReader = MockConstantReader();
        when(mockAnnotation.read('propertyMapping')).thenReturn(mockPropertyMappingReader);
        when(mockPropertyMappingReader.isNull).thenReturn(true);

        final mockClassNameReader = MockConstantReader();
        when(mockAnnotation.read('painterClassName')).thenReturn(mockClassNameReader);
        when(mockClassNameReader.isNull).thenReturn(true);

        // Act
        final String output = await gen.generateForAnnotatedElement(
          mockElement,
          mockAnnotation,
          mockBuildStep,
        );

        // Assert
        expect(output, contains(r'class _$TestPainter extends CustomPainter {'));
      });

      test('should respect painterClassName from annotation', () async {
        // Arrange
        final gen = MockableSvgPainterGenerator(
          mockSvgContent: '<svg/>',
        );
        final mockElement = MockElement();
        when(mockElement.name).thenReturn('TestPainter');

        final mockClassNameReader = MockConstantReader();
        when(mockAnnotation.read('painterClassName')).thenReturn(mockClassNameReader);
        when(mockClassNameReader.isNull).thenReturn(false);
        when(mockClassNameReader.stringValue).thenReturn('CustomName');

        final mockExposureReader = MockConstantReader();
        when(mockAnnotation.read('exposureMode')).thenReturn(mockExposureReader);
        when(mockExposureReader.isNull).thenReturn(true);

        final mockPropertyMappingReader = MockConstantReader();
        when(mockAnnotation.read('propertyMapping')).thenReturn(mockPropertyMappingReader);
        when(mockPropertyMappingReader.isNull).thenReturn(true);

        // Act
        final String output = await gen.generateForAnnotatedElement(
          mockElement,
          mockAnnotation,
          mockBuildStep,
        );

        // Assert
        expect(output, contains('class CustomName extends CustomPainter {'));
      });

      test('should respect exposureMode and propertyMapping from annotation', () async {
        // Arrange
        final gen = MockableSvgPainterGenerator(
          mockSvgContent: '''
<svg>
  <rect id="myRect" width="10" height="10" fill="red" />
</svg>
''',
        );
        final mockElement = MockElement();
        when(mockElement.name).thenReturn('TestPainter');

        final mockClassNameReader = MockConstantReader();
        when(mockAnnotation.read('painterClassName')).thenReturn(mockClassNameReader);
        when(mockClassNameReader.isNull).thenReturn(true);

        final mockExposureReader = MockConstantReader();
        when(mockAnnotation.read('exposureMode')).thenReturn(mockExposureReader);
        when(mockExposureReader.isNull).thenReturn(false);

        final mockExposureObject = MockDartObject();
        when(mockExposureReader.objectValue).thenReturn(mockExposureObject);
        final mockIndexField = MockDartObject();
        when(mockExposureObject.getField('index')).thenReturn(mockIndexField);
        // SvgExposureMode.id index is 1
        when(mockIndexField.toIntValue()).thenReturn(1);

        final mockPropertyMappingReader = MockConstantReader();
        when(mockAnnotation.read('propertyMapping')).thenReturn(mockPropertyMappingReader);
        when(mockPropertyMappingReader.isNull).thenReturn(false);

        final mockKey = MockDartObject();
        when(mockKey.toStringValue()).thenReturn('myRectFill');
        final mockValue = MockDartObject();
        when(mockValue.toStringValue()).thenReturn('rectColor');

        when(
          mockPropertyMappingReader.mapValue,
        ).thenReturn(<DartObject?, DartObject?>{mockKey: mockValue});

        // Act
        final String output = await gen.generateForAnnotatedElement(
          mockElement,
          mockAnnotation,
          mockBuildStep,
        );

        // Assert
        expect(output, contains('final Object? rectColor;'));
      });

      test('should handle null element name and invalid property mapping entries', () async {
        // Arrange
        final gen = MockableSvgPainterGenerator(
          mockSvgContent: '<svg/>',
        );
        final mockElement = MockElement();
        when(mockElement.name).thenReturn(null);

        final mockClassNameReader = MockConstantReader();
        when(mockAnnotation.read('painterClassName')).thenReturn(mockClassNameReader);
        when(mockClassNameReader.isNull).thenReturn(true);

        final mockExposureReader = MockConstantReader();
        when(mockAnnotation.read('exposureMode')).thenReturn(mockExposureReader);
        when(mockExposureReader.isNull).thenReturn(true);

        final mockPropertyMappingReader = MockConstantReader();
        when(mockAnnotation.read('propertyMapping')).thenReturn(mockPropertyMappingReader);
        when(mockPropertyMappingReader.isNull).thenReturn(false);

        // Add an invalid entry (null key/value)
        final mockKey = MockDartObject();
        when(mockKey.toStringValue()).thenReturn(null);
        when(
          mockPropertyMappingReader.mapValue,
        ).thenReturn(<DartObject?, DartObject?>{mockKey: MockDartObject()});

        // Act
        final String output = await gen.generateForAnnotatedElement(
          mockElement,
          mockAnnotation,
          mockBuildStep,
        );

        // Assert
        expect(output, contains(r'class _$Unknown extends CustomPainter {'));
      });
    });
  });
}
