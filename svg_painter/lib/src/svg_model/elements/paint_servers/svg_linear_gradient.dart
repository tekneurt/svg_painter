part of '../../svg_element.dart';

/// Represents a `<linearGradient>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/linearGradient
@immutable
final class SvgLinearGradient extends SvgGradient {
  const SvgLinearGradient({
    this.x1,
    this.y1,
    this.x2,
    this.y2,
    required super.stops,
    super.gradientTransformAttributes,
    super.gradientUnits,
    super.spreadMethod,
    super.href,
    super.color,
    super.coreAttributes,
  });

  /// The x-axis coordinate of the start of the gradient vector.
  final SvgLengthPercentage? x1;

  /// The y-axis coordinate of the start of the gradient vector.
  final SvgLengthPercentage? y1;

  /// The x-axis coordinate of the end of the gradient vector.
  final SvgLengthPercentage? x2;

  /// The y-axis coordinate of the end of the gradient vector.
  final SvgLengthPercentage? y2;

  @override
  String toString() {
    final parts = <String>[
      if (x1 != null) 'x1: $x1',
      if (y1 != null) 'y1: $y1',
      if (x2 != null) 'x2: $x2',
      if (y2 != null) 'y2: $y2',
      'stops: ${stops.length}',
      if (gradientTransformAttributes != null) 'transform: $gradientTransformAttributes',
      if (gradientUnits != null) 'units: $gradientUnits',
      if (spreadMethod != null) 'spread: $spreadMethod',
      if (href != null) 'href: $href',
      if (id != null) 'id: $id',
    ];
    return 'SvgLinearGradient(${parts.join(', ')})';
  }
}
