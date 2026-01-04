import 'package:svg_painter/src/generation/path_generator.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
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
        operations: <PathOperation>[MoveTo(10.0, 11.0), LineTo(20.0, 21.0), ClosePath()],
        style: strokeBlack,
      );
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('final Path path = Path();'));
      expect(output, contains('path.moveTo(10.0, 11.0);'));
      expect(output, contains('path.lineTo(20.0, 21.0);'));
      expect(output, contains('path.close();'));
      expect(output, contains('canvas.drawPath(path, paint);'));
    });

    test('should generate curves when bezier operations are provided', () {
      // Arrange
      const PathGenerator generator = PathGenerator();
      const DrawPath command = DrawPath(
        operations: <PathOperation>[
          MoveTo(10.0, 11.0),
          CubicTo(12.0, 13.0, 14.0, 15.0, 16.0, 17.0),
          QuadraticTo(18.0, 19.0, 20.0, 21.0),
        ],
        style: strokeBlack,
      );
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('path.cubicTo(12.0, 13.0, 14.0, 15.0, 16.0, 17.0);'));
      expect(output, contains('path.quadraticBezierTo(18.0, 19.0, 20.0, 21.0);'));
    });

    test('should generate arcToPoint when ArcTo is provided', () {
      // Arrange
      const PathGenerator generator = PathGenerator();
      const DrawPath command = DrawPath(
        operations: <PathOperation>[
          MoveTo(10.0, 11.0),
          ArcTo(5.0, 6.0, 45.0, true, false, 20.0, 21.0),
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
          'path.arcToPoint(const Offset(20.0, 21.0), radius: const Radius.elliptical(5.0, 6.0), rotation: 45.0, largeArc: true, clockwise: false);',
        ),
      );
    });

    test('should generate dashed path when dashArray is provided', () {
      // Arrange
      const PathGenerator generator = PathGenerator();
      const DrawPath command = DrawPath(
        operations: <PathOperation>[MoveTo(10.0, 11.0), LineTo(20.0, 21.0)],
        style: PaintingStyle(
          stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, dashArray: <double>[5.0, 6.0]),
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
