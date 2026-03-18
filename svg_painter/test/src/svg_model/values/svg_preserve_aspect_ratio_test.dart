import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('SvgPreserveAspectRatio', () {
    test('should return correct string representation', () {
      const SvgPreserveAspectRatio ratio = SvgPreserveAspectRatio(
        alignment: SvgPreserveAspectRatioAlignment.xMaxYMax,
        scale: SvgPreserveAspectRatioScale.slice,
      );
      expect(ratio.toString(), 'SvgPreserveAspectRatio(xMaxYMax, slice)');
    });

    test('should implement equality and hashCode correctly', () {
      const SvgPreserveAspectRatio r1 = SvgPreserveAspectRatio.defaults;
      const SvgPreserveAspectRatio r2 = SvgPreserveAspectRatio.defaults;
      const SvgPreserveAspectRatio r3 = SvgPreserveAspectRatio(
        alignment: SvgPreserveAspectRatioAlignment.none,
      );
      const SvgPreserveAspectRatio r4 = SvgPreserveAspectRatio(
        scale: SvgPreserveAspectRatioScale.slice,
      );

      expect(r1, equals(r2));
      expect(r1.hashCode, equals(r2.hashCode));
      expect(r1, isNot(equals(r3)));
      expect(r1, isNot(equals(r4)));
    });
  });
}
