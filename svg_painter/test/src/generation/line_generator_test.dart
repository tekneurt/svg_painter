import 'package:svg_painter/src/generation/line_generator.dart';
import 'package:svg_painter/src/painting_model/_painting_model.dart';
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
        x1: 10.0,
        y1: 20.0,
        x2: 100.0,
        y2: 200.0,
        style: strokeBlack,
      );
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(
        output,
        contains('canvas.drawLine(const Offset(10.0, 20.0), const Offset(100.0, 200.0), paint)'),
      );
      expect(output, contains('paint.strokeWidth = 2.0'));
    });
  });
}
