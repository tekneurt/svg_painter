import 'package:svg_painter/src/svg_model/attribute_groups/svg_marker_attributes.dart';
import 'package:test/test.dart';

void main() {
  group('SvgMarkerAttributes', () {
    test('should return correct string representation when all fields are provided', () {
      // Arrange
      const attrs = SvgMarkerAttributes(
        marker: 'url(#arrowAll)',
        markerStart: 'url(#arrowStart)',
        markerMid: 'url(#arrowMid)',
        markerEnd: 'url(#arrowEnd)',
      );

      // Act
      final result = attrs.toString();

      // Assert
      expect(
        result,
        'SvgMarkerAttributes(marker: url(#arrowAll), markerStart: url(#arrowStart), markerMid: url(#arrowMid), markerEnd: url(#arrowEnd))',
      );
    });

    test('should return compact string representation when some fields are null', () {
      // Arrange
      const attrs = SvgMarkerAttributes(
        markerEnd: 'url(#arrowEnd)',
      );

      // Act
      final result = attrs.toString();

      // Assert
      expect(result, 'SvgMarkerAttributes(markerEnd: url(#arrowEnd))');
    });

    test('should return empty representation when all fields are null', () {
      // Arrange
      const attrs = SvgMarkerAttributes();

      // Act
      final result = attrs.toString();

      // Assert
      expect(result, 'SvgMarkerAttributes()');
    });
  });
}
