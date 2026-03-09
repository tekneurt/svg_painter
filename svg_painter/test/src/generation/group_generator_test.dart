import 'package:svg_painter/src/generation/_generation.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('GroupGenerator', () {
    const GroupGenerator generator = GroupGenerator();

    final Map<Type, CommandGenerator<PaintCommand>> generators =
        <Type, CommandGenerator<PaintCommand>>{
          DrawCircle: const CircleGenerator(),
          DrawGroup: const GroupGenerator(),
        };

    test('should return early when generators map is null', () {
      // Arrange
      const DrawGroup command = DrawGroup(commands: <PaintCommand>[
        DrawCircle(cx: 0, cy: 0, radius: 5, style: PaintingStyle())
      ]);
      final GeneratorBuffer buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      expect(buffer.toString().isEmpty, isTrue);
    });

    test('should recursively generate code for children when DrawGroup is provided', () {
      // Arrange
      const DrawGroup command = DrawGroup(
        commands: <PaintCommand>[
          DrawCircle(
            cx: 55.5,
            cy: 66.6,
            radius: 12.3,
            style: PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFFFF1122)),
          ),
        ],
      );
      final GeneratorBuffer buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer, generators: generators);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('canvas.drawCircle(const Offset(55.5, 66.6), 12.3, paint)'));
    });

    test('should wrap with transform when transform is provided', () {
      // Arrange
      const DrawGroup command = DrawGroup(
        commands: <PaintCommand>[],
        style: PaintingStyle(
          transformAttributes: SvgTransformAttributes(<SvgTransformOperation>[SvgTranslate(12, 34)]),
        ),
      );
      final GeneratorBuffer buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer, generators: generators);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('canvas.save()'));
      expect(output, contains('canvas.translate(12.0, 34.0)'));
      expect(output, contains('canvas.restore()'));
    });

    test('should pass inherited properties to children when group has style but no ID', () {
      // Arrange
      final _SpyGenerator spy = _SpyGenerator();
      final Map<Type, CommandGenerator<PaintCommand>> spyGenerators =
          <Type, CommandGenerator<PaintCommand>>{DrawCircle: spy};

      final List<InheritedProperty> initialFills = <InheritedProperty>[
        const InheritedProperty('fillProp', colorArgb: 0xFF112233),
      ];
      final List<InheritedProperty> initialStrokes = <InheritedProperty>[
        const InheritedProperty('strokeProp', colorArgb: 0xFF445566),
      ];

      const DrawGroup command = DrawGroup(
        commands: <PaintCommand>[DrawCircle(cx: 0, cy: 0, radius: 0, style: PaintingStyle())],
      );
      final GeneratorBuffer buffer = GeneratorBuffer();

      // Act
      generator.generate(
        command,
        buffer,
        generators: spyGenerators,
        inheritedFills: initialFills,
        inheritedStrokes: initialStrokes,
      );

      // Assert
      expect(spy.lastInheritedFills, initialFills);
      expect(spy.lastInheritedStrokes, initialStrokes);
    });

    test(
      'should create and pass nextInheritedFills when group has ID and active fill property',
      () {
        // Arrange
        final _SpyGenerator spy = _SpyGenerator();
        final Map<Type, CommandGenerator<PaintCommand>> spyGenerators =
            <Type, CommandGenerator<PaintCommand>>{DrawCircle: spy};

        const DrawGroup command = DrawGroup(
          id: 'test-group',
          style: PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFF111111)),
          commands: <PaintCommand>[DrawCircle(cx: 0, cy: 0, radius: 0, style: PaintingStyle())],
        );
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(
          command,
          buffer,
          generators: spyGenerators,
          activeFillProperties: <String, String>{'testGroupFill': 'mappedFillProp'},
        );

        // Assert
        expect(spy.lastInheritedFills, hasLength(1));
        expect(spy.lastInheritedFills![0].propertyName, 'mappedFillProp');
        expect(spy.lastInheritedFills![0].colorArgb, 0xFF111111);
      },
    );

    test(
      'should create and pass nextInheritedStrokes when group has ID and active stroke property',
      () {
        // Arrange
        final _SpyGenerator spy = _SpyGenerator();
        final Map<Type, CommandGenerator<PaintCommand>> spyGenerators =
            <Type, CommandGenerator<PaintCommand>>{DrawCircle: spy};

        const DrawGroup command = DrawGroup(
          id: 'test-group',
          style: PaintingStyle(stroke: PaintingStrokeStyle(colorArgb: 0xFF222222)),
          commands: <PaintCommand>[DrawCircle(cx: 0, cy: 0, radius: 0, style: PaintingStyle())],
        );
        final GeneratorBuffer buffer = GeneratorBuffer();

        // Act
        generator.generate(
          command,
          buffer,
          generators: spyGenerators,
          activeStrokeProperties: <String, String>{'testGroupStroke': 'mappedStrokeProp'},
        );

        // Assert
        expect(spy.lastInheritedStrokes, hasLength(1));
        expect(spy.lastInheritedStrokes![0].propertyName, 'mappedStrokeProp');
        expect(spy.lastInheritedStrokes![0].colorArgb, 0xFF222222);
      },
    );
  });
}

class _SpyGenerator extends CommandGenerator<DrawCircle> {
  List<InheritedProperty>? lastInheritedFills;
  List<InheritedProperty>? lastInheritedStrokes;

  @override
  void generate(
    DrawCircle command,
    GeneratorBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
  }) {
    lastInheritedFills = inheritedFills;
    lastInheritedStrokes = inheritedStrokes;
  }
}
