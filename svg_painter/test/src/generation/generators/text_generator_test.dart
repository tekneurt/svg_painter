import 'package:svg_painter/src/generation/generator_buffer.dart';
import 'package:svg_painter/src/generation/generators/text_generator.dart';
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

    test('should escape single quotes in text', () {
      // Arrange
      const generator = TextGenerator();
      const command = DrawText(
        x: 15.0,
        y: 25.0,
        rootSpan: PaintingTextSpan(text: "It's a test"),
        style: textStyle,
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      expect(buffer.toString(), contains(r"text: 'It\'s a test'"));
    });

    test('should offset x position by half width when textAnchor is middle', () {
      // Arrange
      const generator = TextGenerator();
      const middleStyle = PaintingStyle(
        fill: PaintingFillStyle(colorArgb: 0xFF000000),
        text: PaintingTextStyle(
          fontSize: 14.0,
          fontWeight: PaintingFontWeight.normal,
          fontStyle: PaintingFontStyle.normal,
          fontFamily: 'Verdana',
          textAnchor: PaintingTextAnchor.middle,
        ),
      );
      const command = DrawText(
        x: 60.0,
        y: 75.0,
        rootSpan: PaintingTextSpan(text: 'Anchor Middle'),
        style: middleStyle,
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(
        output,
        contains(
          'tp.paint(canvas, Offset(60.0 - tp.width / 2.0, 75.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic)))',
        ),
      );
    });

    test('should offset x position by full width when textAnchor is end', () {
      // Arrange
      const generator = TextGenerator();
      const endStyle = PaintingStyle(
        fill: PaintingFillStyle(colorArgb: 0xFF000000),
        text: PaintingTextStyle(
          fontSize: 16.0,
          fontWeight: PaintingFontWeight.normal,
          fontStyle: PaintingFontStyle.normal,
          fontFamily: 'Arial',
          textAnchor: PaintingTextAnchor.end,
        ),
      );
      const command = DrawText(
        x: 60.0,
        y: 110.0,
        rootSpan: PaintingTextSpan(text: 'Anchor End'),
        style: endStyle,
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(
        output,
        contains(
          'tp.paint(canvas, Offset(60.0 - tp.width, 110.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic)))',
        ),
      );
    });
  });
}
