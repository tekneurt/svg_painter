part of '../svg_element.dart';

/// Represents a <polyline> element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/polyline
@immutable
final class SvgPolyline extends SvgGraphicsElement {
  const SvgPolyline({
    required this.points,
    super.id,
    super.fill,
    super.stroke,
    super.strokeWidth,
    super.transform,
  });

  /// The list of points defining the polyline.
  final SvgPointList points;
}
