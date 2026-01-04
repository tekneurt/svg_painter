import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgPercentage', () {
    test('should return correct string representation', () {
      // Arrange
      const SvgPercentage percentage = SvgPercentage(50.0);

      // Act
      final String result = percentage.toString();

      // Assert
      expect(result, '50.0%');
    });
  });
}
