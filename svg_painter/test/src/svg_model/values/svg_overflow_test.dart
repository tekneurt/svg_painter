import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgOverflow', () {
    test('should have all 4 standard enum values when inspected', () {
      // Arrange & Act & Assert
      expect(SvgOverflow.values, hasLength(4));
      expect(SvgOverflow.visible.value, 'visible');
      expect(SvgOverflow.hidden.value, 'hidden');
      expect(SvgOverflow.scroll.value, 'scroll');
      expect(SvgOverflow.auto.value, 'auto');
    });

    test('should return correct enum when valid string provided to from', () {
      // Arrange
      const validNames = <String, SvgOverflow>{
        'visible': SvgOverflow.visible,
        'hidden': SvgOverflow.hidden,
        'scroll': SvgOverflow.scroll,
        'auto': SvgOverflow.auto,
      };

      for (final MapEntry<String, SvgOverflow> entry in validNames.entries) {
        // Act
        final SvgOverflow? result = SvgOverflow.from(entry.key);

        // Assert
        expect(result, entry.value);
      }
    });

    test('should parse case-insensitively and ignore whitespace when from is called', () {
      // Arrange
      const inputUpper = '  VISIBLE  ';
      const inputMixed = '  Hidden ';

      // Act
      final SvgOverflow? resultUpper = SvgOverflow.from(inputUpper);
      final SvgOverflow? resultMixed = SvgOverflow.from(inputMixed);

      // Assert
      expect(resultUpper, SvgOverflow.visible);
      expect(resultMixed, SvgOverflow.hidden);
    });

    test('should return null when input is null or unknown', () {
      // Arrange
      const String? nullInput = null;
      const unknownInput = 'not-a-valid-overflow';

      // Act
      final SvgOverflow? nullResult = SvgOverflow.from(nullInput);
      final SvgOverflow? unknownResult = SvgOverflow.from(unknownInput);

      // Assert
      expect(nullResult, isNull);
      expect(unknownResult, isNull);
    });

    test('should return false for isClipped when overflow is visible or auto', () {
      // Arrange
      const unclippedValues = <SvgOverflow>[
        SvgOverflow.visible,
        SvgOverflow.auto,
      ];

      for (final overflow in unclippedValues) {
        // Act
        final bool isClipped = overflow.isClipped;

        // Assert
        expect(isClipped, isFalse);
      }
    });

    test('should return true for isClipped when overflow is hidden or scroll', () {
      // Arrange
      const clippedValues = <SvgOverflow>[
        SvgOverflow.hidden,
        SvgOverflow.scroll,
      ];

      for (final overflow in clippedValues) {
        // Act
        final bool isClipped = overflow.isClipped;

        // Assert
        expect(isClipped, isTrue);
      }
    });
  });
}
