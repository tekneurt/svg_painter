import 'package:svg_painter/src/svg_model/attribute_groups/_attribute_groups.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgElement', () {
    test('should return correct string representation for basic element', () {
      // Arrange
      const SvgCircle element = SvgCircle(
        cx: SvgLength(15.0),
        cy: SvgLength(25.0),
        r: SvgLength(10.0),
        coreAttributes: SvgCoreAttributes(id: 'base-element'),
      );

      // Act
      final String result = element.toString();

      // Assert
      expect(result, contains('id: base-element'));
    });

    test('SvgIgnoredElement should return correct string representation', () {
      const SvgIgnoredElement element = SvgIgnoredElement(
        coreAttributes: SvgCoreAttributes(id: 'ignore-me'),
      );
      expect(element.toString(), 'SvgIgnoredElement(id: ignore-me)');
    });
  });
}
