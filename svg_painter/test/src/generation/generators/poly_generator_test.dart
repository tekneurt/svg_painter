import 'package:svg_painter/src/generation/_generation.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const fillRed = PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFFFF0000));

  const strokeBlack = PaintingStyle(
    stroke: PaintingStrokeStyle(colorArgb: 0xFF000000),
  );

  group('PolyGenerator', () {
    const generator = PolyGenerator<DrawCommand>();

    test('should set path.fillType to evenOdd when fillRule is evenodd', () {
      // Arrange
      const command = DrawPolygon(
        points: <double>[1.0, 2.0, 10.0, 11.0, 20.0, 22.0],
        style: PaintingStyle(
          fill: PaintingFillStyle(
            colorArgb: 0xFFFF0000,
            fillRule: SvgFillRule.evenodd,
          ),
        ),
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer, painterClassName: 'TestPainter');

      // Assert
      final output = buffer.toString();
      expect(output, contains('path.fillType = PathFillType.evenOdd;'));
    });

    test('should generate moveTo/lineTo when DrawPolyline is provided', () {
      // Arrange
      const command = DrawPolyline(
        points: <double>[1.0, 2.0, 10.0, 11.0, 20.0, 22.0],
        style: strokeBlack,
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer, painterClassName: 'TestPainter');

      // Assert
      final output = buffer.toString();
      expect(output, contains('final Path path = Path()'));
      expect(output, contains('..moveTo(1.0, 2.0)'));
      expect(output, contains('..lineTo(10.0, 11.0)'));
      expect(output, contains('..lineTo(20.0, 22.0)'));
      expect(output, isNot(contains('..close()')));
    });

    test('should generate moveTo/lineTo/close when DrawPolygon is provided', () {
      // Arrange
      const command = DrawPolygon(
        points: <double>[1.0, 2.0, 10.0, 11.0, 20.0, 22.0],
        style: fillRed,
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer, painterClassName: 'TestPainter');

      // Assert
      final output = buffer.toString();
      expect(output, contains('final Path path = Path()'));
      expect(output, contains('..moveTo(1.0, 2.0)'));
      expect(output, contains('..lineTo(10.0, 11.0)'));
      expect(output, contains('..lineTo(20.0, 22.0)'));
      expect(output, contains('..close()'));
    });

    test('should generate dashed path with pathLength when provided', () {
      // Arrange
      const command = DrawPolygon(
        points: <double>[0.0, 0.0, 10.0, 0.0, 10.0, 10.0],
        style: PaintingStyle(
          stroke: PaintingStrokeStyle(
            colorArgb: 0xFF000000,
            dashArray: <double>[5.0, 5.0],
            pathLength: 100.0,
          ),
        ),
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer, painterClassName: 'TestPainter');

      // Assert
      final output = buffer.toString();
      expect(output, contains('canvas.drawPath('));
      expect(output, contains('path'));
      expect(output, contains('pathLength: 100.0'));
    });

    test('should return early when unsupported command type is provided', () {
      // Arrange
      const command = DrawCircle(cx: 0, cy: 0, radius: 5, style: PaintingStyle());
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(
        command,
        (buffer as dynamic) as GeneratorBuffer,
      ); // Type cast for safety in test context

      // Assert
      expect(buffer.toString().isEmpty, isTrue);
    });

    test('should generate dashed path with dashOffset when dashOffset is provided', () {
      // Arrange
      const command = DrawPolyline(
        points: <double>[1.0, 2.0, 10.0, 12.0, 25.0, 30.0],
        style: PaintingStyle(
          stroke: PaintingStrokeStyle(
            colorArgb: 0xFF000000,
            dashArray: <double>[4.0, 2.0],
            dashOffset: 3.5,
          ),
        ),
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer, painterClassName: 'TestPainter');

      // Assert
      final output = buffer.toString();
      expect(output, contains('_dashPath(path, dashArray, dashOffset: 3.5)'));
    });

    test('should emit start, mid, and end marker calls when markers are configured on polyline', () {
      // Arrange
      const command = DrawPolyline(
        points: <double>[0.0, 0.0, 10.0, 0.0, 20.0, 10.0],
        style: PaintingStyle(
          fill: PaintingFillStyle(colorArgb: 0xFF112233),
          stroke: PaintingStrokeStyle(colorArgb: 0xFF445566, width: 2.5),
          strokeWidth: 2.5,
          markerStartId: 'm-start',
          markerMidId: 'm-mid',
          markerEndId: 'm-end',
        ),
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer, painterClassName: 'TestPainter');

      // Assert
      final output = buffer.toString();
      expect(
        output,
        contains(
          '_marker_m_start(canvas, const Offset(0.0, 0.0), 0.0, 2.5, isStart: true, contextFill: fillPaint, contextStroke: strokePaint);',
        ),
      );
      expect(
        output,
        contains('_marker_m_mid(canvas, const Offset(10.0, 0.0),'),
      );
      expect(
        output,
        contains('_marker_m_end(canvas, const Offset(20.0, 10.0),'),
      );
    });
  });
}
