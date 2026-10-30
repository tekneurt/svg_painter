part of '../../svg_element.dart';

/// Represents a `<marker>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/marker
@immutable
final class SvgMarker extends SvgContainerElement with SvgViewportAttributable {
  const SvgMarker({
    required super.children,
    this.refX,
    this.refY,
    this.markerWidth,
    this.markerHeight,
    this.markerUnits = SvgMarkerUnits.strokeWidth,
    this.orient = SvgMarkerOrient.zero,
    this.viewportAttributes,
    super.title,
    super.desc,
    super.presentationAttributes,
    super.coreAttributes,
  });

  /// The x-axis coordinate of reference point for the marker.
  final SvgLengthPercentage? refX;

  /// The y-axis coordinate of reference point for the marker.
  final SvgLengthPercentage? refY;

  /// The marker width.
  final SvgLengthPercentage? markerWidth;

  /// The marker height.
  final SvgLengthPercentage? markerHeight;

  /// The coordinate system for attributes markerWidth and markerHeight.
  final SvgMarkerUnits markerUnits;

  /// The orientation of the marker relative to the shape it is attached to.
  final SvgMarkerOrient orient;

  @override
  final SvgViewportAttributes? viewportAttributes;

  @override
  String toString() => 'SvgMarker(children: ${children.length}, id: $id)';
}
