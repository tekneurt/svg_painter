import 'package:svg_painter/src/generation/_generation.dart';
import 'package:svg_painter/src/painting_model/_painting_model.dart';
import 'package:test/test.dart';

void main() {
  const fillRed = PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFFFF0000));
  const strokeDashed = PaintingStyle(
    stroke: PaintingStrokeStyle(colorArgb: 0xFF0000FF, dashArray: <double>[5.0, 5.0]),
  );

  group('OvalGenerator', () {
    test('should generate drawOval when oval is provided with solid fill', () {
      // Arrange
      const generator = OvalGenerator();
      const command = DrawOval(cx: 50.0, cy: 60.0, rx: 30.0, ry: 20.0, style: fillRed);
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer, painterClassName: 'TestPainter');

      // Assert
      final output = buffer.toString();
      expect(output, contains('canvas.drawOval(Rect.fromLTWH(20.0, 40.0, 60.0, 40.0), paint)'));
    });

    test('should generate _dashPath when oval is provided with dashed stroke', () {
      // Arrange
      const generator = OvalGenerator();
      const command = DrawOval(
        cx: 50.0,
        cy: 60.0,
        rx: 30.0,
        ry: 20.0,
        style: strokeDashed,
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer, painterClassName: 'TestPainter');

      // Assert
      final output = buffer.toString();
      expect(output, contains('final Path path = Path()..addOval('));
      expect(output, contains('Rect.fromLTWH(20.0, 40.0, 60.0, 40.0)'));
      expect(output, contains('final List<double> dashArray = [5.0, 5.0];'));
      expect(output, contains('canvas.drawPath(_dashPath(path, dashArray), paint)'));
    });

    test(
      'should generate _dashPath with pathLength when oval is provided with dashArray and pathLength',
      () {
        // Arrange
        const generator = OvalGenerator();
        const strokeDashedWithPathLength = PaintingStyle(
          stroke: PaintingStrokeStyle(
            colorArgb: 0xFF0000FF,
            dashArray: <double>[5.0, 5.0],
            pathLength: 100.0,
          ),
        );
        const command = DrawOval(
          cx: 50.0,
          cy: 60.0,
          rx: 30.0,
          ry: 20.0,
          style: strokeDashedWithPathLength,
        );
        final buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer, painterClassName: 'TestPainter');

        // Assert
        final output = buffer.toString();
        expect(output, contains('final List<double> dashArray = [5.0, 5.0];'));
        expect(
          output,
          contains('canvas.drawPath(_dashPath(path, dashArray, pathLength: 100.0), paint)'),
        );
      },
    );
  });
}
