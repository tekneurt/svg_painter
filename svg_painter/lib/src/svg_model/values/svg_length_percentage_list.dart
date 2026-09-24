part of '../svg_value.dart';

/// Represents a list of lengths or percentages (e.g. for `x` or `y` on `<text>` or `<tspan>`).
@immutable
final class SvgLengthPercentageList extends SvgValue with SvgBaseValue implements SvgLengthPercentageOrList {
  const SvgLengthPercentageList(this.values);

  /// Convenient factory for a single length or percentage.
  factory SvgLengthPercentageList.single(SvgLengthPercentage value) =>
      SvgLengthPercentageList(<SvgLengthPercentage>[value]);

  /// The list of coordinate values.
  final List<SvgLengthPercentage> values;

  /// The first coordinate in the list, or 0.0 if empty.
  SvgLengthPercentage get firstOrZero => primary;

  @override
  SvgLengthPercentage get primary =>
      values.isNotEmpty ? values.first : const SvgLength(0.0);

  @override
  List<SvgLengthPercentage> toList() => values;

  @override
  String toString() =>
      values.map((SvgLengthPercentage v) => v.toString()).join(', ');
}
