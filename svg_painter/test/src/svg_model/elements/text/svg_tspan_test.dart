import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgTspan', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const tspan = SvgTspan(
        children: <SvgTextContent>[SvgCharacterData('test')],
        coreAttributes: SvgCoreAttributes(id: 'span1'),
      );

      // Act
      final result = tspan.toString();

      // Assert
      expect(result, 'SvgTspan(children: 1, id: span1)');
    });

    test('should hold all optional properties (x, y, dx, dy, rotate)', () {
      // Arrange
      const x = SvgLength(10);
      const y = SvgLength(20);
      const dx = SvgLength(5);
      const dy = SvgLength(15);
      const rotate = SvgGenericNumber(45);

      // Act
      const tspan = SvgTspan(
        children: [],
        x: x,
        y: y,
        dx: dx,
        dy: dy,
        rotate: rotate,
      );

      // Assert
      expect(tspan.x, x);
      expect(tspan.y, y);
      expect(tspan.dx, dx);
      expect(tspan.dy, dy);
      expect(tspan.rotate, rotate);
    });

    test('should return font attributes when presentation attributes are provided', () {
      // Arrange
      const font = SvgFontAttributes(weight: SvgFontWeightBold());
      const tspan = SvgTspan(
        children: [],
        presentationAttributes: SvgPresentationAttributes(font: font),
      );

      // Act
      final SvgFontAttributes? result = tspan.fontAttributes;

      // Assert
      expect(result, font);
    });

    test('should return null for font attributes when presentation attributes are null', () {
      // Arrange
      const tspan = SvgTspan(children: []);

      // Act
      final SvgFontAttributes? result = tspan.fontAttributes;

      // Assert
      expect(result, isNull);
    });
  });
}
