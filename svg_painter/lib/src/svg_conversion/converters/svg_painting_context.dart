import 'dart:math' as math;

import '../../svg_model/_svg_model.dart';

/// Context for converting SVG models to painting models.
/// Holds information needed for resolving relative values like percentages.
final class SvgPaintingContext {
  const SvgPaintingContext({
    required this.viewBoxWidth,
    required this.viewBoxHeight,
    this.viewBoxMinX = 0.0,
    this.viewBoxMinY = 0.0,
    this.definitions = const <String, SvgElement>{},
  });

  /// The width of the viewport/viewBox.
  final double viewBoxWidth;

  /// The height of the viewport/viewBox.
  final double viewBoxHeight;

  /// The min-x coordinate of the viewBox.
  final double viewBoxMinX;

  /// The min-y coordinate of the viewBox.
  final double viewBoxMinY;

  /// Map of element IDs to SvgElements.
  final Map<String, SvgElement> definitions;

  /// Returns the normalized diagonal length of the viewBox for resolving radii.
  /// Formula: sqrt(w*w + h*h) / sqrt(2)
  double get viewBoxNormalizedDiagonal {
    return math.sqrt(viewBoxWidth * viewBoxWidth + viewBoxHeight * viewBoxHeight) / math.sqrt(2.0);
  }
}
