import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_element_extensions/svg_line_to_draw_line.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const context = SvgPaintingContext(viewBoxWidth: 200, viewBoxHeight: 300);

  group('SvgLineToPaintCommands', () {
    test('should return Success with DrawLine when valid SvgLine is provided', () {
      // Arrange
      const line = SvgLine(
        x1: SvgLength(10.0),
        y1: SvgLength(20.0),
        x2: SvgLength(100.0),
        y2: SvgLength(200.0),
      );

      // Act
      final Result<List<PaintCommand>> result = line.toPaintCommands(context);

      // Assert
      expect(result, isA<Success<List<PaintCommand>>>());
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      expect(commands, hasLength(1));
      expect(commands.first, isA<DrawLine>());
      final drawLine = commands.first as DrawLine;
      expect(drawLine.x1, 10.0);
      expect(drawLine.y1, 20.0);
      expect(drawLine.x2, 100.0);
      expect(drawLine.y2, 200.0);
    });
  });
}
