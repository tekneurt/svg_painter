import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('SvgFontWeight', () {
    test('SvgFontWeightNormal should have correct toString', () {
      // Arrange
      const weight = SvgFontWeightNormal();

      // Act & Assert
      expect(weight.toString(), 'SvgFontWeight(normal)');
    });

    test('SvgFontWeightBold should have correct toString', () {
      // Arrange
      const weight = SvgFontWeightBold();

      // Act & Assert
      expect(weight.toString(), 'SvgFontWeight(bold)');
    });

    test('SvgFontWeightBolder should have correct toString', () {
      // Arrange
      const weight = SvgFontWeightBolder();

      // Act & Assert
      expect(weight.toString(), 'SvgFontWeight(bolder)');
    });

    test('SvgFontWeightLighter should have correct toString', () {
      // Arrange
      const weight = SvgFontWeightLighter();

      // Act & Assert
      expect(weight.toString(), 'SvgFontWeight(lighter)');
    });

    group('SvgFontWeightNumeric', () {
      test('should store value and have correct toString', () {
        // Arrange
        const weight = SvgFontWeightNumeric(500);

        // Act & Assert
        expect(weight.value, 500.0);
        expect(weight.toString(), 'SvgFontWeight(500.0)');
      });

      test('should throw assertion error when value is less than 1', () {
        // Act & Assert
        expect(() => SvgFontWeightNumeric(0.9), throwsA(isA<AssertionError>()));
      });

      test('should throw assertion error when value is greater than 1000', () {
        // Act & Assert
        expect(() => SvgFontWeightNumeric(1000.1), throwsA(isA<AssertionError>()));
      });
    });
  });
}
