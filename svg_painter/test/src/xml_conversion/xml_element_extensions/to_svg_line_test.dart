import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_line.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgLine', () {
    test('should convert <line> with coordinates when valid XML is provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<line x1="11" y1="22" x2="111" y2="222" stroke="black" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgLine();

      // Assert
      expect(
        result,
        isA<Success<SvgElement>>().having(
          (Success<SvgElement> s) => s.value,
          'value',
          isA<SvgLine>()
              .having((SvgLine l) => (l.x1 as SvgLength).value, 'x1', 11.0)
              .having((SvgLine l) => (l.y1 as SvgLength).value, 'y1', 22.0)
              .having((SvgLine l) => (l.x2 as SvgLength).value, 'x2', 111.0)
              .having((SvgLine l) => (l.y2 as SvgLength).value, 'y2', 222.0),
        ),
      );
    });
  });
}
