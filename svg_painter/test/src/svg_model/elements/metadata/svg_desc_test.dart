import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:test/test.dart';

void main() {
  group('SvgDesc', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgDesc element = SvgDesc(content: 'test-desc', id: 'd1');

      // Act
      final String result = element.toString();

      // Assert
      expect(result, 'SvgDesc(content: test-desc, id: d1)');
    });
  });
}
