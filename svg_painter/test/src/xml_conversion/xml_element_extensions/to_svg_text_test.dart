import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_text.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgText', () {
    test('should return SvgText with correct attributes and children when valid XML is provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<text id="t1" x="10" y="20">Hello World</text>',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgText> result = element.toSvgText();

      // Assert
      expect(result, isA<Success<SvgText>>());
      final SvgText text = (result as Success<SvgText>).value;
      expect(text.id, 't1');
      expect((text.x as SvgLength).value, 10.0);
      expect((text.y as SvgLength).value, 20.0);
      expect(text.children.length, 1);
      expect(text.children.first, isA<SvgCharacterData>());
      expect((text.children.first as SvgCharacterData).text, 'Hello World');
    });
  });
}
