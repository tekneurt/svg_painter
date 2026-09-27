import 'package:svg_painter/src/svg_model/attribute_groups/svg_fill_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_presentation_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_stroke_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgPresentationAttributes', () {
    test('should return correct string representation when all fields are populated', () {
      // Arrange
      const attrs = SvgPresentationAttributes(
        fill: SvgFillAttributes(color: SvgNamedColor(SvgColorName.red)),
        paintOrder: SvgPaintOrder(<SvgPaintOrderComponent>[
          SvgPaintOrderComponent.stroke,
          SvgPaintOrderComponent.fill,
          SvgPaintOrderComponent.markers,
        ]),
      );

      // Act
      final result = attrs.toString();

      // Assert
      expect(result, contains('fill: SvgFillAttributes(color: SvgNamedColor(red))'));
      expect(result, contains('paint-order: SvgPaintOrder(stroke fill markers)'));
    });

    test('should merge paintOrder when other has paintOrder', () {
      // Arrange
      const parent = SvgPresentationAttributes(
        paintOrder: SvgPaintOrder.normal,
      );
      const child = SvgPresentationAttributes(
        paintOrder: SvgPaintOrder(<SvgPaintOrderComponent>[
          SvgPaintOrderComponent.stroke,
          SvgPaintOrderComponent.fill,
          SvgPaintOrderComponent.markers,
        ]),
      );

      // Act
      final SvgPresentationAttributes merged = parent.merge(child);

      // Assert
      expect(merged.paintOrder, child.paintOrder);
    });

    test('should inherit paintOrder from parent when child has null paintOrder', () {
      // Arrange
      const parent = SvgPresentationAttributes(
        paintOrder: SvgPaintOrder(<SvgPaintOrderComponent>[
          SvgPaintOrderComponent.stroke,
          SvgPaintOrderComponent.fill,
          SvgPaintOrderComponent.markers,
        ]),
      );
      const child = SvgPresentationAttributes();

      // Act
      final SvgPresentationAttributes inherited = child.inherit(parent);

      // Assert
      expect(inherited.paintOrder, parent.paintOrder);
    });

    test(
      'should resolve currentColor on fill using effectiveColor when child defines currentColor and color',
      () {
        // Arrange
        const child = SvgPresentationAttributes(
          color: SvgNamedColor(SvgColorName.lime),
          fill: SvgFillAttributes(color: SvgCurrentColor()),
        );
        const parent = SvgPresentationAttributes(
          color: SvgNamedColor(SvgColorName.blue),
        );

        // Act
        final SvgPresentationAttributes inherited = child.inherit(parent);

        // Assert
        expect(
          inherited.fill?.color,
          isA<SvgNamedColor>().having((SvgNamedColor c) => c.name, 'name', SvgColorName.lime),
        );
      },
    );

    test(
      'should resolve currentColor on stroke using effectiveColor when child defines currentColor and parent defines color',
      () {
        // Arrange
        const child = SvgPresentationAttributes(
          stroke: SvgStrokeAttributes(color: SvgCurrentColor()),
        );
        const parent = SvgPresentationAttributes(
          color: SvgNamedColor(SvgColorName.purple),
        );

        // Act
        final SvgPresentationAttributes inherited = child.inherit(parent);

        // Assert
        expect(
          inherited.stroke?.color,
          isA<SvgNamedColor>().having((SvgNamedColor c) => c.name, 'name', SvgColorName.purple),
        );
      },
    );

    test('should preserve currentColor on fill when effectiveColor is null', () {
      // Arrange
      const child = SvgPresentationAttributes(
        fill: SvgFillAttributes(color: SvgCurrentColor()),
      );

      // Act
      final SvgPresentationAttributes inherited = child.inherit(null);

      // Assert
      expect(inherited.fill?.color, isA<SvgCurrentColor>());
    });
  });
}
