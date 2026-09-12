import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_fill_rule.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgFillRule', () {
    group('toSvgFillRule', () {
      test('should return correct enum when valid value is provided', () {
        // Arrange
        const nonzeroStr = 'nonzero';
        const evenoddStr = 'evenodd';

        // Act
        final SvgFillRule? resultNonzero = nonzeroStr.toSvgFillRule();
        final SvgFillRule? resultEvenodd = evenoddStr.toSvgFillRule();

        // Assert
        expect(resultNonzero, SvgFillRule.nonzero);
        expect(resultEvenodd, SvgFillRule.evenodd);
      });

      test('should handle case insensitivity and whitespace', () {
        // Arrange
        const upperNonzero = ' NONZERO ';
        const mixedEvenodd = ' EvenOdd ';

        // Act
        final SvgFillRule? resultNonzero = upperNonzero.toSvgFillRule();
        final SvgFillRule? resultEvenodd = mixedEvenodd.toSvgFillRule();

        // Assert
        expect(resultNonzero, SvgFillRule.nonzero);
        expect(resultEvenodd, SvgFillRule.evenodd);
      });

      test('should return null when value is unknown', () {
        // Arrange
        const unknownStr = 'inherit';

        // Act
        final SvgFillRule? result = unknownStr.toSvgFillRule();

        // Assert
        expect(result, isNull);
      });
    });
  });
}
