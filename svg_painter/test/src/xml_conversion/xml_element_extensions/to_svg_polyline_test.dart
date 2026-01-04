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
      final XmlDocument document = XmlDocument.parse('<polyline points="1,2 50,51 100,102" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgPolyline> result = element.toSvgPolyline();

      // Assert
      expect(result, isA<Success<SvgPolyline>>());
      final SvgPolyline polyline = (result as Success<SvgPolyline>).value;
      expect(polyline.points.points, <double>[1.0, 2.0, 50.0, 51.0, 100.0, 102.0]);
    });

    test('should map common attributes when provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse(
        '<polyline points="1,2 3,4" stroke="red" stroke-width="5" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgPolyline> result = element.toSvgPolyline();

      // Assert
      final SvgPolyline polyline = (result as Success<SvgPolyline>).value;
      expect(polyline.points.points, <double>[1.0, 2.0, 3.0, 4.0]);
      expect(polyline.stroke?.color, isA<SvgNamedColor>());
      expect((polyline.stroke!.width! as SvgLength).value, 5.0);
    });
  });
}
