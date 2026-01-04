import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_text.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgText', () {
    test('should return Success with SvgText when valid XML is provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<text x="10" y="20">Hello SVG</text>');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgText> result = element.toSvgText();

      // Assert
      expect(result, isA<Success<SvgText>>());
      final SvgText text = (result as Success<SvgText>).value;
      expect((text.x as SvgLength).value, 10.0);
      expect((text.y as SvgLength).value, 20.0);
      expect(text.text, 'Hello SVG');
    });

    test('should map typography attributes when provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse(
        '<text font-size="16" font-family="Roboto" font-weight="bold" font-style="italic">Text</text>',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgText> result = element.toSvgText();

      // Assert
      final SvgText text = (result as Success<SvgText>).value;
      expect((text.fontSize! as SvgLength).value, 16.0);
      expect(text.fontFamily, 'Roboto');
      expect(text.fontWeight, 'bold');
      expect(text.fontStyle, 'italic');
    });
  });
}
