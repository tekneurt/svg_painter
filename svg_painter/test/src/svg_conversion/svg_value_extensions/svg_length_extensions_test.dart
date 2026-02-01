import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_value_extensions/svg_length_extensions.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const SvgPaintingContext context = SvgPaintingContext(viewBoxWidth: 200, viewBoxHeight: 100);

  group('SvgLengthToDouble', () {
    const double dpi = 96.0;

    test('should return value as is when unit is none or px', () {
      expect(const SvgLength(11.0).toDouble(), 11.0);
      expect(const SvgLength(22.0, SvgLengthUnit.px).toDouble(), 22.0);
    });

    test('should return value in pixels when unit is inches (in)', () {
      expect(const SvgLength(2.0, SvgLengthUnit.inUnit).toDouble(), 2.0 * dpi);
    });

    test('should return value in pixels when unit is centimeters (cm)', () {
      expect(const SvgLength(1.0, SvgLengthUnit.cm).toDouble(), closeTo(dpi / 2.54, 0.0001));
    });

    test('should return value in pixels when unit is millimeters (mm)', () {
      expect(const SvgLength(10.0, SvgLengthUnit.mm).toDouble(), closeTo(dpi / 2.54, 0.0001));
    });

    test('should return value relative to viewport width when unit is vw', () {
      expect(const SvgLength(10.0, SvgLengthUnit.vw).toDouble(context), 20.0);
    });

    test('should return value relative to viewport height when unit is vh', () {
      expect(const SvgLength(10.0, SvgLengthUnit.vh).toDouble(context), 10.0);
    });
  });

  group('SvgPercentageToDouble', () {
    test('should resolve against width for horizontal', () {
      expect(const SvgPercentage(55.0).resolve(context, .horizontal), closeTo(110.0, 0.0001));
    });

    test('should resolve as fraction for unit', () {
      expect(const SvgPercentage(45.0).resolve(context, .unit), 0.45);
    });
  });

  group('SvgLengthPercentageToDouble', () {
    test('resolve should handle SvgLength', () {
      expect(const SvgLength(12.3).resolve(context, .horizontal), 12.3);
    });

    test('resolve should handle SvgPercentage', () {
      expect(const SvgPercentage(50).resolve(context, .horizontal), 100.0);
    });

    test('toPosition should respect viewBox offset', () {
      const SvgPaintingContext contextWithOffset = SvgPaintingContext(
        viewBoxWidth: 200,
        viewBoxHeight: 100,
        viewBoxMinX: 11,
        viewBoxMinY: 22,
      );

      expect(const SvgLength(5.5).toPosition(contextWithOffset, .horizontal), 16.5);
    });
  });

  group('SvgAutoToDouble', () {
    test('resolveOrNull should return null for SvgAuto', () {
      expect(const SvgAuto().resolveOrNull(context, .horizontal), isNull);
    });

    test('resolveOrNull should return double for SvgLength', () {
      expect(const SvgLength(11.1).resolveOrNull(context, .horizontal), 11.1);
    });

    test('toPositionOrNull should return null for SvgAuto', () {
      expect(const SvgAuto().toPositionOrNull(context, .horizontal), isNull);
    });

    test('toPositionOrNull should respect viewBox offset', () {
      const SvgPaintingContext contextWithOffset = SvgPaintingContext(
        viewBoxWidth: 200,
        viewBoxHeight: 100,
        viewBoxMinX: 12,
        viewBoxMinY: 34,
      );

      expect(const SvgLength(5.6).toPositionOrNull(contextWithOffset, .horizontal), 17.6);
    });
  });
}
