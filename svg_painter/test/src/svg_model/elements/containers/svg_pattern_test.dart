import 'package:svg_painter/src/svg_model/attribute_groups/svg_core_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_viewport_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgPattern', () {
    test('should return correct string representation when toString is called', () {
      // Arrange
      const pattern = SvgPattern(
        children: <SvgElement>[],
        coreAttributes: SvgCoreAttributes(id: 'pat1'),
      );

      // Act
      final result = pattern.toString();

      // Assert
      expect(result, 'SvgPattern(children: 0, id: pat1)');
    });

    test('should store properties correctly when instantiated', () {
      // Arrange
      const pattern = SvgPattern(
        children: <SvgElement>[],
        coreAttributes: SvgCoreAttributes(id: 'pat2'),
        x: SvgLength(12.0),
        y: SvgLength(24.0),
        width: SvgLength(48.0),
        height: SvgLength(96.0),
        patternUnits: SvgPatternUnits.userSpaceOnUse,
        patternContentUnits: SvgPatternUnits.objectBoundingBox,
        href: '#otherPattern',
        viewportAttributes: SvgViewportAttributes(
          viewBox: SvgViewBox(1.0, 2.0, 30.0, 40.0),
        ),
      );

      // Act & Assert
      expect(pattern.id, 'pat2');
      expect(pattern.x, const SvgLength(12.0));
      expect(pattern.y, const SvgLength(24.0));
      expect(pattern.width, const SvgLength(48.0));
      expect(pattern.height, const SvgLength(96.0));
      expect(pattern.patternUnits, SvgPatternUnits.userSpaceOnUse);
      expect(pattern.patternContentUnits, SvgPatternUnits.objectBoundingBox);
      expect(pattern.href, '#otherPattern');
      expect(pattern.viewportAttributes?.viewBox?.width, 30.0);
    });
  });
}
