import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgStrokeLinecap', () {
    test('from should return correct enum for valid strings', () {
      expect(SvgStrokeLinecap.from('butt'), SvgStrokeLinecap.butt);
      expect(SvgStrokeLinecap.from('round'), SvgStrokeLinecap.round);
      expect(SvgStrokeLinecap.from('square'), SvgStrokeLinecap.square);
    });

    test('from should return null for invalid strings', () {
      expect(SvgStrokeLinecap.from('foo'), isNull);
    });
  });
}
