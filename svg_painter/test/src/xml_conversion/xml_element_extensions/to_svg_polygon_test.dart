import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_polygon.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgPolygon', () {
    test('should return Success with SvgPolygon when valid points attribute is provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<polygon points="10,11 20,21 30,31" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgPolygon> result = element.toSvgPolygon();

      // Assert
      expect(result, isA<Success<SvgPolygon>>());
      final SvgPolygon polygon = (result as Success<SvgPolygon>).value;
      expect(polygon.points.points, <double>[10.0, 11.0, 20.0, 21.0, 30.0, 31.0]);
    });

    test('should return Success with empty points when points attribute is missing', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<polygon />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgPolygon> result = element.toSvgPolygon();

      // Assert
      expect(result, isA<Success<SvgPolygon>>());
      final SvgPolygon polygon = (result as Success<SvgPolygon>).value;
      expect(polygon.points.points, isEmpty);
    });

    test('should map common attributes when provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse(
        '<polygon points="1,2 3,4" id="poly1" fill="green" transform="scale(2)" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgPolygon> result = element.toSvgPolygon();

      // Assert
      final SvgPolygon polygon = (result as Success<SvgPolygon>).value;
      expect(polygon.points.points, <double>[1.0, 2.0, 3.0, 4.0]);
      expect(polygon.id, 'poly1');
      expect(polygon.fill, isA<SvgNamedColor>());
      expect(polygon.transform, 'scale(2)');
    });
  });
}
