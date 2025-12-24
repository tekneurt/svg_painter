part of '../svg_element.dart';

/// Represents a <linearGradient> element in SVG.
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
    super.id,
    super.gradientTransform,
  });

  /// The x-axis coordinate of the start of the gradient vector.
  final SvgLengthPercentage x1;

  /// The y-axis coordinate of the start of the gradient vector.
  final SvgLengthPercentage y1;

  /// The x-axis coordinate of the end of the gradient vector.
  final SvgLengthPercentage x2;

  /// The y-axis coordinate of the end of the gradient vector.
  final SvgLengthPercentage y2;
}
