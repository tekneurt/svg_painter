part of '../svg_element.dart';

/// Represents a `<radialGradient>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/radialGradient
@immutable
final class SvgRadialGradient extends SvgGradient {
  const SvgRadialGradient({
    required this.cx,
    required this.cy,
    required this.r,
    required this.fx,
    required this.fy,
    required this.fr,
    required super.stops,
    super.id,
    super.gradientTransform,
  });

  /// The x-axis coordinate of the center of the largest circle for the gradient.
  final SvgLengthPercentage cx;

  /// The y-axis coordinate of the center of the largest circle for the gradient.
  final SvgLengthPercentage cy;

  /// The radius of the largest circle for the gradient.
  final SvgLengthPercentage r;

  /// The x-axis coordinate of the focal point for the gradient.
  final SvgLengthPercentage fx;

  /// The y-axis coordinate of the focal point for the gradient.
  final SvgLengthPercentage fy;

  /// The radius of the focal circle for the gradient.
  final SvgLengthPercentage fr;

  @override
  String toString() => 'SvgRadialGradient(stops: ${stops.length}, id: $id)';
}
