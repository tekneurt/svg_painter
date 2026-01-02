import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';
import 'svg_length_to_double.dart';
import 'svg_percentage_to_double.dart';

extension SvgAutoToDouble on SvgAuto {
  /// Converts this [SvgAuto] to a double value.
  ///
  /// Since 'auto' resolution is often context-dependent, this method
  /// accepts an optional [fallback] value.
  double toDouble({double fallback = 0.0}) {
    return fallback;
  }
}

extension SvgLengthPercentageAutoToDouble on SvgLengthPercentageAuto {
  /// Converts this [SvgLengthPercentageAuto] to a double value.
  ///
  /// Returns null if the value is 'auto', allowing the caller to handle
  /// context-dependent fallback logic.
  double? toDoubleOrNull(SvgPaintingContext context, SvgOrientation orientation) {
    final SvgLengthPercentageAuto self = this;
    return switch (self) {
      final SvgLength length => length.toDouble(context),
      final SvgPercentage percentage => percentage.toDouble(context, orientation),
      SvgAuto() => null,
    };
  }

  double? toPositionOrNull(SvgPaintingContext context, SvgOrientation orientation) {
    final double? val = toDoubleOrNull(context, orientation);
    if (val == null) {
      return null;
    }
    return switch (orientation) {
      SvgOrientation.horizontal => val - context.viewBoxMinX,
      SvgOrientation.vertical => val - context.viewBoxMinY,
      SvgOrientation.normalized => val,
      SvgOrientation.unit => val,
    };
  }
}
