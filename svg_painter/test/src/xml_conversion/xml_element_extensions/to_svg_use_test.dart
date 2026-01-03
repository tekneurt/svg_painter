import 'package:svg_painter/src/base/_base.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_use.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgUse', () {
    test('should return Success with SvgUse when valid attributes are provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<use href="#icon1" x="10" y="20" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgUse> result = element.toSvgUse();

      // Assert
      expect(result, isA<Success<SvgUse>>());
      final SvgUse use = (result as Success<SvgUse>).value;
      expect(use.href, '#icon1');
      expect((use.x as SvgLength).value, 10.0);
      expect((use.y as SvgLength).value, 20.0);
    });

    test('should return Failure when href attribute is missing', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<use x="0" y="0" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgUse> result = element.toSvgUse();

      // Assert
      expect(result, isA<Failure<SvgUse>>());
      expect((result as Failure<SvgUse>).message, contains('must have an href attribute'));
    });
  });
}
