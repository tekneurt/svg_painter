import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:test/test.dart';

void main() {
  group('SvgCharacterData', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgCharacterData data = SvgCharacterData('Hello');

      // Act
      final String result = data.toString();

      // Assert
      expect(result, 'SvgCharacterData("Hello")');
    });
  });
}
