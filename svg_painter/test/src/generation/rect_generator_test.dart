import 'package:svg_painter/src/generation/rect_generator.dart';
import 'package:svg_painter/src/painting_model/_painting_model.dart';
import 'package:test/test.dart';

void main() {
  const PaintingStyle fillRed = PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFFFF0000));

  group('RectGenerator', () {
    test('should generate drawRect when simple rect is provided', () {
      // Arrange
      const RectGenerator generator = RectGenerator();
      const DrawRect command = DrawRect(
        x: 10.0,
        y: 20.0,
        width: 100.0,
        height: 50.0,
        rx: 0.0,
        ry: 0.0,
        style: fillRed,
      );
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('canvas.drawRect(Rect.fromLTWH(10.0, 20.0, 100.0, 50.0), paint)'));
    });

    test('should generate drawRRect when rounded rect is provided', () {
      // Arrange
      const RectGenerator generator = RectGenerator();
      const DrawRect command = DrawRect(
        x: 10.0,
        y: 20.0,
        width: 100.0,
        height: 50.0,
        rx: 5.0,
        ry: 8.0,
        style: fillRed,
      );
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(
        output,
        contains(
          'canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(10.0, 20.0, 100.0, 50.0), Radius.elliptical(5.0, 8.0)), paint)',
        ),
      );
    });
  });
}
