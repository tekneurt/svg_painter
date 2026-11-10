import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_clip_rule.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgClipRule', () {
    group('toSvgClipRule', () {
      test('should return correct enum when valid value is provided', () {
        // Arrange
        const nonzeroStr = 'nonzero';
        const evenoddStr = 'evenodd';

        // Act
        final SvgClipRule? resultNonzero = nonzeroStr.toSvgClipRule();
        final SvgClipRule? resultEvenodd = evenoddStr.toSvgClipRule();

        // Assert
        expect(resultNonzero, SvgClipRule.nonzero);
        expect(resultEvenodd, SvgClipRule.evenodd);
      });

      test('should handle case insensitivity and whitespace when parsed', () {
        // Arrange
        const upperNonzero = ' NONZERO ';
        const mixedEvenodd = ' EvenOdd ';

        // Act
        final SvgClipRule? resultNonzero = upperNonzero.toSvgClipRule();
        final SvgClipRule? resultEvenodd = mixedEvenodd.toSvgClipRule();

        // Assert
        expect(resultNonzero, SvgClipRule.nonzero);
        expect(resultEvenodd, SvgClipRule.evenodd);
      });

      test('should return null when value is unknown', () {
        // Arrange
        const unknownStr = 'inherit';

        // Act
        final SvgClipRule? result = unknownStr.toSvgClipRule();

        // Assert
        expect(result, isNull);
      });
    });
  });
}
