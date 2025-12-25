import 'package:meta/meta.dart';

part 'values/svg_auto.dart';
part 'values/svg_length.dart';
part 'values/svg_percentage.dart';
part 'values/svg_view_box.dart';
part 'values/svg_color.dart';
part 'values/svg_stroke_linecap.dart';
part 'values/svg_stroke_linejoin.dart';
part 'values/colors/svg_named_color.dart';
part 'values/colors/svg_rgb_color.dart';
part 'values/colors/svg_hsl_color.dart';
part 'values/colors/svg_none_color.dart';
part 'values/colors/svg_current_color.dart';
part 'values/colors/svg_paint_reference.dart';
part 'values/colors/svg_color_name.dart';
part 'values/svg_point_list.dart';

/// Base class for all SVG attribute values.
@immutable
sealed class SvgValue {
  const SvgValue();
}

/// Represents a value that can be a length, percentage, or auto.
@immutable
sealed class SvgLengthPercentageAuto extends SvgValue with SvgBaseValue {
  const SvgLengthPercentageAuto();
}

/// Represents a value that can be either a length or a percentage.
@immutable
sealed class SvgLengthPercentage extends SvgLengthPercentageAuto {
  const SvgLengthPercentage();
}

/// Mixin that defines SVG base value types.
///
/// This mixin is applied to the lowest-level value types that can serve
/// as default values for SVG attributes:
/// - [SvgLength] - for length defaults (e.g., `0` for cx, cy)
/// - [SvgPercentage] - for percentage defaults
/// - [SvgAuto] - for auto defaults (e.g., rx, ry)
///
/// The wrapper types ([SvgLengthPercentage], [SvgLengthPercentageAuto])
/// do NOT use this mixin since defaults are always specific base types.
mixin SvgBaseValue {}
