part of '../svg_value.dart';

/// A percentage value (e.g., 50%).
@immutable
final class SvgPercentage extends SvgLengthPercentage with SvgBaseValue {
  const SvgPercentage(this.value);

  /// The percentage value (0-100).
  final double value;
}
