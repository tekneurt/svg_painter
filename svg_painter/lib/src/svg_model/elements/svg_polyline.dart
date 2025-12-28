part of '../svg_element.dart';

/// Represents a <polyline> element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/polyline
@immutable
final class SvgPolyline extends SvgBasicShape {
  const SvgPolyline({
    required this.points,
    super.id,
    super.fill,
    super.stroke,
    super.strokeWidth,
    super.strokeLinecap,
    super.strokeLinejoin,
    super.opacity,
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.fontFamily,
    super.cssClass,
    super.inlineStyle,
    super.transform,
  });

  /// The points that make up the polyline.
  final SvgPointList points;
}
