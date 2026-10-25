import 'package:svg_painter/src/svg_model/attribute_groups/svg_core_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:test/test.dart';

void main() {
  group('SvgA', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const a = SvgA(
        children: <SvgElement>[],
        href: 'https://example.com/link',
        coreAttributes: SvgCoreAttributes(id: 'a1'),
      );

      // Act
      final result = a.toString();

      // Assert
      expect(result, 'SvgA(href: https://example.com/link, children: 0, id: a1)');
    });
  });
}
