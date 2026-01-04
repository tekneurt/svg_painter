import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgAuto', () {
    test('should return "auto" when toString() is called', () {
      expect(const SvgAuto().toString(), 'auto');
    });
  });
}
