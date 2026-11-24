import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_stroke_dasharray.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgStrokeDasharray', () {
    group('toSvgStrokeDasharray', () {
      test('should parse unitless numbers separated by whitespace when valid string provided', () {
        // Arrange
        const input = '4 1 2 3';

        // Act
        final SvgPointList? result = input.toSvgStrokeDasharray();

        // Assert
        expect(result, isNotNull);
        expect(result!.points, <double>[4.0, 1.0, 2.0, 3.0]);
      });

      test('should parse unitless numbers separated by commas when valid string provided', () {
        // Arrange
        const input = '5, 3, 2';

        // Act
        final SvgPointList? result = input.toSvgStrokeDasharray();

        // Assert
        expect(result, isNotNull);
        expect(result!.points, <double>[5.0, 3.0, 2.0]);
      });

      test('should parse values with px units when valid px tokens provided', () {
        // Arrange
        const input = '10px 20px 30px';

        // Act
        final SvgPointList? result = input.toSvgStrokeDasharray();

        // Assert
        expect(result, isNotNull);
        expect(result!.points, <double>[10.0, 20.0, 30.0]);
      });

      test('should convert physical units to user units when pt or in provided', () {
        // Arrange
        const input = '72pt 1in';

        // Act
        final SvgPointList? result = input.toSvgStrokeDasharray();

        // Assert
        expect(result, isNotNull);
        expect(result!.points, <double>[96.0, 96.0]);
      });

      test('should return null when input is none', () {
        // Arrange
        const inputLower = 'none';
        const inputUpper = 'NONE';
        const inputMixed = '  None  ';

        // Act
        final SvgPointList? resultLower = inputLower.toSvgStrokeDasharray();
        final SvgPointList? resultUpper = inputUpper.toSvgStrokeDasharray();
        final SvgPointList? resultMixed = inputMixed.toSvgStrokeDasharray();

        // Assert
        expect(resultLower, isNull);
        expect(resultUpper, isNull);
        expect(resultMixed, isNull);
      });

      test('should return null when input is empty or whitespace', () {
        // Arrange
        const empty = '';
        const spaces = '    ';

        // Act
        final SvgPointList? resultEmpty = empty.toSvgStrokeDasharray();
        final SvgPointList? resultSpaces = spaces.toSvgStrokeDasharray();

        // Assert
        expect(resultEmpty, isNull);
        expect(resultSpaces, isNull);
      });

      test('should return null when any value is negative per SVG spec', () {
        // Arrange
        const input = '10px -5px 20px';

        // Act
        final SvgPointList? result = input.toSvgStrokeDasharray();

        // Assert
        expect(result, isNull);
      });

      test('should return null when token has invalid format or unknown unit', () {
        // Arrange
        const invalidToken = '10px invalid 20px';
        const unknownUnit = '10xyz 20px';

        // Act
        final SvgPointList? resultToken = invalidToken.toSvgStrokeDasharray();
        final SvgPointList? resultUnit = unknownUnit.toSvgStrokeDasharray();

        // Assert
        expect(resultToken, isNull);
        expect(resultUnit, isNull);
      });

      test('should preserve zero values when dashes start or end with zero', () {
        // Arrange
        const input = '0 4 0';

        // Act
        final SvgPointList? result = input.toSvgStrokeDasharray();

        // Assert
        expect(result, isNotNull);
        expect(result!.points, <double>[0.0, 4.0, 0.0]);
      });
    });
  });
}
