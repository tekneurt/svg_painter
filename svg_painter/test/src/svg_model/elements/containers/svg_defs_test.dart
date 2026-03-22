import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:test/test.dart';

void main() {
  group('SvgDefs', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const defs = SvgDefs(
        children: <SvgElement>[],
        coreAttributes: SvgCoreAttributes(id: 'd1'),
      );

      // Act
      final result = defs.toString();

      // Assert
      expect(result, 'SvgDefs(children: 0, id: d1)');
    });
  });
}
