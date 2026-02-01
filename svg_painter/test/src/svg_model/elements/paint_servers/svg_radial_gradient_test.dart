import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgRadialGradient', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgRadialGradient grad = SvgRadialGradient(
        cx: SvgLength(0.1),
        cy: SvgLength(0.2),
        r: SvgLength(0.3),
        fx: SvgLength(0.4),
        fy: SvgLength(0.5),
        fr: SvgLength(0.05),
        stops: <SvgStop>[],
        id: 'rad1',
      );

      // Act
      final String result = grad.toString();

      // Assert
      expect(result, 'SvgRadialGradient(stops: 0, id: rad1)');
    });
  });
}
