import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_xml_attribute_value.dart';
import 'package:svg_painter/src/xml_model/xml_attribute_name.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToXmlAttributeValue', () {
    test('should return attribute value when present', () {
      // Arrange
      final document = XmlDocument.parse('<rect x="10" id="r1" />');
      final XmlElement element = document.rootElement;

      // Act & Assert
      expect(element.toXmlAttributeValue(XmlAttributeName.x), '10');
      expect(element.toXmlAttributeValue(XmlAttributeName.id), 'r1');
    });

    test('should return null when attribute is absent', () {
      // Arrange
      final document = XmlDocument.parse('<rect />');
      final XmlElement element = document.rootElement;

      // Act & Assert
      expect(element.toXmlAttributeValue(XmlAttributeName.x), isNull);
    });
  });
}
