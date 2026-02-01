import 'package:svg_painter/src/svg_model/attributes/svg_fill_attributes.dart';
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
        fillAttributes: SvgFillAttributes(color: SvgNamedColor(SvgColorName.red)),
        id: 'gfx1',
      );

      // Act
      final String result = element.toString();

      // Assert
      expect(result, contains('id: gfx1'));
    });
  });
}
