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
      final XmlDocument document = XmlDocument.parse(
        '<line x1="0" y1="0" x2="100" y2="100" stroke="black" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgLine();

      // Assert
      expect(result, isA<Success<SvgElement>>());
      final SvgLine line = (result as Success<SvgElement>).value as SvgLine;
      expect((line.x1 as SvgLength).value, 0.0);
      expect((line.y1 as SvgLength).value, 0.0);
      expect((line.x2 as SvgLength).value, 100.0);
      expect((line.y2 as SvgLength).value, 100.0);
    });
  });
}
