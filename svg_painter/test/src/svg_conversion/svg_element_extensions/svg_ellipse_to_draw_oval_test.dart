import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_element_extensions/svg_ellipse_to_draw_oval.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const SvgPaintingContext context = SvgPaintingContext(
    viewBoxWidth: 100,
    viewBoxHeight: 100,
  );

  group('SvgEllipseToPaintCommands', () {
    test('should return Success with DrawOval when valid SvgEllipse is provided', () {
      // Arrange
      const SvgEllipse ellipse = SvgEllipse(
        cx: SvgLength(50.0),
        cy: SvgLength(50.0),
        rx: SvgLength(20.0),
        ry: SvgLength(10.0),
      );

      // Act
      final Result<List<PaintCommand>> result = ellipse.toPaintCommands(context);

      // Assert
      expect(result, isA<Success<List<PaintCommand>>>());
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      expect(commands, hasLength(1));
      expect(commands.first, isA<DrawOval>());
      final DrawOval drawOval = commands.first as DrawOval;
      expect(drawOval.cx, 50.0);
      expect(drawOval.cy, 50.0);
      expect(drawOval.rx, 20.0);
      expect(drawOval.ry, 10.0);
    });

    test('should return empty list when rx is zero', () {
      // Arrange
      const SvgEllipse ellipse = SvgEllipse(
        cx: SvgLength(50.0),
        cy: SvgLength(50.0),
        rx: SvgLength(0.0),
        ry: SvgLength(10.0),
      );

      // Act
      final Result<List<PaintCommand>> result = ellipse.toPaintCommands(context);

      // Assert
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      expect(commands, isEmpty);
    });
  });
}
