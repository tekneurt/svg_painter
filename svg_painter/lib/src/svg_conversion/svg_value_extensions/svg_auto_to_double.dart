import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';
import 'svg_length_to_double.dart';
import 'svg_percentage_to_double.dart';

extension SvgAutoToDouble on SvgAuto {
  /// Converts this [SvgAuto] to a double value.
  ///
  /// For [SvgAuto], this usually means returning a special value or handling
  /// it based on other dimensions (e.g., in [SvgEllipse]).
  double? toDouble() => null;
}

extension SvgLengthPercentageAutoToDouble on SvgLengthPercentageAuto {
  /// Converts this [SvgLengthPercentageAuto] to a double value, or null if it is 'auto'.
  ///
  /// Returns null if the value is 'auto', allowing the caller to handle
  /// context-dependent fallback logic.
  double? resolveOrNull(SvgPaintingContext context, SvgOrientation orientation) {
    final SvgLengthPercentageAuto self = this;
    return switch (self) {
      final SvgLength length => length.toDouble(context),
      final SvgPercentage percentage => percentage.resolve(context, orientation),
      SvgAuto() => null,
    };
  }

  double? toPositionOrNull(SvgPaintingContext context, SvgOrientation orientation) {
    final double? val = resolveOrNull(context, orientation);
    if (val == null) {
      return null;
    }
    return switch (orientation) {
      .horizontal => val - context.viewBoxMinX,
      .vertical => val - context.viewBoxMinY,
      .normalized => val,
      .unit => val,
    };
  }
}
