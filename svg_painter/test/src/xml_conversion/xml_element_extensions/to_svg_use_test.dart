import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_use.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgUse', () {
    test('should return Success with SvgUse when valid attributes are provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<use href="#icon1" x="11" y="22" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgUse> result = element.toSvgUse();

      // Assert
      expect(
        result,
        isA<Success<SvgUse>>().having(
          (Success<SvgUse> s) => s.value,
          'value',
          isA<SvgUse>()
              .having((SvgUse u) => u.href, 'href', '#icon1')
              .having((SvgUse u) => (u.x as SvgLength).value, 'x', 11.0)
              .having((SvgUse u) => (u.y as SvgLength).value, 'y', 22.0),
        ),
      );
    });

    test('should support xlink:href fallback', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse(
        '<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon2" x="33" y="44" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgUse> result = element.toSvgUse();

      // Assert
      expect(
        result,
        isA<Success<SvgUse>>().having(
          (Success<SvgUse> s) => s.value,
          'value',
          isA<SvgUse>().having((SvgUse u) => u.href, 'href', '#icon2'),
        ),
      );
    });

    test('should return Failure when href attribute is missing', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<use x="0" y="0" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgUse> result = element.toSvgUse();

      // Assert
      expect(
        result,
        isA<Failure<SvgUse>>().having(
          (Failure<SvgUse> f) => f.message,
          'message',
          contains('must have an href attribute'),
        ),
      );
    });
  });
}
