import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_a.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgA', () {
    test('should return Success with SvgA and children when valid XML is provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<a id="a1" href="https://example.com"><circle /><rect /></a>',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgA> result = element.toSvgA();

      // Assert
      expect(
        result,
        isA<Success<SvgA>>().having(
          (Success<SvgA> s) => s.value,
          'value',
          isA<SvgA>()
              .having((SvgA a) => a.id, 'id', 'a1')
              .having((SvgA a) => a.href, 'href', 'https://example.com')
              .having((SvgA a) => a.children, 'children', hasLength(2)),
        ),
      );
    });

    test('should inherit common attributes and parse xlink:href when provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<a xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="https://example.org" fill="red" opacity="0.45" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgA> result = element.toSvgA();

      // Assert
      expect(
        result,
        isA<Success<SvgA>>().having(
          (Success<SvgA> s) => s.value,
          'value',
          isA<SvgA>()
              .having((SvgA a) => a.href, 'href', 'https://example.org')
              .having((SvgA a) => a.fillAttributes?.color, 'fill', isA<SvgNamedColor>())
              .having((SvgA a) => (a.opacity as SvgLength?)?.value, 'opacity', 0.45),
        ),
      );
    });
  });
}
