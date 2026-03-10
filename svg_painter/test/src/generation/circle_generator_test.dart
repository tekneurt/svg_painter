import 'package:svg_painter/src/generation/_generation.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  const PaintingStyle fillRed = PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFFFF0000));

  group('CircleGenerator', () {
    test('should generate drawCircle when simple circle is provided', () {
      // Arrange
      const CircleGenerator generator = CircleGenerator();
      const DrawCircle command = DrawCircle(cx: 10.0, cy: 20.0, radius: 5.0, style: fillRed);
      final GeneratorBuffer buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('canvas.drawCircle(const Offset(10.0, 20.0), 5.0, paint)'));
      expect(output, contains('paint.color = const Color(0xFFFF0000)'));
      expect(output, contains('paint.style = PaintingStyle.fill'));
    });

    test('should generate dashed path when dashArray is provided', () {
      // Arrange
      const CircleGenerator generator = CircleGenerator();
      const DrawCircle command = DrawCircle(
        cx: 10.0,
        cy: 20.0,
        radius: 5.0,
        style: PaintingStyle(
          stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, dashArray: <double>[2.0, 3.0]),
        ),
      );
      final GeneratorBuffer buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('final Path path = Path()..addOval'));
      expect(output, contains('canvas.drawPath(_dashPath(path, dashArray), paint)'));
      expect(output, contains('final List<double> dashArray = [2.0, 3.0]'));
    });

    test('should generate dashed path with pathLength when provided', () {
      // Arrange
      const CircleGenerator generator = CircleGenerator();
      const DrawCircle command = DrawCircle(
        cx: 10.0,
        cy: 20.0,
        radius: 5.0,
        style: PaintingStyle(
          stroke: PaintingStrokeStyle(
            colorArgb: 0xFF000000,
            dashArray: <double>[2.0, 3.0],
            pathLength: 100.0,
          ),
        ),
      );
      final GeneratorBuffer buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('canvas.drawPath(_dashPath(path, dashArray, pathLength: 100.0), paint)'));
    });
  });
}
