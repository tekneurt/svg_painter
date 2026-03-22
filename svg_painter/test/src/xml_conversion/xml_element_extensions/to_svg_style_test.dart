import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_style.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgStyle', () {
    test('should return SvgStyle with correct attributes when valid XML is provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<style id="style1" type="text/css" media="all" title="Main Style">rect { fill: red; }</style>',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgStyle> result = element.toSvgStyle();

      // Assert
      expect(result, isA<Success<SvgStyle>>());
      final SvgStyle style = (result as Success<SvgStyle>).value;
      expect(style.id, 'style1');
      expect(style.type, 'text/css');
      expect(style.media, 'all');
      expect(style.title, 'Main Style');
      expect(style.content, 'rect { fill: red; }');
    });

    test('should return SvgStyle with null attributes when none are provided', () {
      // Arrange
      final document = XmlDocument.parse('<style>circle { fill: gold; }</style>');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgStyle> result = element.toSvgStyle();

      // Assert
      expect(result, isA<Success<SvgStyle>>());
      final SvgStyle style = (result as Success<SvgStyle>).value;
      expect(style.id, isNull);
      expect(style.type, isNull);
      expect(style.media, isNull);
      expect(style.title, isNull);
      expect(style.content, 'circle { fill: gold; }');
    });
  });
}
