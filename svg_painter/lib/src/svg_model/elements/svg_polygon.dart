part of '../svg_element.dart';

/// Represents a <polygon> element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/polygon
@immutable
final class SvgPolygon extends SvgBasicShape {
  const SvgPolygon({
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

  /// The points that define the polygon.
  final SvgPointList points;

  @override
  String toString() => 'SvgPolygon(pts: ${points.points.length}, id: $id)';
}
