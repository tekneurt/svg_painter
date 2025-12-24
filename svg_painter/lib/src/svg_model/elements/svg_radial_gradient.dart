part of '../svg_element.dart';

/// Represents a <radialGradient> element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Element/radialGradient
@immutable
final class SvgRadialGradient extends SvgElement {
  const SvgRadialGradient({
    required this.stops,
    required this.cx,
    required this.cy,
    required this.r,
    required this.fx,
    required this.fy,
    required this.fr,
    this.gradientTransform,
    super.id,
  });

  /// The stops defining the gradient.
  final List<SvgStop> stops;

  /// The x-coordinate of the center of the gradient.
  final SvgLengthPercentage cx;

  /// The y-coordinate of the center of the gradient.
  final SvgLengthPercentage cy;

  /// The radius of the gradient.
  final SvgLengthPercentage r;

  /// The x-coordinate of the focal point.
  final SvgLengthPercentage fx;

  /// The y-coordinate of the focal point.
  final SvgLengthPercentage fy;

  /// The focal radius of the gradient.
  final SvgLengthPercentage fr;

  /// The transform applied to the gradient.
  final String? gradientTransform;
}

/// Represents a <stop> element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Element/stop
@immutable
final class SvgStop extends SvgElement {
  const SvgStop({
    required this.offset,
    required this.stopColor,
    required this.stopOpacity,
    super.id,
  });

  /// The offset of the gradient stop.
  final SvgLengthPercentage offset;

  /// The color of the gradient stop.
  final SvgColor? stopColor;

  /// The opacity of the gradient stop.
  final SvgLengthPercentage stopOpacity;
}
