part of '../../svg_element.dart';

/// Base class for gradient elements (`<linearGradient>`, `<radialGradient>`).
@immutable
sealed class SvgGradient extends SvgDefinitionElement {
  const SvgGradient({required this.stops, super.id, this.gradientTransform});

  /// The color stops for this gradient.
  final List<SvgStop> stops;

  /// The transformation applied to the gradient.
  final String? gradientTransform;
}
