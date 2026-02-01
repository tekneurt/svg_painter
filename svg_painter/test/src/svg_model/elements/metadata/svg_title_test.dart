import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:test/test.dart';

void main() {
  group('SvgTitle', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgTitle element = SvgTitle(content: 'test-title', id: 't1');

      // Act
      final String result = element.toString();

      // Assert
      expect(result, 'SvgTitle(content: test-title, id: t1)');
    });
  });
}
