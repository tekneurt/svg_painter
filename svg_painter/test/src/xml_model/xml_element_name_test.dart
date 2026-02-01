import 'package:svg_painter/src/xml_model/xml_element_name.dart';
import 'package:test/test.dart';

void main() {
  group('XmlElementName', () {
    test('should map every enum value to the correct SVG tag string', () {
      // Arrange & Act & Assert
      for (final XmlElementName value in XmlElementName.values) {
        final String expected = switch (value) {
          XmlElementName.svg => 'svg',
          XmlElementName.circle => 'circle',
          XmlElementName.ellipse => 'ellipse',
          XmlElementName.rect => 'rect',
          XmlElementName.line => 'line',
          XmlElementName.path => 'path',
          XmlElementName.polyline => 'polyline',
          XmlElementName.polygon => 'polygon',
          XmlElementName.defs => 'defs',
          XmlElementName.g => 'g',
          XmlElementName.use => 'use',
          XmlElementName.radialGradient => 'radialGradient',
          XmlElementName.linearGradient => 'linearGradient',
          XmlElementName.stop => 'stop',
          XmlElementName.style => 'style',
          XmlElementName.text => 'text',
          XmlElementName.title => 'title',
          XmlElementName.desc => 'desc',
        };
        expect(value.tagName, expected, reason: 'Enum $value should map to "$expected"');
      }
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
