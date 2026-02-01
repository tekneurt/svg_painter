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
      final XmlDocument document = XmlDocument.parse('<text x="11" y="22">Hello SVG</text>');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgText> result = element.toSvgText();

      // Assert
      expect(
        result,
        isA<Success<SvgText>>().having(
          (Success<SvgText> s) => s.value,
          'value',
          isA<SvgText>()
              .having((SvgText t) => (t.x as SvgLength).value, 'x', 11.0)
              .having((SvgText t) => (t.y as SvgLength).value, 'y', 22.0)
              .having((SvgText t) => t.text, 'text', 'Hello SVG'),
        ),
      );
    });

    test('should map typography attributes when provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse(
        '<text font-size="16.5" font-family="Roboto" font-weight="bold" font-style="italic">Text</text>',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgText> result = element.toSvgText();

      // Assert
      expect(
        result,
        isA<Success<SvgText>>().having(
          (Success<SvgText> s) => s.value,
          'value',
          isA<SvgText>()
              .having(
                (SvgText t) => (t.fontAttributes?.size as SvgLength?)?.value,
                'font-size',
                16.5,
              )
              .having((SvgText t) => t.fontAttributes?.family, 'font-family', 'Roboto')
              .having((SvgText t) => t.fontAttributes?.weight, 'font-weight', 'bold')
              .having((SvgText t) => t.fontAttributes?.style, 'font-style', 'italic'),
        ),
      );
    });
  });
}
