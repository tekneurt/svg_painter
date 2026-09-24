import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgText', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const text = SvgText(
        x: SvgLength(10),
        y: SvgLength(20),
        children: <SvgTextContent>[SvgCharacterData('test')],
        coreAttributes: SvgCoreAttributes(id: 't1'),
      );

      // Act
      final result = text.toString();

      // Assert
      expect(result, 'SvgText(x: 10.0, y: 20.0, dx: null, dy: null, children: 1, id: t1)');
    });

    test('should hold all optional properties (dx, dy)', () {
      // Arrange & Act
      const text = SvgText(
        x: SvgLength(10),
        y: SvgLength(20),
        dx: SvgLength(5),
        dy: SvgLength(15),
        children: <SvgTextContent>[],
      );

      // Assert
      expect(text.dx, const SvgLength(5));
      expect(text.dy, const SvgLength(15));
      expect(text.primaryX, const SvgLength(10));
      expect(text.primaryY, const SvgLength(20));
      expect(text.toString(), 'SvgText(x: 10.0, y: 20.0, dx: 5.0, dy: 15.0, children: 0, id: null)');
    });

    test('should support SvgLengthPercentageList for multiple coordinates', () {
      // Arrange & Act
      const text = SvgText(
        x: SvgLengthPercentageList(<SvgLengthPercentage>[SvgLength(10), SvgLength(30)]),
        y: SvgLengthPercentageList(<SvgLengthPercentage>[SvgLength(20), SvgLength(40)]),
        children: <SvgTextContent>[],
      );

      // Assert
      expect(text.primaryX, const SvgLength(10));
      expect(text.primaryY, const SvgLength(20));
      expect(text.x.toList(), const <SvgLengthPercentage>[SvgLength(10), SvgLength(30)]);
      expect(text.y.toList(), const <SvgLengthPercentage>[SvgLength(20), SvgLength(40)]);
      expect(text.toString(), 'SvgText(x: 10.0, 30.0, y: 20.0, 40.0, dx: null, dy: null, children: 0, id: null)');
    });

    test('should return font attributes when presentation attributes are provided', () {
      // Arrange
      const font = SvgFontAttributes(size: SvgLength(12));
      const text = SvgText(
        x: SvgLength(11),
        y: SvgLength(22),
        children: [],
        presentationAttributes: SvgPresentationAttributes(font: font),
      );

      // Act
      final SvgFontAttributes? result = text.fontAttributes;

      // Assert
      expect(result, font);
    });

    test('should return null for font attributes when presentation attributes are null', () {
      // Arrange
      const text = SvgText(
        x: SvgLength(11),
        y: SvgLength(22),
        children: [],
      );

      // Act
      final SvgFontAttributes? result = text.fontAttributes;

      // Assert
      expect(result, isNull);
    });
  });
}
