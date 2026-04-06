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

    group('toSvgMiterLimit', () {
      test('should return SvgGenericNumber when value is >= 1.0', () {
        // Arrange
        const input = '1.0';
        const input2 = '8.5';

        // Act
        final SvgNumber? result = input.toSvgMiterLimit();
        final SvgNumber? result2 = input2.toSvgMiterLimit();

        // Assert
        expect(result?.value, 1.0);
        expect(result2?.value, 8.5);
      });

      test('should return null when value is < 1.0', () {
        // Arrange
        const input = '0.9';
        const input2 = '-5.0';

        // Act
        final SvgNumber? result = input.toSvgMiterLimit();
        final SvgNumber? result2 = input2.toSvgMiterLimit();

        // Assert
        expect(result, isNull);
        expect(result2, isNull);
      });

      test('should return null when input is not a number', () {
        // Arrange
        const input = 'abc';

        // Act
        final SvgNumber? result = input.toSvgMiterLimit();

        // Assert
        expect(result, isNull);
      });
    });
  });
}
