import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_length_percentage.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgLengthPercentage', () {
    group('toSvgLengthPercentage', () {
      test('should parse unitless number when valid string is provided', () {
        // Arrange & Act
        final SvgLengthPercentage result = '10'.toSvgLengthPercentage();

        // Assert
        expect(result, isA<SvgLength>());
        final SvgLength length = result as SvgLength;
        expect(length.value, 10.0);
        expect(length.unit, SvgLengthUnit.none);
      });

      test('should parse percentage when valid string is provided', () {
        // Arrange & Act
        final SvgLengthPercentage result = '50%'.toSvgLengthPercentage();

        // Assert
        expect(result, isA<SvgPercentage>());
        final SvgPercentage percentage = result as SvgPercentage;
        expect(percentage.value, 50.0);
      });

      test('should parse pixels when valid string is provided', () {
        // Arrange & Act
        final SvgLengthPercentage result = '10px'.toSvgLengthPercentage();

        // Assert
        expect(result, isA<SvgLength>());
        final SvgLength length = result as SvgLength;
        expect(length.value, 10.0);
        expect(length.unit, SvgLengthUnit.px);
      });

      test('should parse centimeters when valid string is provided', () {
        // Arrange & Act
        final SvgLengthPercentage result = '2.5cm'.toSvgLengthPercentage();

        // Assert
        expect(result, isA<SvgLength>());
        final SvgLength length = result as SvgLength;
        expect(length.value, 2.5);
        expect(length.unit, SvgLengthUnit.cm);
      });

      test('should parse unknown unit as none when number parses', () {
        // Arrange & Act
        final SvgLengthPercentage result = '10foo'.toSvgLengthPercentage();

        // Assert
        expect(result, isA<SvgLength>());
        final SvgLength length = result as SvgLength;
        expect(length.value, 10.0);
        expect(length.unit, SvgLengthUnit.none);
      });

      test('should parse empty string as 0', () {
        // Arrange & Act
        final SvgLengthPercentage result = ''.toSvgLengthPercentage();

        // Assert
        expect(result, isA<SvgLength>());
        final SvgLength length = result as SvgLength;
        expect(length.value, 0.0);
        expect(length.unit, SvgLengthUnit.none);
      });
    });
  });
}
