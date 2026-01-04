import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgViewBox', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgViewBox viewBox = SvgViewBox(10, 20, 100, 200);

      // Act
      final String result = viewBox.toString();

      // Assert
      expect(result, 'SvgViewBox(10.0, 20.0, 100.0, 200.0)');
    });
  });
}
