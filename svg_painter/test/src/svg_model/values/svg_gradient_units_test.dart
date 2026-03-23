import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgGradientUnits', () {
    test('should have correct enum values', () {
      expect(SvgGradientUnits.values, hasLength(2));
      expect(SvgGradientUnits.userSpaceOnUse.value, 'userSpaceOnUse');
      expect(SvgGradientUnits.objectBoundingBox.value, 'objectBoundingBox');
    });

    test('toString should return correct representation', () {
      expect(SvgGradientUnits.userSpaceOnUse.toString(), 'SvgGradientUnits.userSpaceOnUse');
    });
  });
}
