import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgCircle', () {
    test('should return correct string representation when all fields are provided', () {
      // Arrange
      const SvgCircle circle = SvgCircle(
        cx: SvgLength(11.0),
        cy: SvgLength(22.0),
        r: SvgLength(33.0),
        pathLength: SvgNonNegativeNumber(100.0),
        id: 'c1',
      );

      // Act
      final String result = circle.toString();

      // Assert
      expect(
        result,
        'SvgCircle(cx: 11.0, cy: 22.0, r: 33.0, pathLength: SvgNumber(100.0), id: c1)',
      );
    });

    test('should return compact string representation when optional fields are null', () {
      // Arrange
      const SvgCircle circle = SvgCircle(
        cx: SvgLength(11.0),
        cy: SvgLength(22.0),
        r: SvgLength(33.0),
      );

      // Act
      final String result = circle.toString();

      // Assert
      expect(result, 'SvgCircle(cx: 11.0, cy: 22.0, r: 33.0)');
    });
  });
}
