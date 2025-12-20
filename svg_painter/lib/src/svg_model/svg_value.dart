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
sealed class SvgLengthPercentage extends SvgValue {
  const SvgLengthPercentage();
}
