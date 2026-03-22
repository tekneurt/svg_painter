import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:test/test.dart';

void main() {
  group('SvgSymbol', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const symbol = SvgSymbol(
        children: <SvgElement>[],
        coreAttributes: SvgCoreAttributes(id: 'sym1'),
      );

      // Act
      final result = symbol.toString();

      // Assert
      expect(result, 'SvgSymbol(children: 0, id: sym1)');
    });
  });
}
