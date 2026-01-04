import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgPointList', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgPointList points = SvgPointList(<double>[10, 20, 30, 40]);

      // Act
      final String result = points.toString();

      // Assert
      expect(result, 'SvgPointList([10.0, 20.0, 30.0, 40.0])');
    });
  });
}
