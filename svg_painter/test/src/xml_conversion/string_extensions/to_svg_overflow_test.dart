import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_overflow.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgOverflow', () {
    group('toSvgOverflow', () {
      test('should return correct enum when valid string provided', () {
        // Arrange
        const visibleStr = 'visible';
        const hiddenStr = 'hidden';
        const scrollStr = 'scroll';
        const autoStr = 'auto';

        // Act
        final SvgOverflow? resultVisible = visibleStr.toSvgOverflow();
        final SvgOverflow? resultHidden = hiddenStr.toSvgOverflow();
        final SvgOverflow? resultScroll = scrollStr.toSvgOverflow();
        final SvgOverflow? resultAuto = autoStr.toSvgOverflow();

        // Assert
        expect(resultVisible, SvgOverflow.visible);
        expect(resultHidden, SvgOverflow.hidden);
        expect(resultScroll, SvgOverflow.scroll);
        expect(resultAuto, SvgOverflow.auto);
      });

      test('should return correct enum when case and whitespace vary', () {
        // Arrange
        const upperVisible = ' VISIBLE ';
        const mixedHidden = ' Hidden ';

        // Act
        final SvgOverflow? resultVisible = upperVisible.toSvgOverflow();
        final SvgOverflow? resultHidden = mixedHidden.toSvgOverflow();

        // Assert
        expect(resultVisible, SvgOverflow.visible);
        expect(resultHidden, SvgOverflow.hidden);
      });

      test('should return null when value is unknown or empty', () {
        // Arrange
        const unknownStr = 'unknownOverflow';
        const emptyStr = '   ';

        // Act
        final SvgOverflow? resultUnknown = unknownStr.toSvgOverflow();
        final SvgOverflow? resultEmpty = emptyStr.toSvgOverflow();

        // Assert
        expect(resultUnknown, isNull);
        expect(resultEmpty, isNull);
      });
    });
  });
}
