import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgRadialGradient', () {
    test('should return correct string representation when all fields are provided', () {
      // Arrange
      const SvgRadialGradient gradient = SvgRadialGradient(
        cx: SvgLength(11.0),
        cy: SvgLength(22.0),
        r: SvgLength(33.0),
        fx: SvgLength(44.0),
        fy: SvgLength(55.0),
        fr: SvgLength(66.0),
        stops: <SvgStop>[],
        gradientTransformAttributes: SvgTransformAttributes(<SvgTransformOperation>[
          SvgScale(2.5, 2.5),
        ]),
        id: 'rg1',
      );

      // Act
      final String result = gradient.toString();

      // Assert
      expect(
        result,
        'SvgRadialGradient(cx: 11.0, cy: 22.0, r: 33.0, fx: 44.0, fy: 55.0, fr: 66.0, stops: 0, transform: SvgTransformAttributes(scale(2.5, 2.5)), id: rg1)',
      );
    });

    test('should return compact string representation when optional fields are null', () {
      // Arrange
      const SvgRadialGradient gradient = SvgRadialGradient(
        cx: SvgLength(12.3),
        cy: SvgLength(45.6),
        r: SvgLength(78.9),
        fx: SvgLength(32.1),
        fy: SvgLength(65.4),
        fr: SvgLength(1.2),
        stops: <SvgStop>[],
      );

      // Act
      final String result = gradient.toString();

      // Assert
      expect(
        result,
        'SvgRadialGradient(cx: 12.3, cy: 45.6, r: 78.9, fx: 32.1, fy: 65.4, fr: 1.2, stops: 0)',
      );
    });
  });
}
