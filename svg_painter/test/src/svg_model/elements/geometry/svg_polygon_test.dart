import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgPolygon', () {
    test('should return correct string representation when all fields are provided', () {
      // Arrange
      const SvgPolygon polygon = SvgPolygon(
        points: SvgPointList(<double>[11.0, 22.0, 33.0, 44.0]),
        geometryAttributes: SvgGeometryAttributes(
          pathLength: SvgNonNegativeNumber(500.0),
        ),
        coreAttributes: SvgCoreAttributes(id: 'poly1'),
      );

      // Act
      final String result = polygon.toString();

      // Assert
      expect(
        result,
        'SvgPolygon(pts: 4, geometry: SvgGeometryAttributes(pathLength: SvgNumber(500.0)), core: SvgCoreAttributes(id: poly1))',
      );
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
