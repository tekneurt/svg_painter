import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:test/test.dart';

void main() {
  group('SvgStyle', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgStyle element = SvgStyle(id: 'style1');

      // Act
      final String result = element.toString();

      // Assert
      expect(result, 'SvgStyle(id: style1)');
    });
  });
}
