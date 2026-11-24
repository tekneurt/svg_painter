import 'package:svg_painter/src/svg_model/attribute_groups/svg_core_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_viewport_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgMarker', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const marker = SvgMarker(
        children: <SvgElement>[],
        coreAttributes: SvgCoreAttributes(id: 'marker1'),
        refX: SvgLength(5.0),
        refY: SvgLength(7.0),
        markerWidth: SvgLength(12.0),
        markerHeight: SvgLength(14.0),
        markerUnits: SvgMarkerUnits.userSpaceOnUse,
        orient: SvgMarkerOrient.auto,
      );

      // Act
      final result = marker.toString();

      // Assert
      expect(result, 'SvgMarker(children: 0, id: marker1)');
      expect(marker.refX, const SvgLength(5.0));
      expect(marker.refY, const SvgLength(7.0));
      expect(marker.markerWidth, const SvgLength(12.0));
      expect(marker.markerHeight, const SvgLength(14.0));
      expect(marker.markerUnits, SvgMarkerUnits.userSpaceOnUse);
      expect(marker.orient, SvgMarkerOrient.auto);
    });

    test('should retain viewport attributes when provided', () {
      // Arrange
      const viewport = SvgViewportAttributes(
        viewBox: SvgViewBox(1.0, 2.0, 20.0, 30.0),
      );
      const marker = SvgMarker(
        children: <SvgElement>[],
        viewportAttributes: viewport,
      );

      // Act & Assert
      expect(marker.viewportAttributes, viewport);
      expect(marker.viewBox, const SvgViewBox(1.0, 2.0, 20.0, 30.0));
    });
  });
}
