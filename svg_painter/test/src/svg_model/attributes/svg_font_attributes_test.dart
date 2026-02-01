import 'package:svg_painter/src/svg_model/attributes/svg_font_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgFontAttributes', () {
    test('should return correct string representation when all fields are provided', () {
      // Arrange
      const SvgFontAttributes attrs = SvgFontAttributes(
        size: SvgLength(16.5),
        weight: 'bold',
        style: 'italic',
        family: 'Roboto',
      );

      // Act
      final String result = attrs.toString();

      // Assert
      expect(result, 'SvgFontAttributes(size: 16.5, weight: bold, style: italic, family: Roboto)');
    });

    test('should return compact string representation when some fields are null', () {
      // Arrange
      const SvgFontAttributes attrs = SvgFontAttributes(family: 'Noto Serif');

      // Act
      final String result = attrs.toString();

      // Assert
      expect(result, 'SvgFontAttributes(family: Noto Serif)');
    });
  });
}
