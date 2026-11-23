import 'package:svg_painter/src/generation/_generation.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const strokeBlack = PaintingStyle(
    stroke: PaintingStrokeStyle(colorArgb: 0xFF000000),
  );

  group('PathGenerator', () {
    test('should set path.fillType to evenOdd when fillRule is evenodd', () {
      // Arrange
      const generator = PathGenerator();
      const command = DrawPath(
        operations: <PathOperation>[MoveTo(10.0, 11.0), LineTo(20.0, 21.0), ClosePath()],
        style: PaintingStyle(
          fill: PaintingFillStyle(
            colorArgb: 0xFFFF0000,
            fillRule: SvgFillRule.evenodd,
          ),
        ),
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(output, contains('path.fillType = PathFillType.evenOdd;'));
    });
    test('should generate Path with moveTo and lineTo when basic operations are provided', () {
      // Arrange
      const generator = PathGenerator();
      const command = DrawPath(
        operations: <PathOperation>[MoveTo(10.0, 11.0), LineTo(20.0, 21.0), ClosePath()],
        style: strokeBlack,
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(output, contains('final Path path = Path()'));
      expect(output, contains('..moveTo(10.0, 11.0)'));
      expect(output, contains('..lineTo(20.0, 21.0)'));
      expect(output, contains('..close()'));
      expect(output, contains('canvas.drawPath(path,'));
    });

    test('should generate curves when bezier operations are provided', () {
      // Arrange
      const generator = PathGenerator();
      const command = DrawPath(
        operations: <PathOperation>[
          MoveTo(10.0, 11.0),
          CubicTo(12.0, 13.0, 14.0, 15.0, 16.0, 17.0),
          QuadraticTo(18.0, 19.0, 20.0, 21.0),
        ],
        style: strokeBlack,
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(output, contains('..cubicTo(12.0, 13.0, 14.0, 15.0, 16.0, 17.0)'));
      expect(output, contains('..quadraticBezierTo(18.0, 19.0, 20.0, 21.0)'));
    });

    test('should generate arcToPoint when ArcTo is provided', () {
      // Arrange
      const generator = PathGenerator();
      const command = DrawPath(
        operations: <PathOperation>[
          MoveTo(10.0, 11.0),
          ArcTo(5.0, 6.0, 45.0, true, false, 20.0, 21.0),
        ],
        style: strokeBlack,
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(
        output,
        contains(
          '..arcToPoint(const Offset(20.0, 21.0), radius: const Radius.elliptical(5.0, 6.0), rotation: 45.0, largeArc: true, clockwise: false)',
        ),
      );
    });

    test('should generate dashed path when dashArray is provided', () {
      // Arrange
      const generator = PathGenerator();
      const command = DrawPath(
        operations: <PathOperation>[MoveTo(10.0, 11.0), LineTo(20.0, 21.0)],
        style: PaintingStyle(
          stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, dashArray: <double>[5.0, 6.0]),
        ),
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(output, contains('canvas.drawPath(_dashPath(path,'));
    });

    test('should generate dashed path with pathLength when provided', () {
      // Arrange
      const generator = PathGenerator();
      const command = DrawPath(
        operations: <PathOperation>[MoveTo(10.0, 11.0), LineTo(20.0, 21.0)],
        style: PaintingStyle(
          stroke: PaintingStrokeStyle(
            colorArgb: 0xFF000000,
            dashArray: <double>[5.0, 6.0],
            pathLength: 100.0,
          ),
        ),
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(output, contains('canvas.drawPath(_dashPath(path,'));
      expect(output, contains('pathLength: 100.0'));
    });

    test('should generate dashed path with dashOffset when dashOffset is provided', () {
      // Arrange
      const generator = PathGenerator();
      const command = DrawPath(
        operations: <PathOperation>[MoveTo(10.0, 11.0), LineTo(20.0, 21.0)],
        style: PaintingStyle(
          stroke: PaintingStrokeStyle(
            colorArgb: 0xFF000000,
            dashArray: <double>[5.0, 6.0],
            dashOffset: 2.5,
          ),
        ),
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(output, contains('_dashPath(path, dashArray, dashOffset: 2.5)'));
    });

    test('should emit start, mid, and end marker calls when markers are configured on DrawPath', () {
      // Arrange
      const generator = PathGenerator();
      const command = DrawPath(
        operations: <PathOperation>[
          MoveTo(0.0, 0.0),
          LineTo(10.0, 0.0),
          LineTo(20.0, 10.0),
        ],
        style: PaintingStyle(
          fill: PaintingFillStyle(colorArgb: 0xFF112233),
          stroke: PaintingStrokeStyle(colorArgb: 0xFF445566, width: 2.5),
          strokeWidth: 2.5,
          markerStartId: 'p-start',
          markerMidId: 'p-mid',
          markerEndId: 'p-end',
        ),
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(
        output,
        contains(
          '_marker_p_start(canvas, const Offset(0.0, 0.0), 0.0, 2.5, isStart: true, contextFill: fillPaint, contextStroke: strokePaint);',
        ),
      );
      expect(output, contains('_marker_p_mid(canvas, const Offset(10.0, 0.0),'));
      expect(output, contains('_marker_p_end(canvas, const Offset(20.0, 10.0),'));
    });
  });
}
