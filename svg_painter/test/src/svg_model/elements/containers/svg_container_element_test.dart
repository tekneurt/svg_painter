import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:test/test.dart';

void main() {
  group('SvgContainerElement', () {
    test('should return correct base string representation (tested via SvgGroup)', () {
      // Arrange
      const SvgGroup element = SvgGroup(
        children: <SvgElement>[],
        coreAttributes: SvgCoreAttributes(id: 'cont1'),
      );

      // Act
      final String result = element.toString();

      // Assert
      expect(result, contains('id: cont1'));
    });
  });
}
