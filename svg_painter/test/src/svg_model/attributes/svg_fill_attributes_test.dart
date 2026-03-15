import 'package:svg_painter/src/svg_model/attributes/svg_fill_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgFillAttributes', () {
    test('should return correct string representation when all fields are provided', () {
      // Arrange
      const SvgFillAttributes attrs = SvgFillAttributes(
        color: SvgNamedColor(SvgColorName.red),
        opacity: SvgPercentage(55.0),
      );

      // Act
      final String result = attrs.toString();

      // Assert
      expect(result, 'SvgFillAttributes(color: SvgNamedColor(red), opacity: 55.0%)');
    });

    test('should return compact string representation when optional fields are null', () {
      // Arrange
      const SvgFillAttributes attrs = SvgFillAttributes(color: SvgNamedColor(SvgColorName.blue));

      // Act
      final String result = attrs.toString();

      // Assert
      expect(result, 'SvgFillAttributes(color: SvgNamedColor(blue))');
    });
  });
}
