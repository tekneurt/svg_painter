part of '../../svg_element.dart';

/// Represents a `<radialGradient>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/radialGradient
@immutable
final class SvgRadialGradient extends SvgGradient {
  const SvgRadialGradient({
    this.cx,
    this.cy,
    this.r,
    this.fx,
    this.fy,
    this.fr,
    required super.stops,
    super.gradientTransformAttributes,
    super.gradientUnits,
    super.spreadMethod,
    super.href,
    super.color,
    super.colorInterpolation,
    super.coreAttributes,
  });

  /// The x-axis coordinate of the center of the largest circle for the gradient.
  final SvgLengthPercentage? cx;

  /// The y-axis coordinate of the center of the largest circle for the gradient.
  final SvgLengthPercentage? cy;

  /// The radius of the largest circle for the gradient.
  final SvgLengthPercentage? r;

  /// The x-axis coordinate of the focal point for the gradient.
  final SvgLengthPercentage? fx;

  /// The y-axis coordinate of the focal point for the gradient.
  final SvgLengthPercentage? fy;

  /// The radius of the focal circle for the gradient.
  final SvgLengthPercentage? fr;

  @override
  String toString() {
    final parts = <String>[
      if (cx != null) 'cx: $cx',
      if (cy != null) 'cy: $cy',
      if (r != null) 'r: $r',
      if (fx != null) 'fx: $fx',
      if (fy != null) 'fy: $fy',
      if (fr != null) 'fr: $fr',
      'stops: ${stops.length}',
      if (gradientTransformAttributes != null) 'transform: $gradientTransformAttributes',
      if (gradientUnits != null) 'units: $gradientUnits',
      if (spreadMethod != null) 'spread: $spreadMethod',
      if (colorInterpolation != null) 'color-interpolation: $colorInterpolation',
      if (href != null) 'href: $href',
      if (id != null) 'id: $id',
    ];
    return 'SvgRadialGradient(${parts.join(', ')})';
  }
}
