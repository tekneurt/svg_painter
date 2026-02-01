import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:test/test.dart';

void main() {
  group('SvgGroup', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgGroup group = SvgGroup(children: <SvgElement>[], id: 'g1');

      // Act
      final String result = group.toString();

      // Assert
      expect(result, 'SvgGroup(children: 0, id: g1)');
    });
  });
}
