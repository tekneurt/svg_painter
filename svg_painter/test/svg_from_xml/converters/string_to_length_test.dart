import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_length_percentage.dart';
import 'package:test/test.dart';

void main() {
  group('StringToLength', () {
    test('parses unitless number', () {
      final SvgLengthPercentage result = '10'.toSvgLengthPercentage();
      expect(result, isA<SvgLength>());
      final SvgLength length = result as SvgLength;
      expect(length.value, 10.0);
      expect(length.unit, SvgLengthUnit.none);
    });

    test('parses percentage', () {
      final SvgLengthPercentage result = '50%'.toSvgLengthPercentage();
      expect(result, isA<SvgPercentage>());
      final SvgPercentage percentage = result as SvgPercentage;
      expect(percentage.value, 50.0);
    });

    test('parses px', () {
      final SvgLengthPercentage result = '10px'.toSvgLengthPercentage();
      expect(result, isA<SvgLength>());
      final SvgLength length = result as SvgLength;
      expect(length.value, 10.0);
      expect(length.unit, SvgLengthUnit.px);
    });

    test('parses cm', () {
      final SvgLengthPercentage result = '2.5cm'.toSvgLengthPercentage();
      expect(result, isA<SvgLength>());
      final SvgLength length = result as SvgLength;
      expect(length.value, 2.5);
      expect(length.unit, SvgLengthUnit.cm);
    });

    test('parses unknown unit as none if number parses', () {
      final SvgLengthPercentage result = '10foo'.toSvgLengthPercentage();
      expect(result, isA<SvgLength>());
      final SvgLength length = result as SvgLength;
      expect(length.value, 10.0);
      expect(length.unit, SvgLengthUnit.none);
    });

    test('parses empty string as 0', () {
      final SvgLengthPercentage result = ''.toSvgLengthPercentage();
      expect(result, isA<SvgLength>());
      final SvgLength length = result as SvgLength;
      expect(length.value, 0.0);
      expect(length.unit, SvgLengthUnit.none);
    });
  });
}
