import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgGraphicsAttributes', () {
    test('should return correct string representation', () {
      const attr = SvgGraphicsAttributes(
        opacity: SvgLength(0.5),
        transformAttributes: SvgTransformAttributes([SvgTranslate(10, 20)]),
      );
      expect(attr.toString(), contains('opacity: 0.5'));
      expect(attr.toString(), contains('transform: SvgTransformAttributes'));
    });

    test('should handle null values in toString', () {
      const attr = SvgGraphicsAttributes();
      expect(attr.toString(), 'SvgGraphicsAttributes()');
    });
  });
}
