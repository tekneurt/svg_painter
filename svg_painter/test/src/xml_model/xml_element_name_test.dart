import 'package:svg_painter/src/xml_model/xml_element_name.dart';
import 'package:test/test.dart';

void main() {
  group('XmlElementName', () {
    test('should map every enum value to the correct SVG tag string', () {
      // Arrange & Act & Assert
      for (final XmlElementName value in XmlElementName.values) {
        final String expected = switch (value) {
          XmlElementName.circle => 'circle',
          XmlElementName.clipPath => 'clipPath',
          XmlElementName.defs => 'defs',
          XmlElementName.desc => 'desc',
          XmlElementName.ellipse => 'ellipse',
          XmlElementName.g => 'g',
          XmlElementName.image => 'image',
          XmlElementName.line => 'line',
          XmlElementName.linearGradient => 'linearGradient',
          XmlElementName.mask => 'mask',
          XmlElementName.path => 'path',
          XmlElementName.polygon => 'polygon',
          XmlElementName.polyline => 'polyline',
          XmlElementName.radialGradient => 'radialGradient',
          XmlElementName.rect => 'rect',
          XmlElementName.stop => 'stop',
          XmlElementName.style => 'style',
          XmlElementName.svg => 'svg',
          XmlElementName.symbol => 'symbol',
          XmlElementName.text => 'text',
          XmlElementName.textPath => 'textPath',
          XmlElementName.title => 'title',
          XmlElementName.tspan => 'tspan',
          XmlElementName.use => 'use',
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
