import 'package:svg_painter/src/generation/generator_buffer.dart';
import 'package:svg_painter/src/generation/generators/line_generator.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  const strokeBlack = PaintingStyle(
    stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, width: 2.0),
  );

  group('LineGenerator', () {
    test('should generate drawLine when simple line is provided', () {
      // Arrange
      const generator = LineGenerator();
      const command = DrawLine(
        x1: 10.0,
        y1: 20.0,
        x2: 100.0,
        y2: 200.0,
        style: strokeBlack,
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(
        output,
        contains('canvas.drawLine(const Offset(10.0, 20.0), const Offset(100.0, 200.0), paint)'),
      );
      expect(output, contains('paint.strokeWidth = 2.0'));
    });

    test('should generate dashed path when dashArray is provided', () {
      // Arrange
      const generator = LineGenerator();
      const command = DrawLine(
        x1: 10.0,
        y1: 20.0,
        x2: 30.0,
        y2: 40.0,
        style: PaintingStyle(
          stroke: PaintingStrokeStyle(
            colorArgb: 0xFF000000,
            dashArray: <double>[5.0, 5.0],
          ),
        ),
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(output, contains('final Path path = Path()..moveTo(10.0, 20.0)..lineTo(30.0, 40.0);'));
      expect(output, contains('canvas.drawPath(_dashPath(path, dashArray), paint);'));
    });

    test('should generate dashed path with pathLength when provided', () {
      // Arrange
      const generator = LineGenerator();
      const command = DrawLine(
        x1: 10.0,
        y1: 20.0,
        x2: 30.0,
        y2: 40.0,
        style: PaintingStyle(
          stroke: PaintingStrokeStyle(
            colorArgb: 0xFF000000,
            dashArray: <double>[5.0, 5.0],
            pathLength: 100.0,
          ),
        ),
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(
        output,
        contains('canvas.drawPath(_dashPath(path, dashArray, pathLength: 100.0), paint);'),
      );
    });

    test('should generate dashed path with dashOffset when provided', () {
      // Arrange
      const generator = LineGenerator();
      const command = DrawLine(
        x1: 10.0,
        y1: 20.0,
        x2: 30.0,
        y2: 40.0,
        style: PaintingStyle(
          stroke: PaintingStrokeStyle(
            colorArgb: 0xFF000000,
            dashArray: <double>[3.0, 1.0],
            dashOffset: 2.5,
          ),
        ),
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(
        output,
        contains('canvas.drawPath(_dashPath(path, dashArray, dashOffset: 2.5), paint);'),
      );
    });
  });
}
