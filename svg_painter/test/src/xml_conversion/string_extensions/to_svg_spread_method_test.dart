import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_spread_method.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgSpreadMethod', () {
    test('should parse valid strings correctly', () {
      expect('pad'.toSvgSpreadMethod(), SvgSpreadMethod.pad);
      expect('reflect'.toSvgSpreadMethod(), SvgSpreadMethod.reflect);
      expect('repeat'.toSvgSpreadMethod(), SvgSpreadMethod.repeat);
    });

    test('should default to pad for invalid strings', () {
      expect('invalid'.toSvgSpreadMethod(), SvgSpreadMethod.pad);
      expect(''.toSvgSpreadMethod(), SvgSpreadMethod.pad);
    });
  });
}
