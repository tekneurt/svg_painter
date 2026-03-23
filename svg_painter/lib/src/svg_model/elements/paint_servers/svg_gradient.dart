part of '../../svg_element.dart';

/// Base class for gradient elements (`<linearGradient>`, `<radialGradient>`).
@immutable
sealed class SvgGradient extends SvgDefinitionElement {
  const SvgGradient({
    required this.stops,
    this.gradientTransformAttributes,
    this.gradientUnits = SvgGradientUnits.objectBoundingBox,
    this.spreadMethod = SvgSpreadMethod.pad,
    super.coreAttributes,
  });

  /// The color stops for this gradient.
  final List<SvgStop> stops;

  /// The transformation applied to the gradient.
  final SvgTransformAttributes? gradientTransformAttributes;

  /// The coordinate system used for the gradient coordinates.
  final SvgGradientUnits gradientUnits;

  /// The method used to fill the area outside the gradient vector.
  final SvgSpreadMethod spreadMethod;
}
