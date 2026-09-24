import 'package:svg_painter/src/generation/generator_buffer.dart';
import 'package:svg_painter/src/generation/generators/text_path_generator.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  const textStyle = PaintingStyle(
    fill: PaintingFillStyle(colorArgb: 0xFF123456),
    text: PaintingTextStyle(
      fontSize: 14.0,
      fontWeight: PaintingFontWeight.bold,
      fontStyle: PaintingFontStyle.normal,
      fontFamily: 'Roboto',
    ),
  );

  group('TextPathGenerator', () {
    test('should generate Path and character painting loop along metric when DrawTextPath is provided', () {
      // Arrange
      const generator = TextPathGenerator();
      const command = DrawTextPath(
        pathOperations: <PathOperation>[
          MoveTo(10.0, 90.0),
          QuadraticTo(90.0, 90.0, 90.0, 45.0),
        ],
        text: 'Fox',
        startOffset: 5.0,
        style: textStyle,
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(output, contains('..moveTo(10.0, 90.0)'));
      expect(output, contains('..quadraticBezierTo(90.0, 90.0, 90.0, 45.0)'));
      expect(output, contains('for (final metric in path.computeMetrics()) {'));
      expect(output, contains('double currentOffset = 5.0;'));
      expect(output, contains("final String text = 'Fox';"));
      expect(output, contains('metric.getTangentForOffset(distance)'));
      expect(output, contains('canvas.translate(tangent.position.dx, tangent.position.dy);'));
      expect(output, contains('canvas.rotate(-tangent.angle);'));
      expect(output, contains('fontSize: 14.0'));
      expect(output, contains('fontWeight: FontWeight.bold'));
      expect(output, contains("fontFamily: 'Roboto'"));
    });

    test('should wrap with opacity layer when groupOpacity is less than 1.0', () {
      // Arrange
      const generator = TextPathGenerator();
      const styleWithOpacity = PaintingStyle(
        fill: PaintingFillStyle(colorArgb: 0xFF000000),
        groupOpacity: 0.5,
      );
      const command = DrawTextPath(
        pathOperations: <PathOperation>[
          MoveTo(0.0, 0.0),
          LineTo(100.0, 100.0),
        ],
        text: 'Fade',
        style: styleWithOpacity,
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(output, contains('canvas.saveLayer(null, Paint()..color = const Color(0x80FFFFFF));'));
      expect(output, contains('canvas.restore();'));
    });
  });
}
