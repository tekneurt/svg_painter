import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_element_extensions/svg_rect_to_draw_rect.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const SvgPaintingContext context = SvgPaintingContext(
    viewBoxWidth: 100,
    viewBoxHeight: 100,
  );

  group('SvgRectToPaintCommands', () {
    test('should return Success with DrawRect when valid SvgRect is provided', () {
      // Arrange
      const SvgRect rect = SvgRect(
        x: SvgLength(10.0),
        y: SvgLength(10.0),
        width: SvgLength(50.0),
        height: SvgLength(30.0),
        rx: SvgAuto(),
        ry: SvgAuto(),
      );

      // Act
      final Result<List<PaintCommand>> result = rect.toPaintCommands(context);

      // Assert
      expect(result, isA<Success<List<PaintCommand>>>());
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      expect(commands, hasLength(1));
      expect(commands.first, isA<DrawRect>());
      final DrawRect drawRect = commands.first as DrawRect;
      expect(drawRect.x, 10.0);
      expect(drawRect.width, 50.0);
      expect(drawRect.rx, 0.0);
    });
  });
}
