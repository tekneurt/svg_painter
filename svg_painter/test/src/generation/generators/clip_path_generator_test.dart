import 'package:svg_painter/src/generation/generator_buffer.dart';
import 'package:svg_painter/src/generation/generators/clip_path_generator.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  const dummyStyle = PaintingStyle();

  group('ClipPathGenerator', () {
    test('should generate clipPath method with userSpaceOnUse and child circle when provided', () {
      // Arrange
      const generator = ClipPathGenerator();
      const command = DefineClipPath(
        id: 'myClip',
        commands: <PaintCommand>[
          DrawCircle(cx: 40.0, cy: 35.0, radius: 35.0, style: dummyStyle),
        ],
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(output, contains('void _clipPath_myClip(Canvas canvas, Size size, Rect targetBounds) {'));
      expect(output, contains('final Path path = Path();'));
      expect(output, contains('path.addOval(Rect.fromCircle(center: const Offset(40.0, 35.0), radius: 35.0));'));
      expect(output, contains('canvas.clipPath(path);'));
    });

    test('should generate matrix transformation when clipPathUnits is objectBoundingBox', () {
      // Arrange
      const generator = ClipPathGenerator();
      const command = DefineClipPath(
        id: 'boxClip',
        clipPathUnits: PaintingGradientUnits.objectBoundingBox,
        commands: <PaintCommand>[
          DrawRect(x: 0.1, y: 0.2, width: 0.8, height: 0.6, rx: 0.0, ry: 0.0, style: dummyStyle),
        ],
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(output, contains('void _clipPath_boxClip(Canvas canvas, Size size, Rect targetBounds) {'));
      expect(output, contains('path.addRect(Rect.fromLTWH(0.1, 0.2, 0.8, 0.6));'));
      expect(output, contains('final Matrix4 matrix = Matrix4.identity()'));
      expect(output, contains('..translateByDouble(targetBounds.left, targetBounds.top, 0.0, 1.0)'));
      expect(output, contains('..scaleByDouble(targetBounds.width, targetBounds.height, 1.0, 1.0);'));
      expect(output, contains('canvas.clipPath(path.transform(matrix.storage));'));
    });

    test('should generate child path commands for rect with radius, oval, line, polygon, and path', () {
      // Arrange
      const generator = ClipPathGenerator();
      const command = DefineClipPath(
        id: 'multiClip',
        commands: <PaintCommand>[
          DrawRect(x: 5.0, y: 10.0, width: 50.0, height: 60.0, rx: 4.0, ry: 6.0, style: dummyStyle),
          DrawOval(cx: 25.0, cy: 30.0, rx: 12.0, ry: 15.0, style: dummyStyle),
          DrawLine(x1: 1.0, y1: 2.0, x2: 3.0, y2: 4.0, style: dummyStyle),
          DrawPolygon(points: <double>[10.0, 20.0, 30.0, 40.0], style: dummyStyle),
          DrawPolyline(points: <double>[5.0, 6.0, 7.0, 8.0], style: dummyStyle),
          DrawPath(
            operations: <PathOperation>[
              MoveTo(1.0, 2.0),
              LineTo(3.0, 4.0),
              CubicTo(5.0, 6.0, 7.0, 8.0, 9.0, 10.0),
              QuadraticTo(11.0, 12.0, 13.0, 14.0),
              ArcTo(15.0, 16.0, 0.0, false, true, 17.0, 18.0),
              ClosePath(),
            ],
            style: dummyStyle,
          ),
          DrawGroup(
            commands: <PaintCommand>[
              DrawCircle(cx: 1.0, cy: 2.0, radius: 3.0, style: dummyStyle),
            ],
          ),
        ],
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final output = buffer.toString();
      expect(output, contains('path.addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(5.0, 10.0, 50.0, 60.0), const Radius.elliptical(4.0, 6.0)));'));
      expect(output, contains('path.addOval(Rect.fromLTWH(13.0, 15.0, 24.0, 30.0));'));
      expect(output, contains('path.moveTo(1.0, 2.0);'));
      expect(output, contains('path.lineTo(3.0, 4.0);'));
      expect(output, contains('..moveTo(10.0, 20.0)'));
      expect(output, contains('..lineTo(30.0, 40.0)'));
      expect(output, contains('..close();'));
      expect(output, contains('..moveTo(5.0, 6.0)'));
      expect(output, contains('..lineTo(7.0, 8.0)'));
      expect(output, contains('..moveTo(1.0, 2.0)'));
      expect(output, contains('..lineTo(3.0, 4.0)'));
      expect(output, contains('..cubicTo(5.0, 6.0, 7.0, 8.0, 9.0, 10.0)'));
      expect(output, contains('..quadraticBezierTo(11.0, 12.0, 13.0, 14.0)'));
      expect(output, contains('..arcToPoint(const Offset(17.0, 18.0)'));
      expect(output, contains('..close()'));
      expect(output, contains('path.addOval(Rect.fromCircle(center: const Offset(1.0, 2.0), radius: 3.0));'));
    });
  });
}
