import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_value_extensions/svg_length_extensions.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const context = SvgPaintingContext(viewBoxWidth: 200, viewBoxHeight: 100);

  group('SvgLengthToDouble', () {
    const dpi = 96.0;

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

    test('should return value in pixels when unit is quarter-millimeters (q)', () {
      expect(const SvgLength(40.0, SvgLengthUnit.q).toDouble(), closeTo(dpi / 2.54, 0.0001));
    });

    test('should return value in pixels when unit is picas (pc)', () {
      expect(const SvgLength(6.0, SvgLengthUnit.pc).toDouble(), dpi);
    });

    test('should return value in pixels when unit is points (pt)', () {
      expect(const SvgLength(72.0, SvgLengthUnit.pt).toDouble(), dpi);
    });

    test('should return value relative to viewport width when unit is vw', () {
      expect(const SvgLength(10.0, SvgLengthUnit.vw).toDouble(context), 20.0);
    });

    test('should return value relative to viewport height when unit is vh', () {
      expect(const SvgLength(10.0, SvgLengthUnit.vh).toDouble(context), 10.0);
    });

    test('should return value relative to vmin', () {
      // min(200, 100) = 100
      expect(const SvgLength(10.0, SvgLengthUnit.vmin).toDouble(context), 10.0);
    });

    test('should return value relative to vmax', () {
      // max(200, 100) = 200
      expect(const SvgLength(10.0, SvgLengthUnit.vmax).toDouble(context), 20.0);
    });
  });

  group('SvgPercentageToDouble', () {
    test('should resolve against width for horizontal', () {
      expect(const SvgPercentage(55.0).resolve(context, .horizontal), closeTo(110.0, 0.0001));
    });

    test('should resolve against height for vertical', () {
      expect(const SvgPercentage(55.0).resolve(context, .vertical), closeTo(55.0, 0.0001));
    });

    test('should resolve against normalized diagonal for normalized', () {
      // diagonal = sqrt(200^2 + 100^2) / sqrt(2) = sqrt(50000)/sqrt(2) = sqrt(25000) = 158.113883
      expect(const SvgPercentage(100.0).resolve(context, .normalized), closeTo(158.113883, 0.0001));
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

    test('toPosition should return raw values (offset handled by generator)', () {
      const contextWithOffset = SvgPaintingContext(
        viewBoxWidth: 200,
        viewBoxHeight: 100,
        viewBoxMinX: 11,
        viewBoxMinY: 22,
      );

      expect(const SvgLength(5.5).toPosition(contextWithOffset, .horizontal), 5.5);
      expect(const SvgLength(5.5).toPosition(contextWithOffset, .vertical), 5.5);
      expect(const SvgLength(5.5).toPosition(contextWithOffset, .normalized), 5.5);
      expect(const SvgLength(5.5).toPosition(contextWithOffset, .unit), 5.5);

      expect(const SvgPercentage(50).toPosition(contextWithOffset, .horizontal), 100.0);
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

    test('toPositionOrNull should return raw double for SvgLength', () {
      const contextWithOffset = SvgPaintingContext(
        viewBoxWidth: 200,
        viewBoxHeight: 100,
        viewBoxMinX: 12,
        viewBoxMinY: 34,
      );

      expect(const SvgLength(5.6).toPositionOrNull(contextWithOffset, .horizontal), 5.6);
    });
  });
}
