import 'package:svg_painter/src/generation/_generation.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  const textStyle = PaintingStyle(
    fill: PaintingFillStyle(colorArgb: 0xFF000000),
    text: PaintingTextStyle(
      fontSize: 12.0,
      fontWeight: PaintingFontWeight.bold,
      fontStyle: PaintingFontStyle.italic,
      fontFamily: 'Roboto',
    ),
  );

  group('TextGenerator', () {
    test('should generate TextPainter with correct properties when DrawText is provided', () {
      // Arrange
      const generator = TextGenerator();
      const command = DrawText(
        x: 10.0,
        y: 20.0,
        rootSpan: PaintingTextSpan(text: 'Hello SVG'),
        style: textStyle,
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer, painterClassName: 'TestPainter');

      // Assert
      final output = buffer.toString();
      expect(output, contains("text: 'Hello SVG'"));
      expect(output, contains('fontSize: 12.0'));
      expect(output, contains("fontFamily: 'Roboto'"));
      expect(output, contains('fontWeight: FontWeight.bold'));
      expect(output, contains('fontStyle: FontStyle.italic'));
      expect(output, contains('..layout()'));
      expect(
        output,
        contains(
          'tp.paint(canvas, Offset(10.0, 20.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic)))',
        ),
      );
    });
  });
}
