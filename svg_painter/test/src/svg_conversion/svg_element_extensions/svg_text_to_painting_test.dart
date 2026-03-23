import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_element_extensions/svg_text_to_painting.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const context = SvgPaintingContext(viewBoxWidth: 100, viewBoxHeight: 200);

  group('SvgTextToPaintCommands', () {
    test('should return Success with DrawText when valid SvgText is provided', () {
      // Arrange
      const text = SvgText(
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
      final drawText = commands.first as DrawText;
      expect(drawText.rootSpan.children.first.text, 'Hello');
      expect(drawText.x, 10.0);
      expect(drawText.y, 20.0);
    });

    test('should handle nested tspan with relative dx, dy and rotate', () {
      const text = SvgText(
        x: SvgLength(10),
        y: SvgLength(20),
        children: [
          SvgCharacterData('Outer'),
          SvgTspan(
            dx: SvgLength(5),
            dy: SvgLength(5),
            rotate: SvgGenericNumber(10),
            children: [
              SvgCharacterData('Inner'),
            ],
          ),
        ],
      );

      final result = text.toPaintCommands(context);
      final cmds = (result as Success<List<PaintCommand>>).value;
      final drawText = cmds.single as DrawText;

      expect(drawText.rootSpan.children, hasLength(2));
      expect(drawText.rootSpan.children[0].text, 'Outer');

      final tspanSpan = drawText.rootSpan.children[1];
      expect(tspanSpan.text, isNull);
      expect(tspanSpan.children, hasLength(1));
      expect(tspanSpan.children[0].text, 'Inner');
    });
  });
}
