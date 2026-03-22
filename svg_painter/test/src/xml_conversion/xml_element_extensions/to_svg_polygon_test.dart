import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_transform_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/xml_element_extensions/to_svg_polygon.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('ToSvgPolygon', () {
    test('should return Success with SvgPolygon when valid points attribute is provided', () {
      // Arrange
      final document = XmlDocument.parse('<polygon points="11,22 33,44 55,66" />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgPolygon> result = element.toSvgPolygon();

      // Assert
      expect(
        result,
        isA<Success<SvgPolygon>>().having(
          (Success<SvgPolygon> s) => s.value.points.points,
          'points',
          <double>[11.0, 22.0, 33.0, 44.0, 55.0, 66.0],
        ),
      );
    });

    test('should return Success with empty points when points attribute is missing', () {
      // Arrange
      final document = XmlDocument.parse('<polygon />');
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgPolygon> result = element.toSvgPolygon();

      // Assert
      expect(
        result,
        isA<Success<SvgPolygon>>().having(
          (Success<SvgPolygon> s) => s.value.points.points,
          'points',
          isEmpty,
        ),
      );
    });

    test('should map common attributes when provided', () {
      // Arrange
      final document = XmlDocument.parse(
        '<polygon points="1,2 3,4" id="poly1" fill="green" transform="scale(2.5)" />',
      );
      final XmlElement element = document.rootElement;

      // Act
      final Result<SvgPolygon> result = element.toSvgPolygon();

      // Assert
      expect(
        result,
        isA<Success<SvgPolygon>>().having(
          (Success<SvgPolygon> s) => s.value,
          'value',
          isA<SvgPolygon>()
              .having((SvgPolygon p) => p.id, 'id', 'poly1')
              .having((SvgPolygon p) => p.fillAttributes?.color, 'fill', isA<SvgNamedColor>())
              .having(
                (SvgPolygon p) => p.transformAttributes?.operations.first,
                'transform',
                isA<SvgScale>(),
              ),
        ),
      );
    });
  });
}
