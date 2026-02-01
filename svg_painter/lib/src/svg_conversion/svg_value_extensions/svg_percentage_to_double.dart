import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';

extension SvgPercentageToDouble on SvgPercentage {
  /// Converts this [SvgPercentage] to a double value based on context and orientation.
  double resolve(SvgPaintingContext context, SvgOrientation orientation) {
    final double percentage = value / 100.0;
    return switch (orientation) {
      SvgOrientation.horizontal => percentage * context.viewBoxWidth,
      SvgOrientation.vertical => percentage * context.viewBoxHeight,
      SvgOrientation.normalized => percentage * context.viewBoxNormalizedDiagonal,
      SvgOrientation.unit => percentage,
    };
  }
}
