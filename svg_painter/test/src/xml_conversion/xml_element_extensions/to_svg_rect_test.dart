import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_rect.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgRect', () {
    test('should convert <rect> with all attributes when valid XML is provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse(
        '<rect x="11" y="22" width="111" height="55" rx="6" ry="9" fill="green" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgRect();

      // Assert
      expect(
        result,
        isA<Success<SvgElement>>().having(
          (Success<SvgElement> s) => s.value,
          'value',
          isA<SvgRect>()
              .having((SvgRect r) => (r.x as SvgLength).value, 'x', 11.0)
              .having((SvgRect r) => (r.y as SvgLength).value, 'y', 22.0)
              .having((SvgRect r) => (r.width as SvgLength).value, 'width', 111.0)
              .having((SvgRect r) => (r.height as SvgLength).value, 'height', 55.0)
              .having((SvgRect r) => (r.rx as SvgLength).value, 'rx', 6.0)
              .having((SvgRect r) => (r.ry as SvgLength).value, 'ry', 9.0)
              .having((SvgRect r) => r.fill?.color, 'fill', isA<SvgNamedColor>()),
        ),
      );
    });

    test('should return Success with default values when minimal rect is provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<rect />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgRect();

      // Assert
      expect(
        result,
        isA<Success<SvgElement>>().having(
          (Success<SvgElement> s) => s.value,
          'value',
          isA<SvgRect>()
              .having((SvgRect r) => (r.x as SvgLength).value, 'x', 0.0)
              .having((SvgRect r) => (r.y as SvgLength).value, 'y', 0.0)
              .having((SvgRect r) => r.width, 'width', isA<SvgAuto>())
              .having((SvgRect r) => r.height, 'height', isA<SvgAuto>()),
        ),
      );
    });
  });
}
