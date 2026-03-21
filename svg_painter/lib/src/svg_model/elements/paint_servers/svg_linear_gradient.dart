part of '../../svg_element.dart';

/// Represents a `<linearGradient>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/linearGradient
@immutable
final class SvgLinearGradient extends SvgGradient {
  const SvgLinearGradient({
    required this.x1,
    required this.y1,
    required this.x2,
    required this.y2,
    required super.stops,
    super.gradientTransformAttributes,
    super.gradientUnits,
    super.spreadMethod,
    super.coreAttributes,
  });

  /// The x-axis coordinate of the start of the gradient vector.
  final SvgLengthPercentage x1;

  /// The y-axis coordinate of the start of the gradient vector.
  final SvgLengthPercentage y1;

  /// The x-axis coordinate of the end of the gradient vector.
  final SvgLengthPercentage x2;

  /// The y-axis coordinate of the end of the gradient vector.
  final SvgLengthPercentage y2;

  @override
  String toString() {
    final List<String> parts = <String>[
      'x1: $x1',
      'y1: $y1',
      'x2: $x2',
      'y2: $y2',
      'stops: ${stops.length}',
      if (gradientTransformAttributes != null) 'transform: $gradientTransformAttributes',
      'units: $gradientUnits',
      'spread: $spreadMethod',
      if (id != null) 'id: $id',
    ];
    return 'SvgLinearGradient(${parts.join(', ')})';
  }
}
