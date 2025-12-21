part of '../svg_element.dart';

/// Represents a <circle> element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/circle
@immutable
final class SvgCircle extends SvgGraphicsElement {
  const SvgCircle({
    required this.cx,
    required this.cy,
    required this.r,
    super.id,
    super.fill,
    super.stroke,
    super.strokeWidth,
  });

  /// The x-coordinate of the center of the circle.
  final SvgLengthPercentage cx;

  /// The y-coordinate of the center of the circle.
  final SvgLengthPercentage cy;

  /// The radius of the circle.
  final SvgLengthPercentage r;
}
