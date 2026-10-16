import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_display.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgDisplay', () {
    group('toSvgDisplay', () {
      test('should return correct enum when valid string provided', () {
        // Arrange
        const inlineStr = 'inline';
        const noneStr = 'none';

        // Act
        final SvgDisplay? resultInline = inlineStr.toSvgDisplay();
        final SvgDisplay? resultNone = noneStr.toSvgDisplay();

        // Assert
        expect(resultInline, SvgDisplay.inline);
        expect(resultNone, SvgDisplay.none);
      });

      test('should handle case insensitivity and whitespace', () {
        // Arrange
        const upperBlock = ' BLOCK ';
        const mixedListItem = ' List-Item ';

        // Act
        final SvgDisplay? resultBlock = upperBlock.toSvgDisplay();
        final SvgDisplay? resultListItem = mixedListItem.toSvgDisplay();

        // Assert
        expect(resultBlock, SvgDisplay.block);
        expect(resultListItem, SvgDisplay.listItem);
      });

      test('should return null when value is unknown or empty', () {
        // Arrange
        const unknownStr = 'unknownDisplay';
        const emptyStr = '   ';

        // Act
        final SvgDisplay? resultUnknown = unknownStr.toSvgDisplay();
        final SvgDisplay? resultEmpty = emptyStr.toSvgDisplay();

        // Assert
        expect(resultUnknown, isNull);
        expect(resultEmpty, isNull);
      });
    });
  });
}
