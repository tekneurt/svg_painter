import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';

extension SvgPercentageToValue on SvgPercentage {
  /// Converts this [SvgPercentage] to a double value based on context and orientation.
  double toDouble(SvgPaintingContext context, SvgOrientation orientation) {
    final double percentage = value / 100.0;
    return switch (orientation) {
      SvgOrientation.horizontal => percentage * context.viewBoxWidth,
      SvgOrientation.vertical => percentage * context.viewBoxHeight,
      SvgOrientation.normalized => percentage * context.viewBoxNormalizedDiagonal,
      SvgOrientation.unit => percentage,
    };
  }
}

/// Orientation for resolving percentages.
enum SvgOrientation {
  /// Horizontal orientation (resolved against width).
  horizontal,

  /// Vertical orientation (resolved against height).
  vertical,

  /// Normalized orientation (resolved against diagonal).
  normalized,

  /// Unit orientation (100% = 1.0). Used for opacity.
  unit,
}
