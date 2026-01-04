import 'package:svg_painter/src/generation/oval_generator.dart';
import 'package:svg_painter/src/painting_model/_painting_model.dart';
import 'package:test/test.dart';

void main() {
  const PaintingStyle fillRed = PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFFFF0000));

  group('OvalGenerator', () {
    test('should generate drawOval when oval is provided', () {
      // Arrange
      const OvalGenerator generator = OvalGenerator();
      const DrawOval command = DrawOval(cx: 50.0, cy: 60.0, rx: 30.0, ry: 20.0, style: fillRed);
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(
        output,
        contains(
          'canvas.drawOval(Rect.fromCenter(center: const Offset(50.0, 60.0), width: 60.0, height: 40.0), paint)',
        ),
      );
    });
  });
}
