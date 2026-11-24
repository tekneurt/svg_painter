import 'package:svg_painter/src/svg_model/attribute_groups/svg_core_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:test/test.dart';

void main() {
  group('SvgSwitch', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const switchElement = SvgSwitch(
        children: <SvgElement>[],
        coreAttributes: SvgCoreAttributes(id: 'sw1'),
      );

      // Act
      final result = switchElement.toString();

      // Assert
      expect(result, 'SvgSwitch(children: 0, id: sw1)');
    });
  });
}
