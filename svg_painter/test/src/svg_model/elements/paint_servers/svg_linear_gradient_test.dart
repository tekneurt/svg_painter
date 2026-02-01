import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgLinearGradient', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgLinearGradient grad = SvgLinearGradient(
        x1: SvgLength(0.1),
        y1: SvgLength(0.2),
        x2: SvgLength(0.3),
        y2: SvgLength(0.4),
        stops: <SvgStop>[],
        id: 'grad1',
      );

      // Act
      final String result = grad.toString();

      // Assert
      expect(result, 'SvgLinearGradient(stops: 0, id: grad1)');
    });
  });
}
