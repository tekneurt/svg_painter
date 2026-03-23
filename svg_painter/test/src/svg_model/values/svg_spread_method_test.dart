import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgSpreadMethod', () {
    test('should have correct enum values', () {
      expect(SvgSpreadMethod.values, hasLength(3));
      expect(SvgSpreadMethod.pad.value, 'pad');
      expect(SvgSpreadMethod.reflect.value, 'reflect');
      expect(SvgSpreadMethod.repeat.value, 'repeat');
    });

    test('toString should return correct representation', () {
      expect(SvgSpreadMethod.reflect.toString(), 'SvgSpreadMethod.reflect');
    });
  });
}
