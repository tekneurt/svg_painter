import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_element_extensions/svg_circle_to_draw_circle.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const SvgPaintingContext context = SvgPaintingContext(viewBoxWidth: 100, viewBoxHeight: 100);

  group('SvgCircleToPaintCommands', () {
    test('should return Success with DrawCircle when valid SvgCircle is provided', () {
      // Arrange
      const SvgCircle circle = SvgCircle(
        cx: SvgLength(10.0),
        cy: SvgLength(20.0),
        r: SvgLength(5.0),
      );

      // Act
      final Result<List<PaintCommand>> result = circle.toPaintCommands(context);

      // Assert
      expect(result, isA<Success<List<PaintCommand>>>());
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      expect(commands, hasLength(1));
      expect(commands.first, isA<DrawCircle>());
      final DrawCircle drawCircle = commands.first as DrawCircle;
      expect(drawCircle.cx, 10.0);
      expect(drawCircle.cy, 20.0);
      expect(drawCircle.radius, 5.0);
    });

    test('should return empty list when radius is zero', () {
      // Arrange
      const SvgCircle circle = SvgCircle(
        cx: SvgLength(10.0),
        cy: SvgLength(20.0),
        r: SvgLength(0.0),
      );

      // Act
      final Result<List<PaintCommand>> result = circle.toPaintCommands(context);

      // Assert
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      expect(commands, isEmpty);
    });
  });
}
