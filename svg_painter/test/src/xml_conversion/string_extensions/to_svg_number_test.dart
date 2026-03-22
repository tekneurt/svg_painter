import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_number.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgNumber', () {
    group('toSvgNumber', () {
      test('should return SvgGenericNumber when valid number is provided', () {
        // Arrange
        const input = ' 123.45 ';

        // Act
        final SvgNumber? result = input.toSvgNumber();

        // Assert
        expect(result, isA<SvgGenericNumber>());
        expect(result?.value, 123.45);
      });

      test('should return SvgGenericNumber for negative numbers', () {
        // Arrange
        const input = '-10.5';

        // Act
        final SvgNumber? result = input.toSvgNumber();

        // Assert
        expect(result, isA<SvgGenericNumber>());
        expect(result?.value, -10.5);
      });

      test('should return null when invalid number is provided', () {
        // Arrange
        const input = 'abc';

        // Act
        final SvgNumber? result = input.toSvgNumber();

        // Assert
        expect(result, isNull);
      });
    });

    group('toSvgNonNegativeNumber', () {
      test('should return SvgNonNegativeNumber when positive number is provided', () {
        // Arrange
        const input = '50';

        // Act
        final SvgNonNegativeNumber? result = input.toSvgNonNegativeNumber();

        // Assert
        expect(result, isA<SvgNonNegativeNumber>());
        expect(result?.value, 50.0);
      });

      test('should return SvgNonNegativeNumber when zero is provided', () {
        // Arrange
        const input = '0.0';

        // Act
        final SvgNonNegativeNumber? result = input.toSvgNonNegativeNumber();

        // Assert
        expect(result, isA<SvgNonNegativeNumber>());
        expect(result?.value, 0.0);
      });

      test('should return null when negative number is provided', () {
        // Arrange
        const input = '-1';

        // Act
        final SvgNonNegativeNumber? result = input.toSvgNonNegativeNumber();

        // Assert
        expect(result, isNull);
      });

      test('should return null when malformed input is provided', () {
        // Arrange
        const input = '12.3.4';

        // Act
        final SvgNonNegativeNumber? result = input.toSvgNonNegativeNumber();

        // Assert
        expect(result, isNull);
      });
    });
  });
}
