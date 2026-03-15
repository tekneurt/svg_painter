part of '../../svg_element.dart';

/// Base class for gradient elements (`<linearGradient>`, `<radialGradient>`).
@immutable
sealed class SvgGradient extends SvgDefinitionElement {
  const SvgGradient({required this.stops, super.id, this.gradientTransformAttributes});

  /// The color stops for this gradient.
  final List<SvgStop> stops;

  /// The transformation applied to the gradient.
  final SvgTransformAttributes? gradientTransformAttributes;
}
