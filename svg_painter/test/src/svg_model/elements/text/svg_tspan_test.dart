import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
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
  });
}
