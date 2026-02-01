import '../../base/_base.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';
import 'svg_percentage_to_double.dart';

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

/// Extension to convert [SvgLengthPercentage] to a double.
extension SvgLengthPercentageToDouble on SvgLengthPercentage {
  /// Converts this [SvgLengthPercentage] to a double value based on context and orientation.
  double resolve(SvgPaintingContext context, SvgOrientation orientation) {
    final SvgLengthPercentage self = this;
    return switch (self) {
      final SvgLength length => length.value,
      final SvgPercentage percentage => percentage.resolve(context, orientation),
    };
  }

  /// Converts this [SvgLengthPercentage] to a position double value.
  double toPosition(SvgPaintingContext context, SvgOrientation orientation) {
    final SvgLengthPercentage self = this;
    return switch (self) {
      final SvgLength length => switch (orientation) {
        SvgOrientation.horizontal => length.value + context.viewBoxMinX,
        SvgOrientation.vertical => length.value + context.viewBoxMinY,
        SvgOrientation.normalized => length.value,
        SvgOrientation.unit => length.value,
      },
      final SvgPercentage percentage => percentage.resolve(context, orientation),
    };
  }
}
