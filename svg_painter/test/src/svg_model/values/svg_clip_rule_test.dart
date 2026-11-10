import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgClipRule', () {
    test('should have correct enum values when inspected', () {
      // Arrange & Act & Assert
      expect(SvgClipRule.values, hasLength(2));
      expect(SvgClipRule.nonzero.value, 'nonzero');
      expect(SvgClipRule.evenodd.value, 'evenodd');
    });

    test('should return correct enum when valid string provided to from', () {
      // Arrange
      const validNonzero = 'nonzero';
      const validEvenodd = 'evenodd';

      // Act
      final SvgClipRule? resultNonzero = SvgClipRule.from(validNonzero);
      final SvgClipRule? resultEvenodd = SvgClipRule.from(validEvenodd);

      // Assert
      expect(resultNonzero, SvgClipRule.nonzero);
      expect(resultEvenodd, SvgClipRule.evenodd);
    });

    test('should return null when null or invalid string provided to from', () {
      // Arrange
      const String? nullValue = null;
      const invalidValue = 'invalidClipRule';

      // Act
      final SvgClipRule? resultNull = SvgClipRule.from(nullValue);
      final SvgClipRule? resultInvalid = SvgClipRule.from(invalidValue);

      // Assert
      expect(resultNull, isNull);
      expect(resultInvalid, isNull);
    });

    test('should return correct representation when toString is called', () {
      // Arrange
      const SvgClipRule rule = SvgClipRule.evenodd;

      // Act
      final result = rule.toString();

      // Assert
      expect(result, 'SvgClipRule.evenodd');
    });
  });
}
