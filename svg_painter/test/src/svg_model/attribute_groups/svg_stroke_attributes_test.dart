import 'package:svg_painter/src/svg_model/attribute_groups/svg_stroke_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgStrokeAttributes', () {
    test('should return correct string representation when all fields are provided', () {
      // Arrange
      const attrs = SvgStrokeAttributes(
        color: SvgNamedColor(SvgColorName.red),
        opacity: SvgPercentage(55.0),
        width: SvgLength(2.5),
        dashArray: SvgPointList(<double>[1.0, 2.0]),
        linecap: SvgStrokeLinecap.round,
        linejoin: SvgStrokeLinejoin.bevel,
      );

      // Act
      final result = attrs.toString();

      // Assert
      expect(
        result,
        'SvgStrokeAttributes(color: SvgNamedColor(red), opacity: 55.0%, width: 2.5, dashArray: SvgPointList([1.0, 2.0]), linecap: SvgStrokeLinecap.round, linejoin: SvgStrokeLinejoin.bevel)',
      );
    });

    test('should return compact string representation when some fields are null', () {
      // Arrange
      const attrs = SvgStrokeAttributes(
        color: SvgNamedColor(SvgColorName.blue),
        width: SvgLength(1.1),
      );

      // Act
      final result = attrs.toString();

      // Assert
      expect(result, 'SvgStrokeAttributes(color: SvgNamedColor(blue), width: 1.1)');
    });
  });
}
