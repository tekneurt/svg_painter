import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgViewportAttributes', () {
    test('should return correct string representation', () {
      const attr = SvgViewportAttributes(
        viewBox: SvgViewBox(0, 0, 100, 100),
        preserveAspectRatio: SvgPreserveAspectRatio.defaults,
      );
      expect(attr.toString(), contains('viewBox: SvgViewBox'));
      expect(attr.toString(), contains('preserveAspectRatio: SvgPreserveAspectRatio'));
    });

    test('should handle null values in toString', () {
      const attr = SvgViewportAttributes();
      expect(attr.toString(), 'SvgViewportAttributes()');
    });
  });
}
