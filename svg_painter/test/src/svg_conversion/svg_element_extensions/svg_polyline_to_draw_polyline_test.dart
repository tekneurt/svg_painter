import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_element_extensions/svg_polyline_to_draw_polyline.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const SvgPaintingContext context = SvgPaintingContext(
    viewBoxWidth: 100,
    viewBoxHeight: 100,
  );

  group('SvgPolylineToPaintCommands', () {
    test('should return Success with DrawPolyline when valid SvgPolyline is provided', () {
      // Arrange
      const SvgPolyline polyline = SvgPolyline(
        points: SvgPointList(<double>[0.0, 0.0, 50.0, 50.0, 100.0, 0.0]),
      );

      // Act
      final Result<List<PaintCommand>> result = polyline.toPaintCommands(context);

      // Assert
      expect(result, isA<Success<List<PaintCommand>>>());
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      expect(commands, hasLength(1));
      expect(commands.first, isA<DrawPolyline>());
      final DrawPolyline drawPolyline = commands.first as DrawPolyline;
      expect(drawPolyline.points, <double>[0.0, 0.0, 50.0, 50.0, 100.0, 0.0]);
    });
  });
}
