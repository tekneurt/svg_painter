import 'package:svg_painter/src/generation/command_generator.dart';
import 'package:svg_painter/src/generation/generator_buffer.dart';
import 'package:svg_painter/src/generation/generators/marker_generator.dart';
import 'package:svg_painter/src/generation/generators/rect_generator.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('MarkerGenerator', () {
    test('should generate marker drawing function when DefineMarker is provided', () {
      // Arrange
      const generator = MarkerGenerator();
      final generators = <Type, CommandGenerator<PaintCommand>>{
        DrawRect: const RectGenerator(),
      };
      const command = DefineMarker(
        id: 'arrow1',
        commands: <PaintCommand>[
          DrawRect(
            x: 1.0,
            y: 2.0,
            width: 10.0,
            height: 20.0,
            rx: 0.0,
            ry: 0.0,
            style: PaintingStyle(
              fill: PaintingFillStyle(colorArgb: 0xFF0000FF),
            ),
          ),
        ],
        refX: 3.0,
        refY: 4.0,
        markerWidth: 2.0,
        markerHeight: 6.0,
        viewBox: SvgViewBox(0.0, 0.0, 8.0, 16.0),
        orient: SvgMarkerOrient.auto,
      );
      final buffer = GeneratorBuffer();

      // Act
      generator.generate(command, buffer, generators: generators);

      // Assert
      final output = buffer.toString();
      expect(
        output,
        contains(
          'void _marker_arrow1(Canvas canvas, Offset position, double tangentAngle, double strokeWidth, {bool isStart = false, Paint? contextFill, Paint? contextStroke}) {',
        ),
      );
      expect(output, contains('canvas.save();'));
      expect(output, contains('canvas.translate(position.dx, position.dy);'));
      expect(output, contains('canvas.rotate(tangentAngle);'));
      expect(output, contains('canvas.translate(-0.75, -1.5);'));
      expect(output, contains('canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 2.0, 6.0));'));
      expect(output, contains('canvas.scale(0.25, 0.375);'));
      expect(output, contains('canvas.restore();'));
    });

    test(
      'should generate correct translate with negative ref coordinates when refX and refY are negative',
      () {
        // Arrange
        const generator = MarkerGenerator();
        final generators = <Type, CommandGenerator<PaintCommand>>{
          DrawRect: const RectGenerator(),
        };
        const command = DefineMarker(
          id: 'negative_ref',
          commands: <PaintCommand>[
            DrawRect(
              x: 1.0,
              y: 2.0,
              width: 10.0,
              height: 12.0,
              rx: 0.0,
              ry: 0.0,
              style: PaintingStyle(
                fill: PaintingFillStyle(colorArgb: 0xFF0000FF),
              ),
            ),
          ],
          refX: -5.0,
          refY: -6.0,
          markerWidth: 4.0,
          markerHeight: 6.0,
          viewBox: SvgViewBox(-10.0, -12.0, 20.0, 24.0),
          orient: SvgMarkerOrient.auto,
        );
        final buffer = GeneratorBuffer();

        // Act
        generator.generate(command, buffer, generators: generators);

        // Assert
        final output = buffer.toString();
        // transX = (-5.0 - (-10.0)) * (4.0 / 20.0) = 5.0 * 0.2 = 1.0
        // transY = (-6.0 - (-12.0)) * (6.0 / 24.0) = 6.0 * 0.25 = 1.5
        expect(output, contains('canvas.translate(-1.0, -1.5);'));
        expect(output, contains('canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 4.0, 6.0));'));
        expect(output, contains('canvas.scale(0.2, 0.25);'));
        expect(output, contains('canvas.translate(10.0, 12.0);'));
      },
    );
  });
}
