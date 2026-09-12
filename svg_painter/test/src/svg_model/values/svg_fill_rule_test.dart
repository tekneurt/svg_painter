import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgFillRule', () {
    test('should have correct enum values when inspected', () {
      // Arrange & Act & Assert
      expect(SvgFillRule.values, hasLength(2));
      expect(SvgFillRule.nonzero.value, 'nonzero');
      expect(SvgFillRule.evenodd.value, 'evenodd');
    });

    test('should return correct enum when valid string provided to from', () {
      // Arrange
      const validNonzero = 'nonzero';
      const validEvenodd = 'evenodd';

      // Act
      final SvgFillRule? resultNonzero = SvgFillRule.from(validNonzero);
      final SvgFillRule? resultEvenodd = SvgFillRule.from(validEvenodd);

      // Assert
      expect(resultNonzero, SvgFillRule.nonzero);
      expect(resultEvenodd, SvgFillRule.evenodd);
    });

    test('should return null when null or invalid string provided to from', () {
      // Arrange
      const String? nullValue = null;
      const invalidValue = 'invalidRule';

      // Act
      final SvgFillRule? resultNull = SvgFillRule.from(nullValue);
      final SvgFillRule? resultInvalid = SvgFillRule.from(invalidValue);

      // Assert
      expect(resultNull, isNull);
      expect(resultInvalid, isNull);
    });

    test('should return correct representation when toString is called', () {
      // Arrange
      const SvgFillRule rule = SvgFillRule.evenodd;

      // Act
      final result = rule.toString();

      // Assert
      expect(result, 'SvgFillRule.evenodd');
    });
  });
}
