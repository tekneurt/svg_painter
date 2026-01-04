import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_element_extensions/svg_path_to_draw_path.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:test/test.dart';

void main() {
  const SvgPaintingContext context = SvgPaintingContext(viewBoxWidth: 100, viewBoxHeight: 200);

  group('SvgPathToPaintCommands', () {
    test('should return Success with DrawPath when valid SvgPath is provided', () {
      // Arrange
      const SvgPath path = SvgPath(d: 'M 10 11 L 20 21');

      // Act
      final Result<List<PaintCommand>> result = path.toPaintCommands(context);

      // Assert
      expect(result, isA<Success<List<PaintCommand>>>());
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      expect(commands, hasLength(1));
      expect(commands.first, isA<DrawPath>());
      final DrawPath drawPath = commands.first as DrawPath;
      expect(drawPath.operations, hasLength(2));
    });

    test('should return empty list when d attribute is empty', () {
      // Arrange
      const SvgPath path = SvgPath(d: '');

      // Act
      final Result<List<PaintCommand>> result = path.toPaintCommands(context);

      // Assert
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      expect(commands, isEmpty);
    });
  });
}
