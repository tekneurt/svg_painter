import 'dart:math';

import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';

/// Extension to convert [SvgLength] to a double.
extension SvgLengthToDouble on SvgLength {
  /// Converts this [SvgLength] to a double value, resolving units against the context.
  double toDouble([SvgPaintingContext? context]) {
    const double dpi = 96.0;

    return switch (unit) {
      SvgLengthUnit.none || SvgLengthUnit.px => value,
      SvgLengthUnit.inUnit => value * dpi,
      SvgLengthUnit.cm => value * dpi / 2.54,
      SvgLengthUnit.mm => value * dpi / 2.54 / 10,
      SvgLengthUnit.q => value * dpi / 2.54 / 40,
      SvgLengthUnit.pc => value * dpi / 6.0,
      SvgLengthUnit.pt => value * dpi / 72.0,
      SvgLengthUnit.vw => value * (context?.viewBoxWidth ?? 100.0) / 100.0,
      SvgLengthUnit.vh => value * (context?.viewBoxHeight ?? 100.0) / 100.0,
      SvgLengthUnit.vmin =>
        value * min(context?.viewBoxWidth ?? 100.0, context?.viewBoxHeight ?? 100.0) / 100.0,
      SvgLengthUnit.vmax =>
        value * max(context?.viewBoxWidth ?? 100.0, context?.viewBoxHeight ?? 100.0) / 100.0,
    };
  }
}

/// Extension to convert [SvgPercentage] to a double.
extension SvgPercentageToDouble on SvgPercentage {
  /// Converts this [SvgPercentage] to a double value based on context and orientation.
  double resolve(SvgPaintingContext context, SvgOrientation orientation) {
    final double percentage = value / 100.0;
    return switch (orientation) {
      .horizontal => percentage * context.viewBoxWidth,
      .vertical => percentage * context.viewBoxHeight,
      .normalized => percentage * context.viewBoxNormalizedDiagonal,
      .unit => percentage,
    };
  }
}

/// Extension to convert [SvgLengthPercentage] to a double.
extension SvgLengthPercentageToDouble on SvgLengthPercentage {
  /// Converts this [SvgLengthPercentage] to a double value based on context and orientation.
  double resolve(SvgPaintingContext context, SvgOrientation orientation) {
    final SvgLengthPercentage self = this;
    return switch (self) {
      final SvgLength length => length.toDouble(context),
      final SvgPercentage percentage => percentage.resolve(context, orientation),
    };
  }

  /// Converts this [SvgLengthPercentage] to a position double value.
  double toPosition(SvgPaintingContext context, SvgOrientation orientation) {
    final SvgLengthPercentage self = this;
    return switch (self) {
      final SvgLength length => switch (orientation) {
        .horizontal => length.toDouble(context) + context.viewBoxMinX,
        .vertical => length.toDouble(context) + context.viewBoxMinY,
        .normalized || .unit => length.toDouble(context),
      },
      final SvgPercentage percentage => percentage.resolve(context, orientation),
    };
  }
}

/// Extension to convert [SvgLengthPercentageAuto] to a double.
extension SvgAutoToDouble on SvgLengthPercentageAuto {
  /// Converts this [SvgLengthPercentageAuto] to a double value, or null if it is 'auto'.
  double? resolveOrNull(SvgPaintingContext context, SvgOrientation orientation) {
    final SvgLengthPercentageAuto self = this;
    if (self is SvgLengthPercentage) {
      return self.resolve(context, orientation);
    }
    return null;
  }

  /// Converts this [SvgLengthPercentageAuto] to a position double value, or null if 'auto'.
  double? toPositionOrNull(SvgPaintingContext context, SvgOrientation orientation) {
    final SvgLengthPercentageAuto self = this;
    if (self is SvgLengthPercentage) {
      return self.toPosition(context, orientation);
    }
    return null;
  }
}
