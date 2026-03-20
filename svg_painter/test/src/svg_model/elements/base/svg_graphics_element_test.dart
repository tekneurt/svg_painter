import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgGraphicsElement', () {
    test('should return correct base string representation (tested via SvgCircle)', () {
      // Arrange
      const SvgCircle element = SvgCircle(
        cx: SvgLength(12.3),
        cy: SvgLength(45.6),
        r: SvgLength(7.8),
        presentationAttributes: SvgPresentationAttributes(
          fill: SvgFillAttributes(color: SvgNamedColor(SvgColorName.red)),
        ),
        coreAttributes: SvgCoreAttributes(id: 'gfx1'),
      );

      // Act
      final String result = element.toString();

      // Assert
      expect(result, contains('id: gfx1'));
    });
  });
}
