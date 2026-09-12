import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_paint_order.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgPaintOrder', () {
    group('toSvgPaintOrder', () {
      test('should return normal when "normal" is provided', () {
        // Arrange
        const normalStr = 'normal';

        // Act
        final SvgPaintOrder? result = normalStr.toSvgPaintOrder();

        // Assert
        expect(result, SvgPaintOrder.normal);
      });

      test('should return correct order when single keyword is provided and fill remaining in default order', () {
        // Arrange
        const strokeStr = 'stroke';

        // Act
        final SvgPaintOrder? result = strokeStr.toSvgPaintOrder();

        // Assert
        expect(
          result,
          const SvgPaintOrder(<SvgPaintOrderComponent>[
            SvgPaintOrderComponent.stroke,
            SvgPaintOrderComponent.fill,
            SvgPaintOrderComponent.markers,
          ]),
        );
      });

      test('should return correct order when multiple keywords are provided', () {
        // Arrange
        const orderStr = 'stroke fill';

        // Act
        final SvgPaintOrder? result = orderStr.toSvgPaintOrder();

        // Assert
        expect(
          result,
          const SvgPaintOrder(<SvgPaintOrderComponent>[
            SvgPaintOrderComponent.stroke,
            SvgPaintOrderComponent.fill,
            SvgPaintOrderComponent.markers,
          ]),
        );
      });

      test('should return correct order when comma-separated keywords are provided', () {
        // Arrange
        const commaStr = 'markers, stroke, fill';

        // Act
        final SvgPaintOrder? result = commaStr.toSvgPaintOrder();

        // Assert
        expect(
          result,
          const SvgPaintOrder(<SvgPaintOrderComponent>[
            SvgPaintOrderComponent.markers,
            SvgPaintOrderComponent.stroke,
            SvgPaintOrderComponent.fill,
          ]),
        );
      });

      test('should handle case insensitivity and whitespace', () {
        // Arrange
        const mixedStr = '  STROKE   FILL  ';

        // Act
        final SvgPaintOrder? result = mixedStr.toSvgPaintOrder();

        // Assert
        expect(
          result,
          const SvgPaintOrder(<SvgPaintOrderComponent>[
            SvgPaintOrderComponent.stroke,
            SvgPaintOrderComponent.fill,
            SvgPaintOrderComponent.markers,
          ]),
        );
      });

      test('should return null when value is empty or unknown', () {
        // Arrange
        const emptyStr = '   ';
        const unknownStr = 'unknown-order';

        // Act
        final SvgPaintOrder? emptyResult = emptyStr.toSvgPaintOrder();
        final SvgPaintOrder? unknownResult = unknownStr.toSvgPaintOrder();

        // Assert
        expect(emptyResult, isNull);
        expect(unknownResult, isNull);
      });
    });
  });
}
