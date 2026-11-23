import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/converters/use_to_painting.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_core_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_fill_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_graphics_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_presentation_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_stroke_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_viewport_attributes.dart';
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

    test('should emit DrawRect from feFlood bounds when href is empty and filterId is set', () {
      // Arrange
      const filter = SvgFilter(
        coreAttributes: SvgCoreAttributes(id: 'floodFilter'),
        children: <SvgElement>[
          SvgFeFlood(
            x: SvgLength(12.0),
            y: SvgLength(24.0),
            width: SvgLength(60.0),
            height: SvgLength(80.0),
            floodColor: SvgNamedColor(.green),
          ),
        ],
      );
      const context = SvgPaintingContext(
        viewBoxWidth: 200.0,
        viewBoxHeight: 300.0,
        definitions: <String, SvgElement>{'floodFilter': filter},
      );
      const use = SvgUse(
        x: SvgLength(5.0),
        y: SvgLength(10.0),
        presentationAttributes: SvgPresentationAttributes(
          graphics: SvgGraphicsAttributes(filter: 'url(#floodFilter)'),
        ),
      );

      // Act
      final Result<List<PaintCommand>> result = use.toPaintCommandsUse(context);

      // Assert
      final List<PaintCommand> commands = result.fold((_) => <PaintCommand>[], (s) => s);
      expect(commands, hasLength(1));
      final rect = commands.first as DrawRect;
      expect(rect.x, 12.0);
      expect(rect.y, 24.0);
      expect(rect.width, 60.0);
      expect(rect.height, 80.0);
      expect(rect.style.filterId, 'floodFilter');
    });

    test('should override nested SvgSvg dimensions when use targets an SvgSvg element', () {
      // Arrange
      const nestedSvg = SvgSvg(
        coreAttributes: SvgCoreAttributes(id: 'nestedSvg'),
        viewportAttributes: SvgViewportAttributes(viewBox: SvgViewBox(0.0, 0.0, 20.0, 20.0)),
        children: <SvgElement>[
          SvgCircle(cx: SvgLength(10.0), cy: SvgLength(10.0), r: SvgLength(5.0)),
        ],
      );
      const context = SvgPaintingContext(
        viewBoxWidth: 200.0,
        viewBoxHeight: 300.0,
        definitions: <String, SvgElement>{'nestedSvg': nestedSvg},
      );
      const use = SvgUse(
        href: '#nestedSvg',
        x: SvgLength(15.0),
        y: SvgLength(25.0),
        width: SvgLength(40.0),
        height: SvgLength(60.0),
        coreAttributes: SvgCoreAttributes(id: 'useInstance'),
      );

      // Act
      final Result<List<PaintCommand>> result = use.toPaintCommandsUse(context);

      // Assert
      final List<PaintCommand> commands = result.fold((_) => <PaintCommand>[], (s) => s);
      expect(commands, hasLength(1));
      final group = commands.first as DrawGroup;
      expect(group.id, 'useInstance');
      expect(group.commands, hasLength(1));
    });
  });
}
