import 'package:svg_painter/src/svg_model/attribute_groups/svg_graphics_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_transform_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgGraphicsAttributes', () {
    test('should return correct string representation when all fields populated', () {
      // Arrange
      const attr = SvgGraphicsAttributes(
        opacity: SvgLength(0.5),
        transformAttributes: SvgTransformAttributes([SvgTranslate(10, 20)]),
        mask: 'url(#mask1)',
        clipPath: 'url(#clip1)',
      );

      // Act
      final result = attr.toString();

      // Assert
      expect(result, contains('opacity: 0.5'));
      expect(result, contains('transform: SvgTransformAttributes'));
      expect(result, contains('mask: url(#mask1)'));
      expect(result, contains('clip-path: url(#clip1)'));
    });

    test('should handle null values in toString when default constructor used', () {
      // Arrange
      const attr = SvgGraphicsAttributes();

      // Act
      final result = attr.toString();

      // Assert
      expect(result, 'SvgGraphicsAttributes()');
    });
  });
}
