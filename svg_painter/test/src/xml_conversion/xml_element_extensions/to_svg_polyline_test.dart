import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_polyline.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgPolyline', () {
    test('should return Success with SvgPolyline when valid points attribute is provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<polyline points="11,22 55,66 111,222" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgPolyline> result = element.toSvgPolyline();

      // Assert
      expect(
        result,
        isA<Success<SvgPolyline>>().having(
          (Success<SvgPolyline> s) => s.value.points.points,
          'points',
          <double>[11.0, 22.0, 55.0, 66.0, 111.0, 222.0],
        ),
      );
    });

    test('should map common attributes when provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse(
        '<polyline points="1,2 3,4" stroke="red" stroke-width="5.5" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgPolyline> result = element.toSvgPolyline();

      // Assert
      expect(
        result,
        isA<Success<SvgPolyline>>().having(
          (Success<SvgPolyline> s) => s.value,
          'value',
          isA<SvgPolyline>()
              .having((SvgPolyline p) => p.stroke?.color, 'stroke color', isA<SvgNamedColor>())
              .having(
                (SvgPolyline p) => (p.stroke?.width as SvgLength?)?.value,
                'stroke width',
                5.5,
              ),
        ),
      );
    });
  });
}
