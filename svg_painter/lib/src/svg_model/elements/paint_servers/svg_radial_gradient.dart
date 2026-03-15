part of '../../svg_element.dart';

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
    super.gradientTransformAttributes,
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
  String toString() {
    final List<String> parts = <String>[
      'cx: $cx',
      'cy: $cy',
      'r: $r',
      'fx: $fx',
      'fy: $fy',
      'fr: $fr',
      'stops: ${stops.length}',
      if (gradientTransformAttributes != null) 'transform: $gradientTransformAttributes',
      if (id != null) 'id: $id',
    ];
    return 'SvgRadialGradient(${parts.join(', ')})';
  }
}
