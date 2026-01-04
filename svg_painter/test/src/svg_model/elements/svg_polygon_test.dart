import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgPolygon', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgPolygon poly = SvgPolygon(points: SvgPointList(<double>[10, 20, 30, 40]), id: 'pg1');

      // Act
      final String result = poly.toString();

      // Assert
      expect(result, 'SvgPolygon(pts: 4, id: pg1)');
    });
  });
}
