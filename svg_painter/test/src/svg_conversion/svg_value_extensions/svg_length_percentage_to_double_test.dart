import 'package:svg_painter/src/base/_base.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_value_extensions/svg_resolution_extensions.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgLengthPercentageToDouble', () {
    const SvgPaintingContext context = SvgPaintingContext(viewBoxWidth: 200, viewBoxHeight: 100);

    test('resolve should handle SvgLength', () {
      expect(const SvgLength(10).resolve(context, SvgOrientation.horizontal), 10.0);
    });

    test('resolve should handle SvgPercentage', () {
      expect(const SvgPercentage(50).resolve(context, SvgOrientation.horizontal), 100.0);
    });

    test('toPosition should respect viewBox offset', () {
      const SvgPaintingContext contextWithOffset = SvgPaintingContext(
        viewBoxWidth: 200,
        viewBoxHeight: 100,
        viewBoxMinX: 10,
        viewBoxMinY: 20,
      );

      expect(const SvgLength(5).toPosition(contextWithOffset, SvgOrientation.horizontal), 15.0);
    });
  });
}
