import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';
import 'svg_length_to_double.dart';
import 'svg_percentage_to_double.dart';

extension SvgLengthPercentageToValue on SvgLengthPercentage {
  double toDouble(SvgPaintingContext context, SvgOrientation orientation) {
    final SvgLengthPercentage self = this;
    return switch (self) {
      final SvgLength length => length.toDouble(),
      final SvgPercentage percentage => percentage.toDouble(context, orientation),
    };
  }

  double toPosition(SvgPaintingContext context, SvgOrientation orientation) {
    final double val = toDouble(context, orientation);
    return switch (orientation) {
      SvgOrientation.horizontal => val - context.viewBoxMinX,
      SvgOrientation.vertical => val - context.viewBoxMinY,
      SvgOrientation.normalized => val, // Radii are not positions
    };
  }
}
