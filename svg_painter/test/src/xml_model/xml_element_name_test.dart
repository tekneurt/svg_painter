import 'package:svg_painter/src/xml_model/xml_element_name.dart';
import 'package:test/test.dart';

void main() {
  group('XmlElementName', () {
    test('should have correct string values', () {
      // Arrange & Act & Assert
      expect(XmlElementName.svg.tagName, 'svg');
      expect(XmlElementName.circle.tagName, 'circle');
      expect(XmlElementName.radialGradient.tagName, 'radialGradient');
      expect(XmlElementName.g.tagName, 'g');
    });

    test('from should return correct enum for valid tag names', () {
      // Arrange & Act & Assert
      expect(XmlElementName.from('svg'), XmlElementName.svg);
      expect(XmlElementName.from('circle'), XmlElementName.circle);
      expect(XmlElementName.from('radialGradient'), XmlElementName.radialGradient);
    });

    test('from should return null for unknown tag names', () {
      // Arrange & Act & Assert
      expect(XmlElementName.from('unknown'), isNull);
      expect(XmlElementName.from('SVG'), isNull); // Case sensitive check
    });
  });
}
