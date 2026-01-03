import 'package:svg_painter/src/base/_base.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_polygon.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgPolygon', () {
    test('should return Success with SvgPolygon when valid points attribute is provided', () {
      // Arrange
      final XmlDocument document = XmlDocument.parse('<polygon points="10,10 20,20 30,10" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgPolygon> result = element.toSvgPolygon();

      // Assert
      expect(result, isA<Success<SvgPolygon>>());
      final SvgPolygon polygon = (result as Success<SvgPolygon>).value;
      expect(polygon.points.points, <double>[10.0, 10.0, 20.0, 20.0, 30.0, 10.0]);
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
        '<polygon points="0,0 1,1" id="poly1" fill="green" transform="scale(2)" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgPolygon> result = element.toSvgPolygon();

      // Assert
      final SvgPolygon polygon = (result as Success<SvgPolygon>).value;
      expect(polygon.id, 'poly1');
      expect(polygon.fill, isA<SvgNamedColor>());
      expect(polygon.transform, 'scale(2)');
    });
  });
}
