import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:test/test.dart';

void main() {
  group('SvgGroup', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const group = SvgGroup(
        children: <SvgElement>[],
        coreAttributes: SvgCoreAttributes(id: 'g1'),
      );

      // Act
      final result = group.toString();

      // Assert
      expect(result, 'SvgGroup(children: 0, id: g1)');
    });
  });
}
