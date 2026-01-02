part of '../svg_value.dart';

/// A specific length value (e.g., 10, 10px, 10em).
/// For now, we simplify to unit-less user units (double).
@immutable
final class SvgLength extends SvgLengthPercentage with SvgBaseValue {
  const SvgLength(this.value, [this.unit = SvgLengthUnit.none]);

  final double value;
  final SvgLengthUnit unit;
}

/// Units of measurement for SVG lengths.
enum SvgLengthUnit {
  /// User units (unitless).
  none,

  /// Pixels.
  px,

  /// Centimeters.
  cm,

  /// Millimeters.
  mm,

  /// Quarters of millimeters.
  q,

  /// Inches.
  inUnit, // 'in' is a keyword in Dart
  /// Points.
  pt,

  /// Picas.
  pc,

  /// 1% of the viewport's width.
  vw,

  /// 1% of the viewport's height.
  vh,

  /// 1% of the smaller dimension of the viewport.
  vmin,

  /// 1% of the larger dimension of the viewport.
  vmax,
}
