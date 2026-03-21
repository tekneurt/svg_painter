import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:test/test.dart';

void main() {
  group('SvgStyle', () {
    test('should return correct string representation when all fields are provided', () {
      // Arrange
      const SvgStyle style = SvgStyle(
        content: 'rect { fill: red; }',
        type: 'text/css',
        media: 'all',
        title: 'Main Style',
        coreAttributes: SvgCoreAttributes(id: 'style1'),
      );

      // Act
      final String result = style.toString();

      // Assert
      expect(result, 'SvgStyle(content: 19 chars, type: text/css, media: all, title: Main Style, id: style1)');
    });

    test('should return compact string representation when optional fields are null', () {
      // Arrange
      const SvgStyle style = SvgStyle(
        content: 'circle { fill: gold; }',
      );

      // Act
      final String result = style.toString();

      // Assert
      expect(result, 'SvgStyle(content: 22 chars)');
    });
  });
}
