import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgPolygon', () {
    test('should return correct string representation when all fields are provided', () {
      // Arrange
      const SvgPolygon polygon = SvgPolygon(
        points: SvgPointList(<double>[11.0, 22.0, 33.0, 44.0]),
        pathLength: SvgNonNegativeNumber(500.0),
        id: 'poly1',
      );

      // Act
      final String result = polygon.toString();

      // Assert
      expect(result, 'SvgPolygon(pts: 4, pathLength: SvgNumber(500.0), id: poly1)');
    });

    test('should return compact string representation when optional fields are null', () {
      // Arrange
      const SvgPolygon polygon = SvgPolygon(points: SvgPointList(<double>[11.0, 22.0, 33.0, 44.0]));

      // Act
      final String result = polygon.toString();

      // Assert
      expect(result, 'SvgPolygon(pts: 4)');
    });

    test('should hold correct values', () {
      const SvgPolygon polygon = SvgPolygon(points: SvgPointList(<double>[1.0, 2.0]));
      expect(polygon.points.points, <double>[1.0, 2.0]);
    });
  });
}
