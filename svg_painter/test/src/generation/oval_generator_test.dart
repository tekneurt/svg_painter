import 'package:svg_painter/src/generation/oval_generator.dart';
import 'package:svg_painter/src/painting_model/_painting_model.dart';
import 'package:test/test.dart';

void main() {
  const PaintingStyle fillRed = PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFFFF0000));
  const PaintingStyle strokeDashed = PaintingStyle(
    stroke: PaintingStrokeStyle(colorArgb: 0xFF0000FF, dashArray: <double>[5.0, 5.0]),
  );

  group('OvalGenerator', () {
    test('should generate drawOval when oval is provided with solid fill', () {
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

    test('should generate _dashPath when oval is provided with dashed stroke', () {
      // Arrange
      const OvalGenerator generator = OvalGenerator();
      const DrawOval command = DrawOval(
        cx: 50.0,
        cy: 60.0,
        rx: 30.0,
        ry: 20.0,
        style: strokeDashed,
      );
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('final Path path = Path()..addOval('));
      expect(output, contains('Rect.fromCenter(center: const Offset(50.0, 60.0)'));
      expect(output, contains('final List<double> dashArray = [5.0, 5.0];'));
      expect(output, contains('canvas.drawPath(_dashPath(path, dashArray), paint)'));
    });

    test(
      'should generate _dashPath with pathLength when oval is provided with dashArray and pathLength',
      () {
        // Arrange
        const OvalGenerator generator = OvalGenerator();
        const PaintingStyle strokeDashedWithPathLength = PaintingStyle(
          stroke: PaintingStrokeStyle(
            colorArgb: 0xFF0000FF,
            dashArray: <double>[5.0, 5.0],
            pathLength: 100.0,
          ),
        );
        const DrawOval command = DrawOval(
          cx: 50.0,
          cy: 60.0,
          rx: 30.0,
          ry: 20.0,
          style: strokeDashedWithPathLength,
        );
        final StringBuffer buffer = StringBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('final List<double> dashArray = [5.0, 5.0];'));
        expect(
          output,
          contains('canvas.drawPath(_dashPath(path, dashArray, pathLength: 100.0), paint)'),
        );
      },
    );
  });
}
