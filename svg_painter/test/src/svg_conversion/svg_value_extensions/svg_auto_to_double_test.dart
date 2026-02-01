import 'package:svg_painter/src/base/_base.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_value_extensions/svg_resolution_extensions.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgAutoToDouble', () {
    const SvgPaintingContext context = SvgPaintingContext(viewBoxWidth: 200, viewBoxHeight: 100);

    test('resolveOrNull should return null for SvgAuto', () {
      expect(const SvgAuto().resolveOrNull(context, SvgOrientation.horizontal), isNull);
    });

    test('resolveOrNull should return double for SvgLength', () {
      expect(const SvgLength(10).resolveOrNull(context, SvgOrientation.horizontal), 10.0);
    });

    test('resolveOrNull should return double for SvgPercentage', () {
      expect(const SvgPercentage(50).resolveOrNull(context, SvgOrientation.horizontal), 100.0);
    });

    test('toPositionOrNull should return null for SvgAuto', () {
      expect(const SvgAuto().toPositionOrNull(context, SvgOrientation.horizontal), isNull);
    });

    test('toPositionOrNull should return double for SvgLength', () {
      expect(const SvgLength(10).toPositionOrNull(context, SvgOrientation.horizontal), 10.0);
    });

    test('toPositionOrNull should return double for SvgPercentage', () {
      expect(const SvgPercentage(50).toPositionOrNull(context, SvgOrientation.horizontal), 100.0);
    });

    test('toPositionOrNull should respect viewBox offset', () {
      const SvgPaintingContext contextWithOffset = SvgPaintingContext(
        viewBoxWidth: 200,
        viewBoxHeight: 100,
        viewBoxMinX: 10,
        viewBoxMinY: 20,
      );

      expect(
        const SvgLength(5).toPositionOrNull(contextWithOffset, SvgOrientation.horizontal),
        15.0,
      );
      expect(const SvgLength(5).toPositionOrNull(contextWithOffset, SvgOrientation.vertical), 25.0);
    });
  });
}
