import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgUse', () {
    test('should return correct string representation', () {
      const use = SvgUse(
        href: '#r1',
        x: SvgLength(0),
        y: SvgLength(0),
        coreAttributes: SvgCoreAttributes(id: 'u1'),
      );
      expect(use.toString(), 'SvgUse(href: #r1, id: u1)');
    });

    test('should return font attributes when presentation attributes are provided', () {
      const font = SvgFontAttributes(size: SvgLength(14));
      const use = SvgUse(
        href: '#r1',
        x: SvgLength(0),
        y: SvgLength(0),
        presentationAttributes: SvgPresentationAttributes(font: font),
      );
      expect(use.fontAttributes, font);
    });

    test('should return null for font attributes when presentation attributes are null', () {
      const use = SvgUse(
        href: '#r1',
        x: SvgLength(0),
        y: SvgLength(0),
      );
      expect(use.fontAttributes, isNull);
    });
  });
}
