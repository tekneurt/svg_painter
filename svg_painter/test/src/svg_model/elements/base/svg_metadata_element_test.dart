import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:test/test.dart';

void main() {
  group('SvgMetadataElement', () {
    test('should return correct base string representation (tested via SvgTitle)', () {
      // Arrange
      const element = SvgTitle(
        content: 'test content',
        coreAttributes: SvgCoreAttributes(id: 'meta1'),
      );

      // Act
      final result = element.toString();

      // Assert
      expect(result, contains('content: test content'));
      expect(result, contains('id: meta1'));
    });
  });
}
