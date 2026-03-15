part of '../svg_value.dart';

/// Represents a unitless number in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Content_type#number
@immutable
sealed class SvgNumber extends SvgValue with SvgBaseValue {
  const SvgNumber();

  /// The numeric value.
  double get value;

  @override
  String toString() => 'SvgNumber($value)';
}

/// A generic SVG number that can be any value.
final class SvgGenericNumber extends SvgNumber {
  const SvgGenericNumber(this.value);

  @override
  final double value;
}

/// An SVG number that must be non-negative.
final class SvgNonNegativeNumber extends SvgNumber {
  const SvgNonNegativeNumber(this.value) : assert(value >= 0, 'SVG Number must be non-negative');

  @override
  final double value;
}
