import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:test/test.dart';

void main() {
  group('SvgPath', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgPath path = SvgPath(d: 'M 1 2 L 10 11', id: 'p1');

      // Act
      final String result = path.toString();

      // Assert
      expect(result, 'SvgPath(d: M 1 2 L 10 11, id: p1)');
    });
  });
}
