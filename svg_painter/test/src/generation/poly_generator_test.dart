import 'package:svg_painter/src/generation/_generation.dart';
import 'package:svg_painter/src/painting_model/_painting_model.dart';
import 'package:test/test.dart';

void main() {
  const PaintingStyle fillRed = PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFFFF0000));

  const PaintingStyle strokeBlack = PaintingStyle(
    stroke: PaintingStrokeStyle(colorArgb: 0xFF000000),
  );

  group('PolyGenerator', () {
    test('should generate addPolygon with closed false when DrawPolyline is provided', () {
      // Arrange
      const PolyGenerator generator = PolyGenerator();
      const DrawPolyline command = DrawPolyline(
        points: <double>[0.0, 0.0, 10.0, 10.0, 20.0, 0.0],
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
          'path.addPolygon([const Offset(0.0, 0.0), const Offset(10.0, 10.0), const Offset(20.0, 0.0)], false);',
        ),
      );
    });

    test('should generate addPolygon with closed true when DrawPolygon is provided', () {
      // Arrange
      const PolyGenerator generator = PolyGenerator();
      const DrawPolygon command = DrawPolygon(
        points: <double>[0.0, 0.0, 10.0, 10.0, 20.0, 0.0],
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
          'path.addPolygon([const Offset(0.0, 0.0), const Offset(10.0, 10.0), const Offset(20.0, 0.0)], true);',
        ),
      );
    });
  });
}
