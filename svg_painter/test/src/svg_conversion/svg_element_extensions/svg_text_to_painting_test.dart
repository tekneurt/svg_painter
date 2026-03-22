import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_element_extensions/svg_text_to_painting.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const SvgPaintingContext context = SvgPaintingContext(viewBoxWidth: 100, viewBoxHeight: 200);

  group('SvgTextToPaintCommands', () {
    test('should return Success with DrawText when valid SvgText is provided', () {
      // Arrange
      const SvgText text = SvgText(
        x: SvgLength(10.0),
        y: SvgLength(20.0),
        children: <SvgTextContent>[SvgCharacterData('Hello')],
      );

      // Act
      final Result<List<PaintCommand>> result = text.toPaintCommands(context);

      // Assert
      expect(result, isA<Success<List<PaintCommand>>>());
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      expect(commands, hasLength(1));
      expect(commands.first, isA<DrawText>());
      final DrawText drawText = commands.first as DrawText;
      expect(drawText.rootSpan.children.first.text, 'Hello');
      expect(drawText.x, 10.0);
      expect(drawText.y, 20.0);
    });
  });
}
