import 'package:svg_painter/src/generation/circle_generator.dart';
import 'package:svg_painter/src/generation/command_generator.dart';
import 'package:svg_painter/src/generation/group_generator.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('GroupGenerator', () {
    final Map<Type, CommandGenerator<PaintCommand>> generators =
        <Type, CommandGenerator<PaintCommand>>{
          DrawCircle: const CircleGenerator(),
          DrawGroup: const GroupGenerator(),
        };

    test('should recursively generate code for children when DrawGroup is provided', () {
      // Arrange
      const GroupGenerator generator = GroupGenerator();
      const DrawGroup command = DrawGroup(
        commands: <PaintCommand>[
          DrawCircle(
            cx: 50.0,
            cy: 50.0,
            radius: 10.0,
            style: PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFFFF0000)),
          ),
        ],
      );
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer, generators: generators);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('canvas.drawCircle(const Offset(50.0, 50.0), 10.0, paint)'));
    });

    test('should generate saveLayer when groupOpacity is less than 1.0', () {
      // Arrange
      const GroupGenerator generator = GroupGenerator();
      const DrawGroup command = DrawGroup(commands: <PaintCommand>[], groupOpacity: 0.5);
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer, generators: generators);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('canvas.saveLayer('));
      expect(output, contains('Paint()..color = Color.fromRGBO(255, 255, 255, 0.5)'));
      expect(output, contains('canvas.restore()'));
    });

    test('should wrap with transform when transform is provided', () {
      // Arrange
      const GroupGenerator generator = GroupGenerator();
      const DrawGroup command = DrawGroup(
        commands: <PaintCommand>[],
        transform: 'translate(10, 20)',
      );
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer, generators: generators);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('canvas.save()'));
      expect(output, contains('canvas.translate(10.0, 20.0)'));
      expect(output, contains('canvas.restore()'));
    });
  });
}
