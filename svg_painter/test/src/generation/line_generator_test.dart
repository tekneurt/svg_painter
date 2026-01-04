import 'package:svg_painter/src/generation/line_generator.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  const PaintingStyle strokeBlack = PaintingStyle(
    stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, width: 2.0),
  );

  group('LineGenerator', () {
    test('should generate drawLine when simple line is provided', () {
      // Arrange
      const LineGenerator generator = LineGenerator();
      const DrawLine command = DrawLine(
        x1: 0.0,
        y1: 0.0,
        x2: 100.0,
        y2: 100.0,
        style: strokeBlack,
      );
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(
        output,
        contains('canvas.drawLine(const Offset(0.0, 0.0), const Offset(100.0, 100.0), paint)'),
      );
      expect(output, contains('paint.strokeWidth = 2.0'));
    });
  });
}
