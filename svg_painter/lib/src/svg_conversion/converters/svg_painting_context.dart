import 'dart:math' as math;

/// Context for converting SVG models to painting models.
/// Holds information needed for resolving relative values like percentages.
final class SvgPaintingContext {
  const SvgPaintingContext({
    required this.viewBoxWidth,
    required this.viewBoxHeight,
  });

  /// The width of the viewport/viewBox.
  final double viewBoxWidth;

  /// The height of the viewport/viewBox.
  final double viewBoxHeight;

  /// Returns the normalized diagonal length of the viewBox for resolving radii.
  /// Formula: sqrt(w*w + h*h) / sqrt(2)
  double get viewBoxNormalizedDiagonal {
    return math.sqrt(viewBoxWidth * viewBoxWidth + viewBoxHeight * viewBoxHeight) / math.sqrt(2.0);
  }
}
