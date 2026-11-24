import 'package:svg_painter/src/generation/svg_id_formatter.dart';
import 'package:test/test.dart';

void main() {
  group('SvgIdFormatter', () {
    test('should return "unnamed" when input is empty', () {
      expect(SvgIdFormatter.format(''), 'unnamed');
    });

    test('should remove non-alphanumeric characters', () {
      expect(SvgIdFormatter.format('my@id!'), 'myid');
    });

    test('should convert to lowerCamelCase from hyphens', () {
      expect(SvgIdFormatter.format('my-rect-id'), 'myRectId');
    });

    test('should convert to lowerCamelCase from spaces', () {
      expect(SvgIdFormatter.format('my rect id'), 'myRectId');
    });

    test('should convert to lowerCamelCase from underscores', () {
      expect(SvgIdFormatter.format('my_rect_id'), 'myRectId');
    });

    test('should preserve existing camelCase', () {
      expect(SvgIdFormatter.format('myCircle'), 'myCircle');
    });

    test('should prepend "v" to leading digits', () {
      expect(SvgIdFormatter.format('123box'), 'v123box');
    });

    test('should append "Property" to reserved words', () {
      expect(SvgIdFormatter.format('class'), 'classProperty');
      expect(SvgIdFormatter.format('final'), 'finalProperty');
    });

    test('should handle mixed delimiters', () {
      expect(SvgIdFormatter.format('my-Rect_id 123'), 'myRectId123');
    });

    test('should return "identifier" when only invalid characters are present', () {
      expect(SvgIdFormatter.format('!!!'), 'identifier');
    });

    group('sanitizeId', () {
      test('should return empty string when input is empty or null', () {
        // Arrange
        const String? nullInput = null;
        const emptyInput = '';

        // Act
        final String nullResult = SvgIdFormatter.sanitizeId(nullInput);
        final String emptyResult = SvgIdFormatter.sanitizeId(emptyInput);

        // Assert
        expect(nullResult, '');
        expect(emptyResult, '');
      });

      test('should replace hyphens and invalid characters with underscores', () {
        // Arrange
        const inputWithHyphen = 'gamma-filter';
        const inputWithSpecialChars = 'linear.gradient@test#1';

        // Act
        final String resultHyphen = SvgIdFormatter.sanitizeId(inputWithHyphen);
        final String resultSpecial = SvgIdFormatter.sanitizeId(inputWithSpecialChars);

        // Assert
        expect(resultHyphen, 'gamma_filter');
        expect(resultSpecial, 'linear_gradient_test_1');
      });

      test('should preserve valid alphanumeric and underscore characters', () {
        // Arrange
        const validInput = 'valid_id_123';

        // Act
        final String result = SvgIdFormatter.sanitizeId(validInput);

        // Assert
        expect(result, 'valid_id_123');
      });
    });
  });
}
