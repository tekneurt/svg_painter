part of '../svg_element.dart';

/// Represents a `<polyline>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/polyline
@immutable
final class SvgPolyline extends SvgBasicShape {
  const SvgPolyline({
    required this.points,
    super.fill,
    super.fillOpacity,
    super.stroke,
    super.opacity,
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.fontFamily,
    super.cssClass,
    super.inlineStyle,
    super.transform,
    super.pathLength,
    super.id,
  });

  /// The points that define the polyline.
  final SvgPointList points;

  @override
  String toString() => 'SvgPolyline(pts: ${points.points.length}, id: $id)';
}
