import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_tspan.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgTspan', () {
    test('should return SvgTspan with correct attributes and children when valid XML is provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<tspan id="span1" x="10" y="20" dx="5" dy="5" rotate="45">Hello <tspan>World</tspan></tspan>',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgTspan> result = element.toSvgTspan();

      // Assert
      expect(result, isA<Success<SvgTspan>>());
      final SvgTspan tspan = (result as Success<SvgTspan>).value;
      expect(tspan.id, 'span1');
      expect((tspan.x! as SvgLength).value, 10.0);
      expect((tspan.y! as SvgLength).value, 20.0);
      expect((tspan.dx! as SvgLength).value, 5.0);
      expect((tspan.dy! as SvgLength).value, 5.0);
      expect(tspan.rotate?.value, 45.0);
      expect(tspan.children.length, 2);
      expect(tspan.children[0], isA<SvgCharacterData>());
      expect(tspan.children[1], isA<SvgTspan>());
    });
  });
}
