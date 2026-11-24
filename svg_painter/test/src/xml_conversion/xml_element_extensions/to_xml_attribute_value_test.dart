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

    test('should resolve xlink:href when href attribute requested on element with xlink:href', () {
      // Arrange
      final document = XmlDocument.parse(
        '<image xlink:href="package:svg_painter_fixtures/assets/test.png" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final String? result = element.toXmlAttributeValue(XmlAttributeName.href);

      // Assert
      expect(result, 'package:svg_painter_fixtures/assets/test.png');
    });

    test('should resolve href when xlinkHref attribute requested on element with href', () {
      // Arrange
      final document = XmlDocument.parse('<image href="https://example.org/image.png" />');
      final XmlElement element = document.rootElement;

      // Act
      final String? result = element.toXmlAttributeValue(XmlAttributeName.xlinkHref);

      // Assert
      expect(result, 'https://example.org/image.png');
    });

    test('should resolve namespaced xlink:href when xmlns:xlink namespace is declared', () {
      // Arrange
      final document = XmlDocument.parse(
        '<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#circle1" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final String? result = element.toXmlAttributeValue(XmlAttributeName.href);

      // Assert
      expect(result, '#circle1');
    });
  });
}
