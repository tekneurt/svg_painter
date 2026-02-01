import 'package:svg_painter/src/generation/poly_generator.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  const PaintingStyle fillRed = PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFFFF0000));

  const PaintingStyle strokeBlack = PaintingStyle(
    stroke: PaintingStrokeStyle(colorArgb: 0xFF000000),
  );

  group('PolyGenerator', () {
    const PolyGenerator generator = PolyGenerator();

    test('should generate addPolygon with closed false when DrawPolyline is provided', () {
      // Arrange
      const DrawPolyline command = DrawPolyline(
        points: <double>[1.0, 2.0, 10.0, 11.0, 20.0, 22.0],
        style: strokeBlack,
      );
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(
        output,
        contains(
          'path.addPolygon([const Offset(1.0, 2.0), const Offset(10.0, 11.0), const Offset(20.0, 22.0)], false);',
        ),
      );
    });

    test('should generate addPolygon with closed true when DrawPolygon is provided', () {
      // Arrange
      const DrawPolygon command = DrawPolygon(
        points: <double>[1.0, 2.0, 10.0, 11.0, 20.0, 22.0],
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
          'path.addPolygon([const Offset(1.0, 2.0), const Offset(10.0, 11.0), const Offset(20.0, 22.0)], true);',
        ),
      );
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
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('canvas.drawPath(_dashPath(path, dashArray, pathLength: 100.0), paint);'));
    });

    test('should generate dashed path without pathLength when not provided', () {
      // Arrange
      const DrawPolygon command = DrawPolygon(
        points: <double>[0.0, 0.0, 10.0, 0.0, 10.0, 10.0],
        style: PaintingStyle(
          stroke: PaintingStrokeStyle(
            colorArgb: 0xFF000000,
            dashArray: <double>[5.0, 5.0],
          ),
        ),
      );
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('canvas.drawPath(_dashPath(path, dashArray), paint);'));
    });

    test('should return early when unsupported command type is provided', () {
      // Arrange
      const DrawCircle command = DrawCircle(
        cx: 0,
        cy: 0,
        radius: 5,
        style: PaintingStyle(),
      );
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      expect(buffer.isEmpty, isTrue);
    });
  });
}
