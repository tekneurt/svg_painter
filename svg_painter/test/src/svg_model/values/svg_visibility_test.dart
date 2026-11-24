import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgVisibility', () {
    test('should have all 3 standard enum values when inspected', () {
      // Arrange & Act & Assert
      expect(SvgVisibility.values, hasLength(3));
      expect(SvgVisibility.visible.value, 'visible');
      expect(SvgVisibility.hidden.value, 'hidden');
      expect(SvgVisibility.collapse.value, 'collapse');
    });

    test('should return correct enum when valid string provided to from', () {
      // Arrange
      const validNames = <String, SvgVisibility>{
        'visible': SvgVisibility.visible,
        'hidden': SvgVisibility.hidden,
        'collapse': SvgVisibility.collapse,
      };

      for (final MapEntry<String, SvgVisibility> entry in validNames.entries) {
        // Act
        final SvgVisibility? result = SvgVisibility.from(entry.key);

        // Assert
        expect(result, entry.value);
      }
    });

    test('should parse case-insensitively and ignore whitespace when from is called', () {
      // Arrange
      const inputUpper = '  VISIBLE  ';
      const inputMixed = '  Hidden ';

      // Act
      final SvgVisibility? resultUpper = SvgVisibility.from(inputUpper);
      final SvgVisibility? resultMixed = SvgVisibility.from(inputMixed);

      // Assert
      expect(resultUpper, SvgVisibility.visible);
      expect(resultMixed, SvgVisibility.hidden);
    });

    test('should return null when input is null or unknown', () {
      // Arrange
      const String? nullInput = null;
      const unknownInput = 'not-a-valid-visibility';

      // Act
      final SvgVisibility? nullResult = SvgVisibility.from(nullInput);
      final SvgVisibility? unknownResult = SvgVisibility.from(unknownInput);

      // Assert
      expect(nullResult, isNull);
      expect(unknownResult, isNull);
    });

    test('should return false for isRendered when visibility is hidden or collapse', () {
      // Arrange
      const SvgVisibility hidden = SvgVisibility.hidden;
      const SvgVisibility collapse = SvgVisibility.collapse;

      // Act
      final bool isHiddenRendered = hidden.isRendered;
      final bool isCollapseRendered = collapse.isRendered;

      // Assert
      expect(isHiddenRendered, isFalse);
      expect(isCollapseRendered, isFalse);
    });

    test('should return true for isRendered when visibility is visible', () {
      // Arrange
      const SvgVisibility visible = SvgVisibility.visible;

      // Act
      final bool isRendered = visible.isRendered;

      // Assert
      expect(isRendered, isTrue);
    });
  });
}
