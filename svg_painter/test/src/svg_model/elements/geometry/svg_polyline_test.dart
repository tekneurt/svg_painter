import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgPolyline', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgPolyline poly = SvgPolyline(
        points: SvgPointList(<double>[10, 20, 30, 40]),
        id: 'pl1',
      );

      // Act
      final String result = poly.toString();

      // Assert
      expect(result, 'SvgPolyline(pts: 4, id: pl1)');
    });
  });
}
