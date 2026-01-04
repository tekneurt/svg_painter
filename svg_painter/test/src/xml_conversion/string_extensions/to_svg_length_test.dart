import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_length.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgLength', () {
    group('toSvgLength', () {
      test('should parse unitless number when valid string is provided', () {
        // Act
        final SvgLength result = '10'.toSvgLength();

        // Assert
        expect(result.value, 10.0);
        expect(result.unit, SvgLengthUnit.none);
      });

      test('should parse number with unit when valid string is provided', () {
        // Act
        final SvgLength result = '2.5cm'.toSvgLength();

        // Assert
        expect(result.value, 2.5);
        expect(result.unit, SvgLengthUnit.cm);
      });

      test('should return 0 when input is empty', () {
        // Act
        final SvgLength result = ''.toSvgLength();

        // Assert
        expect(result.value, 0.0);
      });
    });
  });
}
