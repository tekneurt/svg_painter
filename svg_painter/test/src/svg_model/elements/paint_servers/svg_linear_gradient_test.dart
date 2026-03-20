import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('SvgLinearGradient', () {
    test('should return correct string representation when all fields are provided', () {
      // Arrange
      const SvgLinearGradient gradient = SvgLinearGradient(
        coreAttributes: SvgCoreAttributes(id: 'g1'),
        x1: SvgLength(11.0),
        y1: SvgLength(22.0),
        x2: SvgLength(33.0),
        y2: SvgLength(44.0),
        stops: <SvgStop>[],
        gradientTransformAttributes: SvgTransformAttributes(<SvgTransformOperation>[
          SvgMatrix(1, 0, 0, 1, 0, 0),
        ]),
      );

      // Act
      final String result = gradient.toString();

      // Assert
      expect(
        result,
        'SvgLinearGradient(x1: 11.0, y1: 22.0, x2: 33.0, y2: 44.0, stops: 0, transform: SvgTransformAttributes(matrix(1.0, 0.0, 0.0, 1.0, 0.0, 0.0)), id: g1)',
      );
    });

    test('should return compact string representation when optional fields are null', () {
      // Arrange
      const SvgLinearGradient gradient = SvgLinearGradient(
        x1: SvgLength(1.1),
        y1: SvgLength(2.2),
        x2: SvgLength(33.3),
        y2: SvgLength(44.4),
        stops: <SvgStop>[],
      );

      // Act
      final String result = gradient.toString();

      // Assert
      expect(result, 'SvgLinearGradient(x1: 1.1, y1: 2.2, x2: 33.3, y2: 44.4, stops: 0)');
    });
  });
}
