part of '../svg_element.dart';

/// Represents a <circle> element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/circle
@immutable
final class SvgCircle extends SvgBasicShape {
  const SvgCircle({
    required this.cx,
    required this.cy,
    required this.r,
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

  /// The x-axis coordinate of the center of the circle.
  final SvgLengthPercentage cx;

  /// The y-axis coordinate of the center of the circle.
  final SvgLengthPercentage cy;

  /// The radius of the circle.
  final SvgLengthPercentage r;

  @override
  String toString() => 'SvgCircle(cx: $cx, cy: $cy, r: $r, id: $id)';
}
