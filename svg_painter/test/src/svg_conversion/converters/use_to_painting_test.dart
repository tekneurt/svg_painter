import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/converters/use_to_painting.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_core_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_fill_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_presentation_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_stroke_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgUseToPaintCommands', () {
    test('should resolve target definition correctly when valid href is provided', () {
      // Arrange
      const circle = SvgCircle(
        cx: SvgLength(12),
        cy: SvgLength(34),
        r: SvgLength(15),
        coreAttributes: SvgCoreAttributes(id: 'c1'),
      );
      const context = SvgPaintingContext(
        viewBoxWidth: 150,
        viewBoxHeight: 250,
        definitions: <String, SvgElement>{'c1': circle},
      );
      const use = SvgUse(
        href: '#c1',
        x: SvgLength(5),
        y: SvgLength(8),
      );

      // Act
      final Result<List<PaintCommand>> result = use.toPaintCommandsUse(context);

      // Assert
      expect(result.fold((f) => false, (s) => true), isTrue);
      expect(result.fold((f) => <PaintCommand>[], (s) => s).length, equals(1));
    });

    test('should return Failure when target definition is missing', () {
      // Arrange
      const context = SvgPaintingContext(viewBoxWidth: 120, viewBoxHeight: 240);
      const use = SvgUse(
        href: '#missing',
        x: SvgLength(7),
        y: SvgLength(14),
      );

      // Act
      final Result<List<PaintCommand>> result = use.toPaintCommandsUse(context);

      // Assert
      expect(result.fold((f) => true, (s) => false), isTrue);
      expect(
        result.fold((f) => f.message, (s) => ''),
        contains('Could not find definition'),
      );
    });

    test('should inherit context-fill and context-stroke when target uses context colors', () {
      // Arrange
      const circle = SvgCircle(
        cx: SvgLength(20),
        cy: SvgLength(30),
        r: SvgLength(15),
        coreAttributes: SvgCoreAttributes(id: 'contextTarget'),
        presentationAttributes: SvgPresentationAttributes(
          fill: SvgFillAttributes(color: SvgContextFillColor()),
          stroke: SvgStrokeAttributes(color: SvgContextStrokeColor()),
        ),
      );
      const context = SvgPaintingContext(
        viewBoxWidth: 300,
        viewBoxHeight: 400,
        definitions: <String, SvgElement>{'contextTarget': circle},
      );
      const use = SvgUse(
        href: '#contextTarget',
        x: SvgLength(10),
        y: SvgLength(20),
        presentationAttributes: SvgPresentationAttributes(
          fill: SvgFillAttributes(color: SvgNamedColor(SvgColorName.red)),
          stroke: SvgStrokeAttributes(color: SvgNamedColor(SvgColorName.blue)),
        ),
      );

      // Act
      final Result<List<PaintCommand>> result = use.toPaintCommandsUse(context);

      // Assert
      expect(result.fold((f) => false, (s) => true), isTrue);
      final List<PaintCommand> commands = result.fold((f) => <PaintCommand>[], (s) => s);
      expect(commands.length, equals(1));
      final group = commands.first as DrawGroup;
      expect(group.commands.length, equals(1));
      final drawnCircle = group.commands.first as DrawCircle;
      expect(drawnCircle.style.fill?.colorArgb, equals(0xFFFF0000)); // red
      expect(drawnCircle.style.stroke?.colorArgb, equals(0xFF0000FF)); // blue
    });
  });
}
