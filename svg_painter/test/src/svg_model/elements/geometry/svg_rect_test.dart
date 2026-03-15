import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgRect', () {
    test('should return correct string representation when all fields are provided', () {
      // Arrange
      const SvgRect rect = SvgRect(
        x: SvgLength(11.0),
        y: SvgLength(22.0),
        width: SvgLength(111.0),
        height: SvgLength(55.0),
        rx: SvgLength(6.0),
        ry: SvgLength(9.0),
        pathLength: SvgNonNegativeNumber(700.0),
        id: 'r1',
      );

      // Act
      final String result = rect.toString();

      // Assert
      expect(
        result,
        'SvgRect(x: 11.0, y: 22.0, w: 111.0, h: 55.0, rx: 6.0, ry: 9.0, pathLength: SvgNumber(700.0), id: r1)',
      );
    });

    test('should return compact string representation when optional fields are null', () {
      // Arrange
      const SvgRect rect = SvgRect(
        x: SvgLength(11.0),
        y: SvgLength(22.0),
        width: SvgLength(111.0),
        height: SvgLength(55.0),
        rx: SvgLength(6.0),
        ry: SvgLength(9.0),
      );

      // Act
      final String result = rect.toString();

      // Assert
      expect(result, 'SvgRect(x: 11.0, y: 22.0, w: 111.0, h: 55.0, rx: 6.0, ry: 9.0)');
    });
  });
}
