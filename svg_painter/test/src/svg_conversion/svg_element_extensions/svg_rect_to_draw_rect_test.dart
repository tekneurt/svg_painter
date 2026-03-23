import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_element_extensions/svg_rect_to_draw_rect.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const context = SvgPaintingContext(viewBoxWidth: 200, viewBoxHeight: 300);

  group('SvgRectToPaintCommands', () {
    test('should return Success with DrawRect when valid SvgRect is provided', () {
      // Arrange
      const rect = SvgRect(
        x: SvgLength(10.0),
        y: SvgLength(20.0),
        width: SvgLength(50.0),
        height: SvgLength(60.0),
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
      final drawRect = commands.first as DrawRect;
      expect(drawRect.x, 10.0);
      expect(drawRect.y, 20.0);
      expect(drawRect.width, 50.0);
      expect(drawRect.height, 60.0);
      expect(drawRect.rx, 0.0);
      expect(drawRect.ry, 0.0);
    });

    test('should return empty list when width is zero', () {
      // Arrange
      const rect = SvgRect(
        x: SvgLength(10.0),
        y: SvgLength(20.0),
        width: SvgLength(0.0),
        height: SvgLength(60.0),
        rx: SvgAuto(),
        ry: SvgAuto(),
      );

      // Act
      final Result<List<PaintCommand>> result = rect.toPaintCommands(context);

      // Assert
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      expect(commands, isEmpty);
    });

    test('should clamp radii to half of dimensions', () {
      // Arrange
      const rect = SvgRect(
        x: SvgLength(0.0),
        y: SvgLength(0.0),
        width: SvgLength(100.0),
        height: SvgLength(100.0),
        rx: SvgLength(60.0), // More than half width
        ry: SvgLength(70.0), // More than half height
      );

      // Act
      final Result<List<PaintCommand>> result = rect.toPaintCommands(context);

      // Assert
      final drawRect = (result as Success<List<PaintCommand>>).value.first as DrawRect;
      expect(drawRect.rx, 50.0);
      expect(drawRect.ry, 50.0);
    });
  });
}
