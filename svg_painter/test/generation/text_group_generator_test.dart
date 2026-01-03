import 'package:svg_painter/src/generation/_generation.dart';
import 'package:svg_painter/src/painting_model/_painting_model.dart';
import 'package:test/test.dart';

void main() {
  group('Text & Group Generators', () {
    const PaintingStyle textStyle = PaintingStyle(
      fill: PaintingFillStyle(colorArgb: 0xFF000000),
      text: PaintingTextStyle(
        fontSize: 12.0,
        fontFamily: 'Roboto',
        fontWeight: 'bold',
        fontStyle: 'italic',
      ),
    );

    group('TextGenerator', () {
      test('should generate TextPainter with correct properties when DrawText is provided', () {
        // Arrange
        const TextGenerator generator = TextGenerator();
        const DrawText command = DrawText(x: 10.0, y: 20.0, text: 'Hello SVG', style: textStyle);
        final StringBuffer buffer = StringBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains("text: '''Hello SVG'''"));
        expect(output, contains('fontSize: 12.0'));
        expect(output, contains("fontFamily: 'Roboto'"));
        expect(output, contains('fontWeight: FontWeight.bold'));
        expect(output, contains('fontStyle: FontStyle.italic'));
        expect(output, contains('tp.layout()'));
        expect(
          output,
          contains(
            'tp.paint(canvas, Offset(10.0, 20.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic)))',
          ),
        );
      });
    });

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
  });
}
