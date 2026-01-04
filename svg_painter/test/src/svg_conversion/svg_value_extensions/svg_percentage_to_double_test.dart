import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_value_extensions/svg_percentage_to_double.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const SvgPaintingContext context = SvgPaintingContext(viewBoxWidth: 100, viewBoxHeight: 200);

  group('SvgPercentageToDouble', () {
    test('should resolve against width for horizontal', () {
      // Arrange
      const SvgPercentage percentage = SvgPercentage(50.0);
      // Act & Assert
      expect(percentage.resolve(context, .horizontal), 50.0);
    });

    test('should resolve against height for vertical', () {
      // Arrange
      const SvgPercentage percentage = SvgPercentage(50.0);
      // Act & Assert
      expect(percentage.resolve(context, .vertical), 100.0);
    });

    test('should resolve against diagonal for normalized', () {
      // Arrange
      const SvgPercentage percentage = SvgPercentage(100.0);
      // Act & Assert
      // sqrt(100^2 + 200^2) / sqrt(2)
      // sqrt(10000 + 40000) / 1.414... = sqrt(50000) / 1.414... = 223.6... / 1.414... = 158.11...
      expect(percentage.resolve(context, .normalized), closeTo(158.11388, 0.0001));
    });

    test('should resolve as fraction for unit', () {
      // Arrange
      const SvgPercentage percentage = SvgPercentage(50.0);
      // Act & Assert
      expect(percentage.resolve(context, .unit), 0.5);
    });
  });
}
