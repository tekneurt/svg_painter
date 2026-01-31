import 'package:svg_painter/src/generation/rect_generator.dart';
import 'package:svg_painter/src/painting_model/_painting_model.dart';
import 'package:test/test.dart';

void main() {
  const PaintingStyle fillRed = PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFFFF0000));
  const PaintingStyle strokeDashed = PaintingStyle(
    stroke: PaintingStrokeStyle(colorArgb: 0xFF0000FF, dashArray: <double>[5.0, 5.0]),
  );

  group('RectGenerator', () {
    test('should generate drawRect when simple rect is provided with solid fill', () {
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

    test('should generate drawRRect when rounded rect is provided with solid fill', () {
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
          'canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(10.0, 20.0, 100.0, 50.0), const Radius.elliptical(5.0, 8.0)), paint)',
        ),
      );
    });

    test('should generate _dashPath when simple rect is provided with dashed stroke', () {
      // Arrange
      const RectGenerator generator = RectGenerator();
      const DrawRect command = DrawRect(
        x: 10.0,
        y: 20.0,
        width: 100.0,
        height: 50.0,
        rx: 0.0,
        ry: 0.0,
        style: strokeDashed,
      );
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('final Path path = Path();'));
      expect(output, contains('path.addRect(Rect.fromLTWH(10.0, 20.0, 100.0, 50.0));'));
      expect(output, contains('final List<double> dashArray = [5.0, 5.0];'));
      expect(output, contains('canvas.drawPath(_dashPath(path, dashArray), paint)'));
    });

    test('should generate _dashPath when rounded rect is provided with dashed stroke', () {
      // Arrange
      const RectGenerator generator = RectGenerator();
      const DrawRect command = DrawRect(
        x: 10.0,
        y: 20.0,
        width: 100.0,
        height: 50.0,
        rx: 5.0,
        ry: 8.0,
        style: strokeDashed,
      );
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('final Path path = Path();'));
      expect(
        output,
        contains(
          'path.addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(10.0, 20.0, 100.0, 50.0), const Radius.elliptical(5.0, 8.0)));',
        ),
      );
      expect(output, contains('final List<double> dashArray = [5.0, 5.0];'));
      expect(output, contains('canvas.drawPath(_dashPath(path, dashArray), paint)'));
    });

    test(
      'should generate _dashPath with pathLength when rect is provided with dashArray and pathLength',
      () {
        // Arrange
        const RectGenerator generator = RectGenerator();
        const PaintingStyle strokeDashedWithPathLength = PaintingStyle(
          stroke: PaintingStrokeStyle(
            colorArgb: 0xFF0000FF,
            dashArray: <double>[5.0, 5.0],
            pathLength: 100.0,
          ),
        );
        const DrawRect command = DrawRect(
          x: 10.0,
          y: 20.0,
          width: 100.0,
          height: 50.0,
          rx: 0.0,
          ry: 0.0,
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
