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
            x: 0.0,
            y: 0.0,
            width: 10.0,
            height: 10.0,
            rx: 0.0,
            ry: 0.0,
            style: PaintingStyle(
              fill: PaintingFillStyle(colorArgb: 0xFF0000FF),
            ),
          ),
        ],
        refX: 5.0,
        refY: 5.0,
        markerWidth: 2.0,
        markerHeight: 2.0,
        viewBox: SvgViewBox(0.0, 0.0, 10.0, 10.0),
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
          'void _marker_arrow1(Canvas canvas, Offset position, double tangentAngle, double strokeWidth, {bool isStart = false}) {',
        ),
      );
      expect(output, contains('canvas.save();'));
      expect(output, contains('canvas.translate(position.dx, position.dy);'));
      expect(output, contains('canvas.rotate(tangentAngle);'));
      expect(output, contains('canvas.scale(0.2, 0.2);'));
      expect(output, contains('canvas.translate(-5.0, -5.0);'));
      expect(output, contains('canvas.restore();'));
    });
  });
}
