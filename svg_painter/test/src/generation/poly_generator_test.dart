import 'package:svg_painter/src/generation/_generation.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  const PaintingStyle fillRed = PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFFFF0000));

  const PaintingStyle strokeBlack = PaintingStyle(
    stroke: PaintingStrokeStyle(colorArgb: 0xFF000000),
  );

  group('PolyGenerator', () {
    const PolyGenerator<DrawCommand> generator = PolyGenerator<DrawCommand>();

    test('should generate moveTo/lineTo when DrawPolyline is provided', () {
      // Arrange
      const DrawPolyline command = DrawPolyline(
        points: <double>[1.0, 2.0, 10.0, 11.0, 20.0, 22.0],
        style: strokeBlack,
      );
      final GeneratorBuffer buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer, painterClassName: 'TestPainter');

      // Assert
      final String output = buffer.toString();
      expect(output, contains('final Path path = Path()'));
      expect(output, contains('..moveTo(1.0, 2.0)'));
      expect(output, contains('..lineTo(10.0, 11.0)'));
      expect(output, contains('..lineTo(20.0, 22.0)'));
      expect(output, isNot(contains('..close()')));
    });

    test('should generate moveTo/lineTo/close when DrawPolygon is provided', () {
      // Arrange
      const DrawPolygon command = DrawPolygon(
        points: <double>[1.0, 2.0, 10.0, 11.0, 20.0, 22.0],
        style: fillRed,
      );
      final GeneratorBuffer buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer, painterClassName: 'TestPainter');

      // Assert
      final String output = buffer.toString();
      expect(output, contains('final Path path = Path()'));
      expect(output, contains('..moveTo(1.0, 2.0)'));
      expect(output, contains('..lineTo(10.0, 11.0)'));
      expect(output, contains('..lineTo(20.0, 22.0)'));
      expect(output, contains('..close()'));
    });

    test('should generate dashed path with pathLength when provided', () {
      // Arrange
      const DrawPolygon command = DrawPolygon(
        points: <double>[0.0, 0.0, 10.0, 0.0, 10.0, 10.0],
        style: PaintingStyle(
          stroke: PaintingStrokeStyle(
            colorArgb: 0xFF000000,
            dashArray: <double>[5.0, 5.0],
            pathLength: 100.0,
          ),
        ),
      );
      final GeneratorBuffer buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer, painterClassName: 'TestPainter');

      // Assert
      final String output = buffer.toString();
      expect(output, contains('canvas.drawPath('));
      expect(output, contains('path'));
      expect(output, contains('pathLength: 100.0'));
    });

    test('should return early when unsupported command type is provided', () {
      // Arrange
      const DrawCircle command = DrawCircle(cx: 0, cy: 0, radius: 5, style: PaintingStyle());
      final GeneratorBuffer buffer = GeneratorBuffer();

      // Act
      generator.generate(
        command,
        (buffer as dynamic) as GeneratorBuffer,
      ); // Type cast for safety in test context

      // Assert
      expect(buffer.toString().isEmpty, isTrue);
    });
  });
}
