import 'package:svg_painter/src/generation/_generation.dart';
import 'package:svg_painter/src/painting_model/_painting_model.dart';
import 'package:test/test.dart';

void main() {
  group('ShapeGenerators', () {
    const PaintingStyle fillRed = PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFFFF0000));

    const PaintingStyle strokeBlack = PaintingStyle(
      stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, width: 2.0),
    );

    group('CircleGenerator', () {
      test('should generate drawCircle when simple circle is provided', () {
        // Arrange
        const CircleGenerator generator = CircleGenerator();
        const DrawCircle command = DrawCircle(cx: 10.0, cy: 20.0, radius: 5.0, style: fillRed);
        final StringBuffer buffer = StringBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('canvas.drawCircle(const Offset(10.0, 20.0), 5.0, paint)'));
        expect(output, contains('paint.color = const Color(0xFFFF0000)'));
        expect(output, contains('paint.style = PaintingStyle.fill'));
      });

      test('should generate dashed path when dashArray is provided', () {
        // Arrange
        const CircleGenerator generator = CircleGenerator();
        const DrawCircle command = DrawCircle(
          cx: 10.0,
          cy: 20.0,
          radius: 5.0,
          style: PaintingStyle(
            stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, dashArray: <double>[2.0, 2.0]),
          ),
        );
        final StringBuffer buffer = StringBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('final Path path = Path()..addOval'));
        expect(output, contains('canvas.drawPath(_dashPath(path, dashArray), paint)'));
        expect(output, contains('final List<double> dashArray = [2.0, 2.0]'));
      });
    });

    group('OvalGenerator', () {
      test('should generate drawOval when oval is provided', () {
        // Arrange
        const OvalGenerator generator = OvalGenerator();
        const DrawOval command = DrawOval(cx: 50.0, cy: 50.0, rx: 30.0, ry: 20.0, style: fillRed);
        final StringBuffer buffer = StringBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(
          output,
          contains(
            'canvas.drawOval(Rect.fromCenter(center: const Offset(50.0, 50.0), width: 60.0, height: 40.0), paint)',
          ),
        );
      });
    });

    group('LineGenerator', () {
      test('should generate drawLine when simple line is provided', () {
        // Arrange
        const LineGenerator generator = LineGenerator();
        const DrawLine command = DrawLine(
          x1: 0.0,
          y1: 0.0,
          x2: 100.0,
          y2: 100.0,
          style: strokeBlack,
        );
        final StringBuffer buffer = StringBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(
          output,
          contains('canvas.drawLine(const Offset(0.0, 0.0), const Offset(100.0, 100.0), paint)'),
        );
        expect(output, contains('paint.strokeWidth = 2.0'));
      });
    });

    group('RectGenerator', () {
      test('should generate drawRect when simple rect is provided', () {
        // Arrange
        const RectGenerator generator = RectGenerator();
        const DrawRect command = DrawRect(
          x: 10.0,
          y: 10.0,
          width: 50.0,
          height: 30.0,
          rx: 0.0,
          ry: 0.0,
          style: fillRed,
        );
        final StringBuffer buffer = StringBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('canvas.drawRect(Rect.fromLTWH(10.0, 10.0, 50.0, 30.0), paint)'));
      });

      test('should generate drawRRect when rounded rect is provided', () {
        // Arrange
        const RectGenerator generator = RectGenerator();
        const DrawRect command = DrawRect(
          x: 10.0,
          y: 10.0,
          width: 50.0,
          height: 30.0,
          rx: 5.0,
          ry: 5.0,
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
            'canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(10.0, 10.0, 50.0, 30.0), Radius.elliptical(5.0, 5.0)), paint)',
          ),
        );
      });
    });
  });
}
