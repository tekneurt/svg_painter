import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgPolyline', () {
    test('should return correct string representation when all fields are provided', () {
      // Arrange
      const SvgPolyline polyline = SvgPolyline(
        points: SvgPointList(<double>[11.0, 22.0, 55.0, 66.0]),
        pathLength: SvgNonNegativeNumber(600.0),
        id: 'pline1',
      );

      // Act
      final String result = polyline.toString();

      // Assert
      expect(result, 'SvgPolyline(pts: 4, pathLength: SvgNumber(600.0), id: pline1)');
    });

    test('should return compact string representation when optional fields are null', () {
      // Arrange
      const SvgPolyline polyline = SvgPolyline(
        points: SvgPointList(<double>[11.0, 22.0, 55.0, 66.0]),
      );

      // Act
      final String result = polyline.toString();

      // Assert
      expect(result, 'SvgPolyline(pts: 4)');
    });
  });
}
