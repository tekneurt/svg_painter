import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_length_percentage_list.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgLengthPercentageList', () {
    test('should parse comma and whitespace separated values when valid input is provided', () {
      // Arrange
      const input = '25%, 50%, 75%';

      // Act
      final SvgLengthPercentageList result = input.toSvgLengthPercentageList();

      // Assert
      expect(result.values, hasLength(3));
      expect((result.values[0] as SvgPercentage).value, 25.0);
      expect((result.values[1] as SvgPercentage).value, 50.0);
      expect((result.values[2] as SvgPercentage).value, 75.0);
    });

    test('should parse space-only separated lengths when no commas are present', () {
      // Arrange
      const input = '10 20.5 30';

      // Act
      final SvgLengthPercentageList result = input.toSvgLengthPercentageList();

      // Assert
      expect(result.values, hasLength(3));
      expect((result.values[0] as SvgLength).value, 10.0);
      expect((result.values[1] as SvgLength).value, 20.5);
      expect((result.values[2] as SvgLength).value, 30.0);
    });

    test('should return empty list when input is empty string', () {
      // Arrange
      const input = '   ';

      // Act
      final SvgLengthPercentageList result = input.toSvgLengthPercentageList();

      // Assert
      expect(result.values, isEmpty);
    });

    test('should return single SvgLengthPercentage when toSvgLengthPercentageOrList has 1 value', () {
      // Arrange
      const input = '15.5px';

      // Act
      final SvgLengthPercentageOrList result = input.toSvgLengthPercentageOrList();

      // Assert
      expect(result, isA<SvgLength>());
      expect((result as SvgLength).value, 15.5);
      expect(result.unit, SvgLengthUnit.px);
    });

    test('should return SvgLengthPercentageList when toSvgLengthPercentageOrList has multiple values', () {
      // Arrange
      const input = '10, 20, 30';

      // Act
      final SvgLengthPercentageOrList result = input.toSvgLengthPercentageOrList();

      // Assert
      expect(result, isA<SvgLengthPercentageList>());
      expect((result as SvgLengthPercentageList).values, hasLength(3));
    });
  });
}
