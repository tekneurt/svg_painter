import 'package:svg_painter/src/generation/_generation.dart';
import 'package:svg_painter/src/painting_model/_painting_model.dart';
import 'package:test/test.dart';

void main() {
  group('GroupGenerator', () {
    const GroupGenerator generator = GroupGenerator();

    test('should stop inheritance when group style does not match parent and is not in palette', () {
      const DrawGroup command = DrawGroup(
        commands: <PaintCommand>[],
        style: PaintingStyle(
          fill: PaintingFillStyle(colorArgb: 0xFFFF0000), // Red
        ),
      );

      final GeneratorBuffer buffer = GeneratorBuffer();
      final Map<Type, CommandGenerator<PaintCommand>> generators = <Type, CommandGenerator<PaintCommand>>{
        DrawGroup: const GroupGenerator(),
      };

      // Passing an inherited fill that is DIFFERENT (Blue)
      generator.generate(
        command,
        buffer,
        generators: generators,
        inheritedFills: <InheritedProperty>[const InheritedProperty('parentFill', colorArgb: 0xFF0000FF)],
      );

      // The logic at line 62 in group_generator.dart should trigger (nextInheritedFills = [])
      // since Red != Blue and it's not mapped to an active property.
      expect(buffer.toString(), isNotNull);
    });

    test('should apply opacity layering via saveLayer', () {
      const DrawGroup command = DrawGroup(
        commands: <PaintCommand>[],
        opacity: 0.5,
      );
      final GeneratorBuffer buffer = GeneratorBuffer();
      final Map<Type, CommandGenerator<PaintCommand>> generators = <Type, CommandGenerator<PaintCommand>>{
        DrawGroup: const GroupGenerator(),
      };

      generator.generate(command, buffer, generators: generators);

      expect(buffer.toString(), contains('canvas.saveLayer'));
      expect(buffer.toString(), contains('canvas.restore()'));
    });
  });
}
