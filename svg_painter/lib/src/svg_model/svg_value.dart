import 'package:meta/meta.dart';

part 'values/svg_length.dart';
part 'values/svg_percentage.dart';

/// Base class for all SVG attribute values.
@immutable
sealed class SvgValue {
  const SvgValue();
}

/// Represents a value that can be either a length or a percentage.
@immutable
sealed class SvgLengthPercentage extends SvgValue with SvgBaseValue {
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
