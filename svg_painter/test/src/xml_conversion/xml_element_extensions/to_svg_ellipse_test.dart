import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_ellipse.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgEllipse', () {
    test('should convert <ellipse> with lengths when valid XML is provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<ellipse cx="111" cy="55" rx="44" ry="22" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgEllipse();

      // Assert
      expect(
        result,
        isA<Success<SvgElement>>().having(
          (Success<SvgElement> s) => s.value,
          'value',
          isA<SvgEllipse>()
              .having((SvgEllipse e) => (e.cx as SvgLength).value, 'cx', 111.0)
              .having((SvgEllipse e) => (e.cy as SvgLength).value, 'cy', 55.0)
              .having((SvgEllipse e) => (e.rx as SvgLength).value, 'rx', 44.0)
              .having((SvgEllipse e) => (e.ry as SvgLength).value, 'ry', 22.0),
        ),
      );
    });

    test('should return Success with auto for radii when not provided', () {
      // Arrange
      final document = XmlDocument.parse('<ellipse />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgElement> result = element.toSvgEllipse();

      // Assert
      expect(
        result,
        isA<Success<SvgElement>>().having(
          (Success<SvgElement> s) => s.value,
          'value',
          isA<SvgEllipse>()
              .having((SvgEllipse e) => e.rx, 'rx', isA<SvgAuto>())
              .having((SvgEllipse e) => e.ry, 'ry', isA<SvgAuto>()),
        ),
      );
    });
  });
}
