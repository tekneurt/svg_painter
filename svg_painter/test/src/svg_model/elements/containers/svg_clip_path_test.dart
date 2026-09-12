import 'package:svg_painter/src/svg_model/attribute_groups/svg_core_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgClipPath', () {
    test('should construct with distinct properties and return correct toString', () {
      // Arrange
      const clipPath = SvgClipPath(
        children: <SvgElement>[],
        clipPathUnits: SvgClipPathUnits.objectBoundingBox,
        coreAttributes: SvgCoreAttributes(id: 'clip-1'),
      );

      // Act
      final result = clipPath.toString();

      // Assert
      expect(clipPath.clipPathUnits, SvgClipPathUnits.objectBoundingBox);
      expect(result, 'SvgClipPath(children: 0, id: clip-1)');
    });
  });
}
