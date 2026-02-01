import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:test/test.dart';

void main() {
  group('SvgMetadataElement', () {
    test('should return correct base string representation (tested via SvgTitle)', () {
      // Arrange
      const SvgTitle element = SvgTitle(content: 'test content', id: 'meta1');

      // Act
      final String result = element.toString();

      // Assert
      expect(result, contains('content: test content'));
      expect(result, contains('id: meta1'));
    });
  });
}
