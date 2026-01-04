import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_value_extensions/svg_length_percentage_to_double.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const SvgPaintingContext context = SvgPaintingContext(viewBoxWidth: 100, viewBoxHeight: 200);

  group('SvgLengthPercentageToDouble', () {
    test('should resolve SvgLength', () {
      // Arrange
      const SvgLength length = SvgLength(10.0);
      // Act & Assert
      expect(length.resolve(context, .horizontal), 10.0);
    });

    test('should resolve SvgPercentage', () {
      // Arrange
      const SvgPercentage percentage = SvgPercentage(50.0);
      // Act & Assert
      expect(percentage.resolve(context, .horizontal), 50.0); // 50% of 100
    });

    test('toPosition should return resolve value', () {
      // Arrange
      const SvgLength length = SvgLength(10.0);
      // Act & Assert
      expect(length.toPosition(context, .horizontal), 10.0);
    });
  });
}
