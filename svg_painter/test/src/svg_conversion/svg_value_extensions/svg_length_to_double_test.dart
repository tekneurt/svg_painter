import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_value_extensions/svg_length_to_double.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgLengthToDouble', () {
    const double dpi = 96.0;

    group('toDouble', () {
      test('should return value as is when unit is none or px', () {
        // Arrange
        const SvgLength lengthNone = SvgLength(10.0);
        const SvgLength lengthPx = SvgLength(20.0, SvgLengthUnit.px);

        // Act & Assert
        expect(lengthNone.toDouble(), 10.0);
        expect(lengthPx.toDouble(), 20.0);
      });

      test('should return value in pixels when unit is inches (in)', () {
        // Arrange
        const SvgLength length = SvgLength(2.0, SvgLengthUnit.inUnit);

        // Act
        final double result = length.toDouble();

        // Assert
        expect(result, 2.0 * dpi);
      });

      test('should return value in pixels when unit is centimeters (cm)', () {
        // Arrange
        const SvgLength length = SvgLength(1.0, SvgLengthUnit.cm);

        // Act
        final double result = length.toDouble();

        // Assert
        expect(result, closeTo(dpi / 2.54, 0.0001));
      });

      test('should return value in pixels when unit is millimeters (mm)', () {
        // Arrange
        const SvgLength length = SvgLength(10.0, SvgLengthUnit.mm);

        // Act
        final double result = length.toDouble();

        // Assert
        expect(result, closeTo(dpi / 2.54, 0.0001));
      });

      test('should return value in pixels when unit is quarter-millimeters (q)', () {
        // Arrange
        const SvgLength length = SvgLength(40.0, SvgLengthUnit.q);

        // Act
        final double result = length.toDouble();

        // Assert
        expect(result, closeTo(dpi / 2.54, 0.0001));
      });

      test('should return value in pixels when unit is points (pt)', () {
        // Arrange
        const SvgLength length = SvgLength(72.0, SvgLengthUnit.pt);

        // Act
        final double result = length.toDouble();

        // Assert
        expect(result, dpi);
      });

      test('should return value in pixels when unit is picas (pc)', () {
        // Arrange
        const SvgLength length = SvgLength(6.0, SvgLengthUnit.pc);

        // Act
        final double result = length.toDouble();

        // Assert
        expect(result, dpi);
      });

      test('should return value relative to viewport width when unit is vw', () {
        // Arrange
        const SvgPaintingContext context = SvgPaintingContext(
          viewBoxWidth: 200,
          viewBoxHeight: 100,
        );
        const SvgLength length = SvgLength(10.0, SvgLengthUnit.vw);

        // Act
        final double result = length.toDouble(context);

        // Assert
        expect(result, 20.0); // 10% of 200
      });

      test('should return value relative to viewport height when unit is vh', () {
        // Arrange
        const SvgPaintingContext context = SvgPaintingContext(
          viewBoxWidth: 200,
          viewBoxHeight: 100,
        );
        const SvgLength length = SvgLength(10.0, SvgLengthUnit.vh);

        // Act
        final double result = length.toDouble(context);

        // Assert
        expect(result, 10.0); // 10% of 100
      });

      test('should return value relative to smaller viewport dimension when unit is vmin', () {
        // Arrange
        const SvgPaintingContext context = SvgPaintingContext(
          viewBoxWidth: 200,
          viewBoxHeight: 100,
        );
        const SvgLength length = SvgLength(10.0, SvgLengthUnit.vmin);

        // Act
        final double result = length.toDouble(context);

        // Assert
        expect(result, 10.0); // 10% of min(200, 100) = 10% of 100
      });

      test('should return value relative to larger viewport dimension when unit is vmax', () {
        // Arrange
        const SvgPaintingContext context = SvgPaintingContext(
          viewBoxWidth: 200,
          viewBoxHeight: 100,
        );
        const SvgLength length = SvgLength(10.0, SvgLengthUnit.vmax);

        // Act
        final double result = length.toDouble(context);

        // Assert
        expect(result, 20.0); // 10% of max(200, 100) = 10% of 200
      });

      test('should use default viewport size when context is null for viewport units', () {
        // Arrange
        const SvgLength lengthVw = SvgLength(10.0, SvgLengthUnit.vw);
        const SvgLength lengthVh = SvgLength(10.0, SvgLengthUnit.vh);

        // Act & Assert
        expect(lengthVw.toDouble(), 10.0); // 10% of 100 (default)
        expect(lengthVh.toDouble(), 10.0); // 10% of 100 (default)
      });
    });
  });
}
