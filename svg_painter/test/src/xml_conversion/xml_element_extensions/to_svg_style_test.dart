import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_style.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgStyle', () {
    test('should convert <style> correctly', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse(
        '<style id="style1">.c1 { fill: red; }</style>',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgStyle> result = element.toSvgStyle();

      // Assert
      expect(result, isA<Success<SvgStyle>>());
      final SvgStyle style = (result as Success<SvgStyle>).value;
      expect(style.id, 'style1');
    });

    test('should convert <style> without id correctly', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<style>.c1 { fill: red; }</style>');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgStyle> result = element.toSvgStyle();

      // Assert
      expect(result, isA<Success<SvgStyle>>());
      final SvgStyle style = (result as Success<SvgStyle>).value;
      expect(style.id, isNull);
    });
  });
}
