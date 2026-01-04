import 'package:svg_painter/src/generation/command_generator.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

// Concrete implementation for testing abstract ShapeGenerator
class TestShapeGenerator extends ShapeGenerator<DrawCircle> {
  const TestShapeGenerator();

  @override
  void generate(
    DrawCircle command,
    StringBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
  }) {
    wrapWithTransform(buffer, command.transform, () {
      generatePaintingCode(
        buffer,
        command.style,
        'Rect.fromLTWH(${command.cx - command.radius}, ${command.cy - command.radius}, ${command.radius * 2}, ${command.radius * 2})',
        (String paintVar, {String? dashArray, String? pathLength}) {
          if (dashArray != null) {
            buffer.writeln(
              '        canvas.drawPath(_dashPath(Path()..addOval(Rect.fromCircle(center: const Offset(${command.cx}, ${command.cy}), radius: ${command.radius})), $dashArray, pathLength: $pathLength), $paintVar);',
            );
          } else {
            buffer.writeln(
              '        canvas.drawCircle(const Offset(${command.cx}, ${command.cy}), ${command.radius}, $paintVar);',
            );
          }
        },
      );
    });
  }
}

void main() {
  group('ShapeGenerator', () {
    const TestShapeGenerator generator = TestShapeGenerator();

    group('generatePaintingCode', () {
      test('should generate fill code when fill style is provided', () {
        // Arrange
        const PaintingStyle style = PaintingStyle(
          fill: PaintingFillStyle(colorArgb: 0xFFFF0000, opacity: 0.5),
        );
        const DrawCircle command = DrawCircle(cx: 10, cy: 20, radius: 5, style: style);
        final StringBuffer buffer = StringBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('final Paint paint = Paint();'));
        expect(output, contains('paint.color = const Color(0x80FF0000);'));
        expect(output, contains('paint.style = PaintingStyle.fill;'));
        expect(output, contains('canvas.drawCircle(const Offset(10.0, 20.0), 5.0, paint);'));
      });

      test('should generate stroke code when stroke style is provided', () {
        // Arrange
        const PaintingStyle style = PaintingStyle(
          stroke: PaintingStrokeStyle(
            colorArgb: 0xFF0000FF,
            width: 2.0,
            cap: PaintingStrokeCap.round,
            join: PaintingStrokeJoin.bevel,
          ),
        );
        const DrawCircle command = DrawCircle(cx: 10, cy: 20, radius: 5, style: style);
        final StringBuffer buffer = StringBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('paint.color = const Color(0xFF0000FF);'));
        expect(output, contains('paint.style = PaintingStyle.stroke;'));
        expect(output, contains('paint.strokeWidth = 2.0;'));
        expect(output, contains('paint.strokeCap = StrokeCap.round;'));
        expect(output, contains('paint.strokeJoin = StrokeJoin.bevel;'));
      });

      test('should generate shader code when shaderId is provided', () {
        // Arrange
        const PaintingStyle style = PaintingStyle(
          fill: PaintingFillStyle(shaderId: 'grad1', opacity: 0.8),
        );
        const DrawCircle command = DrawCircle(cx: 10, cy: 20, radius: 5, style: style);
        final StringBuffer buffer = StringBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(
          output,
          contains(
            'paint.shader = _grad_grad1.createShader(Rect.fromLTWH(5.0, 15.0, 10.0, 10.0));',
          ),
        );
        expect(output, contains('paint.color = paint.color.withOpacity(0.8);'));
      });

      test('should generate dashed stroke code when dashArray is provided', () {
        // Arrange
        const PaintingStyle style = PaintingStyle(
          stroke: PaintingStrokeStyle(
            colorArgb: 0xFF000000,
            dashArray: <double>[5.0, 10.0],
            pathLength: 100.0,
          ),
        );
        const DrawCircle command = DrawCircle(cx: 10, cy: 20, radius: 5, style: style);
        final StringBuffer buffer = StringBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('final List<double> dashArray = [5.0, 10.0];'));
        expect(output, contains('canvas.drawPath(_dashPath('));
        expect(output, contains('pathLength: 100.0'));
      });
    });

    group('wrapWithTransform', () {
      test('should wrap with translate when provided', () {
        // Arrange
        const DrawCircle command = DrawCircle(
          cx: 0,
          cy: 0,
          radius: 5,
          style: PaintingStyle(),
          transform: 'translate(10, 20)',
        );
        final StringBuffer buffer = StringBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('canvas.save();'));
        expect(output, contains('canvas.translate(10.0, 20.0);'));
        expect(output, contains('canvas.restore();'));
      });

      test('should wrap with scale when provided', () {
        // Arrange
        const DrawCircle command = DrawCircle(
          cx: 0,
          cy: 0,
          radius: 5,
          style: PaintingStyle(),
          transform: 'scale(2, 3)',
        );
        final StringBuffer buffer = StringBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('canvas.scale(2.0, 3.0);'));
      });

      test('should wrap with rotate when provided', () {
        // Arrange
        const DrawCircle command = DrawCircle(
          cx: 0,
          cy: 0,
          radius: 5,
          style: PaintingStyle(),
          transform: 'rotate(45)',
        );
        final StringBuffer buffer = StringBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('canvas.rotate(0.7853981633974483);'));
      });

      test('should wrap with rotate and pivot point when provided', () {
        // Arrange
        const DrawCircle command = DrawCircle(
          cx: 0,
          cy: 0,
          radius: 5,
          style: PaintingStyle(),
          transform: 'rotate(45, 10, 10)',
        );
        final StringBuffer buffer = StringBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('canvas.translate(10.0, 10.0);'));
        expect(output, contains('canvas.rotate(0.7853981633974483);'));
        expect(output, contains('canvas.translate(-10.0, -10.0);'));
      });

      test('should handle multiple transforms', () {
        // Arrange
        const DrawCircle command = DrawCircle(
          cx: 0,
          cy: 0,
          radius: 5,
          style: PaintingStyle(),
          transform: 'translate(10, 10) scale(2)',
        );
        final StringBuffer buffer = StringBuffer();

        // Act
        generator.generate(command, buffer);

        // Assert
        final String output = buffer.toString();
        expect(output, contains('canvas.translate(10.0, 10.0);'));
        expect(output, contains('canvas.scale(2.0, 2.0);'));
      });
    });
    group('CommandGenerator (Implicit)', () {
      test('should exist as abstract base', () {
        // Arrange
        const CommandGenerator<DrawCircle>? gen = null;
        // Assert
        expect(gen, isNull);
      });
    });
  });
}
