import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_common_attributes.dart';
import 'package:svg_painter/src/xml_model/xml_element_name.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToCommonAttributes', () {
    test('should extract attributes correctly', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse(
        '<circle id="c1" fill="red" stroke="blue" opacity="0.5" font-size="12" font-family="Roboto" class="cls1" style="fill: green" transform="scale(2)" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final CommonAttributes attrs = element.toCommonAttributes(XmlElementName.circle);

      // Assert
      expect(attrs.id, 'c1');
      expect(attrs.fillAttributes.color, isA<SvgNamedColor>());
      expect(attrs.strokeAttributes.color, isA<SvgNamedColor>());
      expect((attrs.opacity! as SvgLength).value, 0.5);
      expect((attrs.fontAttributes.size! as SvgLength).value, 12.0);
      expect(attrs.fontAttributes.family?.value, 'Roboto');
      expect(attrs.cssClass, 'cls1');
      expect(attrs.inlineStyle, 'fill: green');
      expect(attrs.transform, 'scale(2)');
    });

    test('should return empty attribute groups when attributes are missing', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<circle />');
      final XmlElement element = document.rootElement;

      // Act
      final CommonAttributes attrs = element.toCommonAttributes(XmlElementName.circle);

      // Assert
      expect(attrs.id, isNull);
      expect(attrs.fillAttributes.color, isNull);
      expect(attrs.strokeAttributes.color, isNull);
      expect(attrs.fontAttributes.size, isNull);
      expect(attrs.opacity, isNull);
    });
  });
}
