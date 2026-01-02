part of '../svg_element.dart';

/// Base class for gradient elements (<linearGradient>, <radialGradient>).
@immutable
sealed class SvgGradient extends SvgDefinitionElement {
  const SvgGradient({required this.stops, super.id, this.gradientTransform});

  /// The color stops for this gradient.
  final List<SvgStop> stops;

  /// The transformation applied to the gradient.
  final String? gradientTransform;
}

/// Represents a <stop> element within a gradient.
@immutable
final class SvgStop extends SvgDefinitionElement {
  const SvgStop({
    required this.offset,
    required this.stopColor,
    required this.stopOpacity,
    super.id,
  });

  /// The location of the color stop (length or percentage).
  final SvgLengthPercentage offset;

  /// The color of the stop.
  final SvgColor stopColor;

  /// The opacity of the stop (0.0 to 1.0).
  final SvgLengthPercentage stopOpacity;
}
