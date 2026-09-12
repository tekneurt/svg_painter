import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_text_anchor.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgTextAnchor', () {
    group('toSvgTextAnchor', () {
      test('should return correct enum when valid value is provided', () {
        // Arrange
        const startStr = 'start';
        const middleStr = 'middle';
        const endStr = 'end';

        // Act
        final SvgTextAnchor? resultStart = startStr.toSvgTextAnchor();
        final SvgTextAnchor? resultMiddle = middleStr.toSvgTextAnchor();
        final SvgTextAnchor? resultEnd = endStr.toSvgTextAnchor();

        // Assert
        expect(resultStart, SvgTextAnchor.start);
        expect(resultMiddle, SvgTextAnchor.middle);
        expect(resultEnd, SvgTextAnchor.end);
      });

      test('should handle case insensitivity and whitespace', () {
        // Arrange
        const upperMiddle = ' MIDDLE ';
        const mixedEnd = ' End ';

        // Act
        final SvgTextAnchor? resultMiddle = upperMiddle.toSvgTextAnchor();
        final SvgTextAnchor? resultEnd = mixedEnd.toSvgTextAnchor();

        // Assert
        expect(resultMiddle, SvgTextAnchor.middle);
        expect(resultEnd, SvgTextAnchor.end);
      });

      test('should return null when value is unknown', () {
        // Arrange
        const unknownStr = 'unknownAnchor';

        // Act
        final SvgTextAnchor? result = unknownStr.toSvgTextAnchor();

        // Assert
        expect(result, isNull);
      });
    });
  });
}
