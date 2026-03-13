import 'package:svg_painter/src/generation/_generation.dart';
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
      final GeneratorBuffer buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('final Path _path_'));
      expect(output, contains('..moveTo(10.0, 11.0)'));
      expect(output, contains('..lineTo(20.0, 21.0)'));
      expect(output, contains('..close()'));
      expect(output, contains('canvas.drawPath(_path_'));
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
      final GeneratorBuffer buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('..cubicTo(12.0, 13.0, 14.0, 15.0, 16.0, 17.0)'));
      expect(output, contains('..quadraticBezierTo(18.0, 19.0, 20.0, 21.0)'));
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
      final GeneratorBuffer buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(
        output,
        contains(
          '..arcToPoint(const Offset(20.0, 21.0), radius: const Radius.elliptical(5.0, 6.0), rotation: 45.0, largeArc: true, clockwise: false)',
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
      final GeneratorBuffer buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('canvas.drawPath(_dashPath(_path_'));
    });

    test('should generate dashed path with pathLength when provided', () {
      // Arrange
      const PathGenerator generator = PathGenerator();
      const DrawPath command = DrawPath(
        operations: <PathOperation>[MoveTo(10.0, 11.0), LineTo(20.0, 21.0)],
        style: PaintingStyle(
          stroke: PaintingStrokeStyle(
            colorArgb: 0xFF000000,
            dashArray: <double>[5.0, 6.0],
            pathLength: 100.0,
          ),
        ),
      );
      final GeneratorBuffer buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('canvas.drawPath(_dashPath(_path_'));
      expect(output, contains('pathLength: 100.0'));
    });
  });
}
