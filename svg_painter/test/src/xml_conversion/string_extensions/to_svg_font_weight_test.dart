import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_font_weight.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgFontWeight', () {
    test('should return SvgFontWeightNormal for "normal"', () {
      expect('normal'.toSvgFontWeight(), isA<SvgFontWeightNormal>());
      expect('  NORMAL  '.toSvgFontWeight(), isA<SvgFontWeightNormal>());
    });

    test('should return SvgFontWeightBold for "bold"', () {
      expect('bold'.toSvgFontWeight(), isA<SvgFontWeightBold>());
      expect('BOLD'.toSvgFontWeight(), isA<SvgFontWeightBold>());
    });

    test('should return SvgFontWeightBolder for "bolder"', () {
      expect('bolder'.toSvgFontWeight(), isA<SvgFontWeightBolder>());
    });

    test('should return SvgFontWeightLighter for "lighter"', () {
      expect('lighter'.toSvgFontWeight(), isA<SvgFontWeightLighter>());
    });

    test('should return SvgFontWeightNumeric for valid numeric values', () {
      final SvgFontWeight? w1 = '400'.toSvgFontWeight();
      expect(w1, isA<SvgFontWeightNumeric>());
      expect((w1! as SvgFontWeightNumeric).value, 400.0);

      final SvgFontWeight? w2 = '700.5'.toSvgFontWeight();
      expect(w2, isA<SvgFontWeightNumeric>());
      expect((w2! as SvgFontWeightNumeric).value, 700.5);

      final SvgFontWeight? w3 = '1'.toSvgFontWeight();
      expect(w3, isA<SvgFontWeightNumeric>());
      expect((w3! as SvgFontWeightNumeric).value, 1.0);

      final SvgFontWeight? w4 = '1000'.toSvgFontWeight();
      expect(w4, isA<SvgFontWeightNumeric>());
      expect((w4! as SvgFontWeightNumeric).value, 1000.0);
    });

    test('should return null for invalid numeric values', () {
      expect('0.9'.toSvgFontWeight(), isNull);
      expect('1000.1'.toSvgFontWeight(), isNull);
      expect('-100'.toSvgFontWeight(), isNull);
    });

    test('should return null for invalid strings', () {
      expect('invalid'.toSvgFontWeight(), isNull);
      expect(''.toSvgFontWeight(), isNull);
      expect('   '.toSvgFontWeight(), isNull);
    });
  });
}
