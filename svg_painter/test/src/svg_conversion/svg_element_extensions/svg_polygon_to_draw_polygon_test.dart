import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_element_extensions/svg_polygon_to_draw_polygon.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const SvgPaintingContext context = SvgPaintingContext(
    viewBoxWidth: 100,
    viewBoxHeight: 100,
  );

  group('SvgPolygonToPaintCommands', () {
    test('should return Success with DrawPolygon when valid SvgPolygon is provided', () {
      // Arrange
      const SvgPolygon polygon = SvgPolygon(
        points: SvgPointList(<double>[0.0, 0.0, 10.0, 10.0, 20.0, 0.0]),
      );

      // Act
      final Result<List<PaintCommand>> result = polygon.toPaintCommands(context);

      // Assert
      expect(result, isA<Success<List<PaintCommand>>>());
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      expect(commands, hasLength(1));
      expect(commands.first, isA<DrawPolygon>());
      final DrawPolygon drawPolygon = commands.first as DrawPolygon;
      expect(drawPolygon.points, <double>[0.0, 0.0, 10.0, 10.0, 20.0, 0.0]);
    });

    test('should return empty list when less than 2 points are provided', () {
      // Arrange
      const SvgPolygon polygon = SvgPolygon(
        points: SvgPointList(<double>[0.0, 0.0]),
      );

      // Act
      final Result<List<PaintCommand>> result = polygon.toPaintCommands(context);

      // Assert
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      expect(commands, isEmpty);
    });
  });
}
