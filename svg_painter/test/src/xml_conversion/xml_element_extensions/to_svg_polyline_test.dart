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
      final XmlDocument document = XmlDocument.parse('<polyline points="0,0 50,50 100,0" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgPolyline> result = element.toSvgPolyline();

      // Assert
      expect(result, isA<Success<SvgPolyline>>());
      final SvgPolyline polyline = (result as Success<SvgPolyline>).value;
      expect(polyline.points.points, <double>[0.0, 0.0, 50.0, 50.0, 100.0, 0.0]);
    });

    test('should map common attributes when provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse(
        '<polyline points="0,0 1,1" stroke="red" stroke-width="5" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgPolyline> result = element.toSvgPolyline();

      // Assert
      final SvgPolyline polyline = (result as Success<SvgPolyline>).value;
      expect(polyline.stroke?.color, isA<SvgNamedColor>());
      expect((polyline.stroke!.width! as SvgLength).value, 5.0);
    });
  });
}
