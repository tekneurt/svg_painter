part of '../svg_element.dart';

/// Represents a <linearGradient> element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Element/linearGradient
@immutable
final class SvgLinearGradient extends SvgElement {
  const SvgLinearGradient({
    required this.stops,
    required this.x1,
    required this.y1,
    required this.x2,
    required this.y2,
    this.gradientTransform,
    super.id,
  });

  /// The stops defining the gradient.
  final List<SvgStop> stops;

  /// The x-axis start coordinate of the gradient vector.
  final SvgLengthPercentage x1;

  /// The y-axis start coordinate of the gradient vector.
  final SvgLengthPercentage y1;

  /// The x-axis end coordinate of the gradient vector.
  final SvgLengthPercentage x2;

  /// The y-axis end coordinate of the gradient vector.
  final SvgLengthPercentage y2;

  /// The transform applied to the gradient.
  final String? gradientTransform;
}
