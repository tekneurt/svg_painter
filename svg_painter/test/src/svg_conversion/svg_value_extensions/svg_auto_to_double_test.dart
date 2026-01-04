import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_value_extensions/svg_auto_to_double.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const SvgPaintingContext context = SvgPaintingContext(
    viewBoxWidth: 100,
    viewBoxHeight: 200,
    viewBoxMinX: 10,
    viewBoxMinY: 20,
  );

  group('SvgAutoToDouble', () {
    test('SvgAuto.toDouble() should return null', () {
      // Arrange
      const SvgAuto auto = SvgAuto();
      // Act & Assert
      expect(auto.toDouble(), isNull);
    });
  });

  group('SvgLengthPercentageAutoToDouble', () {
    group('resolveOrNull', () {
      test('should return value for SvgLength', () {
        // Arrange
        const SvgLength length = SvgLength(10.0);
        // Act & Assert
        expect(length.resolveOrNull(context, .horizontal), 10.0);
      });

      test('should return value for SvgPercentage', () {
        // Arrange
        const SvgPercentage percentage = SvgPercentage(50.0);
        // Act & Assert
        expect(percentage.resolveOrNull(context, .horizontal), 50.0); // 50% of 100
      });

      test('should return null for SvgAuto', () {
        // Arrange
        const SvgAuto auto = SvgAuto();
        // Act & Assert
        expect(auto.resolveOrNull(context, .horizontal), isNull);
      });
    });

    group('toPositionOrNull', () {
      test('should return relative position for horizontal', () {
        // Arrange
        const SvgLength length = SvgLength(50.0);
        // Act & Assert
        expect(length.toPositionOrNull(context, .horizontal), 40.0); // 50 - 10
      });

      test('should return relative position for vertical', () {
        // Arrange
        const SvgLength length = SvgLength(50.0);
        // Act & Assert
        expect(length.toPositionOrNull(context, .vertical), 30.0); // 50 - 20
      });

      test('should return null for SvgAuto', () {
        // Arrange
        const SvgAuto auto = SvgAuto();
        // Act & Assert
        expect(auto.toPositionOrNull(context, .horizontal), isNull);
      });
    });
  });
}
