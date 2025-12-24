part of '../svg_element.dart';

/// Represents a <polygon> element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/polygon
@immutable
final class SvgPolygon extends SvgGraphicsElement {
  const SvgPolygon({
    required this.points,
    super.id,
    super.fill,
    super.stroke,
    super.strokeWidth,
    super.transform,
  });

  /// The list of points defining the polygon.
  final SvgPointList points;
}
