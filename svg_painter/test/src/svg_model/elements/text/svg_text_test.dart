import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgText', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const text = SvgText(
        x: SvgLength(10),
        y: SvgLength(20),
        children: <SvgTextContent>[SvgCharacterData('test')],
        coreAttributes: SvgCoreAttributes(id: 't1'),
      );

      // Act
      final result = text.toString();

      // Assert
      expect(result, 'SvgText(x: 10.0, y: 20.0, children: 1, id: t1)');
    });

    test('should return font attributes when presentation attributes are provided', () {
      // Arrange
      const font = SvgFontAttributes(size: SvgLength(12));
      const text = SvgText(
        x: SvgLength(0),
        y: SvgLength(0),
        children: [],
        presentationAttributes: SvgPresentationAttributes(font: font),
      );

      // Act
      final SvgFontAttributes? result = text.fontAttributes;

      // Assert
      expect(result, font);
    });

    test('should return null for font attributes when presentation attributes are null', () {
      // Arrange
      const text = SvgText(
        x: SvgLength(0),
        y: SvgLength(0),
        children: [],
      );

      // Act
      final SvgFontAttributes? result = text.fontAttributes;

      // Assert
      expect(result, isNull);
    });
  });
}
