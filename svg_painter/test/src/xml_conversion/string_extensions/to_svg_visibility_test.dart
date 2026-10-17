import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:svg_painter/src/xml_conversion/string_extensions/to_svg_visibility.dart';
import 'package:test/test.dart';

void main() {
  group('ToSvgVisibility', () {
    group('toSvgVisibility', () {
      test('should return correct enum when valid string provided', () {
        // Arrange
        const visibleStr = 'visible';
        const hiddenStr = 'hidden';
        const collapseStr = 'collapse';

        // Act
        final SvgVisibility? resultVisible = visibleStr.toSvgVisibility();
        final SvgVisibility? resultHidden = hiddenStr.toSvgVisibility();
        final SvgVisibility? resultCollapse = collapseStr.toSvgVisibility();

        // Assert
        expect(resultVisible, SvgVisibility.visible);
        expect(resultHidden, SvgVisibility.hidden);
        expect(resultCollapse, SvgVisibility.collapse);
      });

      test('should handle case insensitivity and whitespace', () {
        // Arrange
        const upperVisible = ' VISIBLE ';
        const mixedHidden = ' Hidden ';

        // Act
        final SvgVisibility? resultVisible = upperVisible.toSvgVisibility();
        final SvgVisibility? resultHidden = mixedHidden.toSvgVisibility();

        // Assert
        expect(resultVisible, SvgVisibility.visible);
        expect(resultHidden, SvgVisibility.hidden);
      });

      test('should return null when value is unknown or empty', () {
        // Arrange
        const unknownStr = 'unknownVisibility';
        const emptyStr = '   ';

        // Act
        final SvgVisibility? resultUnknown = unknownStr.toSvgVisibility();
        final SvgVisibility? resultEmpty = emptyStr.toSvgVisibility();

        // Assert
        expect(resultUnknown, isNull);
        expect(resultEmpty, isNull);
      });
    });
  });
}
