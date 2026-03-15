import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgGradient', () {
    test('should hold shared properties (tested via SvgLinearGradient)', () {
      // Arrange
      const SvgLinearGradient gradient = SvgLinearGradient(
        x1: SvgLength(1.2),
        y1: SvgLength(3.4),
        x2: SvgLength(5.6),
        y2: SvgLength(7.8),
        stops: <SvgStop>[],
        gradientTransformAttributes: SvgTransformAttributes(<SvgTransformOperation>[
          SvgTranslate(10, 20),
        ]),
        id: 'grad1',
      );

      // Act & Assert
      expect(gradient.id, 'grad1');
      expect(gradient.stops, isEmpty);
      expect(gradient.gradientTransformAttributes?.operations.first, isA<SvgTranslate>());
    });
  });
}
