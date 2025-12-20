part of '../svg_value.dart';

/// A specific length value (e.g., 10, 10px, 10em).
/// For now, we simplify to unit-less user units (double).
@immutable
final class SvgLength extends SvgLengthPercentage {
  const SvgLength(this.value);

  final double value;
}
