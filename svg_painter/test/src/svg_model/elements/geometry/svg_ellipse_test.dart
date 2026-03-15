import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgEllipse', () {
    test('should return correct string representation when all fields are provided', () {
      // Arrange
      const SvgEllipse ellipse = SvgEllipse(
        cx: SvgLength(111.0),
        cy: SvgLength(55.0),
        rx: SvgLength(44.0),
        ry: SvgLength(22.0),
        pathLength: SvgNonNegativeNumber(200.0),
        id: 'e1',
      );

      // Act
      final String result = ellipse.toString();

      // Assert
      expect(
        result,
        'SvgEllipse(cx: 111.0, cy: 55.0, rx: 44.0, ry: 22.0, pathLength: SvgNumber(200.0), id: e1)',
      );
    });

    test('should return compact string representation when optional fields are null', () {
      // Arrange
      const SvgEllipse ellipse = SvgEllipse(
        cx: SvgLength(111.0),
        cy: SvgLength(55.0),
        rx: SvgLength(44.0),
        ry: SvgLength(22.0),
      );

      // Act
      final String result = ellipse.toString();

      // Assert
      expect(result, 'SvgEllipse(cx: 111.0, cy: 55.0, rx: 44.0, ry: 22.0)');
    });
  });
}
