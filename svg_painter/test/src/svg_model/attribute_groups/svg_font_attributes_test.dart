import 'package:svg_painter/src/svg_model/attribute_groups/svg_font_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgFontAttributes', () {
    test('should return correct string representation when all fields are provided', () {
      // Arrange
      const attrs = SvgFontAttributes(
        size: SvgLength(16.5),
        weight: SvgFontWeightBold(),
        style: SvgFontStyle.italic,
        family: SvgFontFamily('Roboto'),
      );

      // Act
      final result = attrs.toString();

      // Assert
      expect(
        result,
        'SvgFontAttributes(size: 16.5, weight: SvgFontWeight(bold), style: SvgFontStyle(italic), family: SvgFontFamily(Roboto))',
      );
    });

    test('should return compact string representation when some fields are null', () {
      // Arrange
      const attrs = SvgFontAttributes(family: SvgFontFamily('Noto Serif'));

      // Act
      final result = attrs.toString();

      // Assert
      expect(result, 'SvgFontAttributes(family: SvgFontFamily(Noto Serif))');
    });
  });
}
