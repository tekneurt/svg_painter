import 'package:svg_painter/src/svg_model/attribute_groups/svg_core_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_font_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_presentation_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgTextPath', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const textPath = SvgTextPath(
        href: '#path1',
        children: <SvgTextContent>[SvgCharacterData('Fox')],
        coreAttributes: SvgCoreAttributes(id: 'tp1'),
      );

      // Act
      final result = textPath.toString();

      // Assert
      expect(result, 'SvgTextPath(href: #path1, startOffset: null, children: 1, id: tp1)');
    });

    test('should hold all optional properties when fully initialized', () {
      // Arrange & Act
      const textPath = SvgTextPath(
        href: '#myPath',
        startOffset: SvgLength(25.0),
        pathData: 'M 10 10 L 90 90',
        children: <SvgTextContent>[],
        coreAttributes: SvgCoreAttributes(id: 'tp2'),
      );

      // Assert
      expect(textPath.href, '#myPath');
      expect(textPath.startOffset, const SvgLength(25.0));
      expect(textPath.pathData, 'M 10 10 L 90 90');
      expect(textPath.id, 'tp2');
      expect(textPath.toString(), 'SvgTextPath(href: #myPath, startOffset: 25.0, children: 0, id: tp2)');
    });

    test('should return font attributes when presentation attributes are provided', () {
      // Arrange
      const font = SvgFontAttributes(weight: SvgFontWeightBold());
      const textPath = SvgTextPath(
        href: '#myPath',
        children: <SvgTextContent>[],
        presentationAttributes: SvgPresentationAttributes(font: font),
      );

      // Act
      final SvgFontAttributes? result = textPath.fontAttributes;

      // Assert
      expect(result, font);
    });

    test('should return null for font attributes when presentation attributes are null', () {
      // Arrange
      const textPath = SvgTextPath(
        href: '#myPath',
        children: <SvgTextContent>[],
      );

      // Act
      final SvgFontAttributes? result = textPath.fontAttributes;

      // Assert
      expect(result, isNull);
    });
  });
}
