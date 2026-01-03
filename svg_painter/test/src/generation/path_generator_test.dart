import 'package:svg_painter/src/generation/_generation.dart';
import 'package:svg_painter/src/painting_model/_painting_model.dart';
import 'package:test/test.dart';

void main() {
  const PaintingStyle strokeBlack = PaintingStyle(
    stroke: PaintingStrokeStyle(colorArgb: 0xFF000000),
  );

  group('PathGenerator', () {
    test('should generate Path with moveTo and lineTo when basic operations are provided', () {
      // Arrange
      const PathGenerator generator = PathGenerator();
      const DrawPath command = DrawPath(
        operations: <PathOperation>[MoveTo(10.0, 10.0), LineTo(20.0, 20.0), ClosePath()],
        style: strokeBlack,
      );
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('final Path path = Path();'));
      expect(output, contains('path.moveTo(10.0, 10.0);'));
      expect(output, contains('path.lineTo(20.0, 20.0);'));
      expect(output, contains('path.close();'));
      expect(output, contains('canvas.drawPath(path, paint);'));
    });

    test('should generate curves when bezier operations are provided', () {
      // Arrange
      const PathGenerator generator = PathGenerator();
      const DrawPath command = DrawPath(
        operations: <PathOperation>[
          MoveTo(0.0, 0.0),
          CubicTo(10.0, 10.0, 20.0, 20.0, 30.0, 30.0),
          QuadraticTo(40.0, 40.0, 50.0, 50.0),
        ],
        style: strokeBlack,
      );
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('path.cubicTo(10.0, 10.0, 20.0, 20.0, 30.0, 30.0);'));
      expect(output, contains('path.quadraticBezierTo(40.0, 40.0, 50.0, 50.0);'));
    });

    test('should generate arcToPoint when ArcTo is provided', () {
      // Arrange
      const PathGenerator generator = PathGenerator();
      const DrawPath command = DrawPath(
        operations: <PathOperation>[
          MoveTo(0.0, 0.0),
          ArcTo(5.0, 10.0, 45.0, true, false, 20.0, 20.0),
        ],
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
          'path.arcToPoint(const Offset(20.0, 20.0), radius: const Radius.elliptical(5.0, 10.0), rotation: 45.0, largeArc: true, clockwise: false);',
        ),
      );
    });

    test('should generate dashed path when dashArray is provided', () {
      // Arrange
      const PathGenerator generator = PathGenerator();
      const DrawPath command = DrawPath(
        operations: <PathOperation>[MoveTo(0.0, 0.0), LineTo(10.0, 10.0)],
        style: PaintingStyle(
          stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, dashArray: <double>[5.0, 5.0]),
        ),
      );
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('canvas.drawPath(_dashPath(path, dashArray), paint);'));
    });
  });
}
