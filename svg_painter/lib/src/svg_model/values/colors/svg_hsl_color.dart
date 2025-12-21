part of '../../svg_value.dart';

/// Represents an HSL or HSLA color in SVG.
@immutable
final class SvgHslColor extends SvgColor {
  const SvgHslColor(this.alpha, this.hue, this.saturation, this.lightness);

  /// Alpha channel (0.0 - 1.0).
  final double alpha;

  /// Hue angle in degrees (0.0 - 360.0).
  final double hue;

  /// Saturation percentage (0.0 - 100.0).
  final double saturation;

  /// Lightness percentage (0.0 - 100.0).
  final double lightness;

  @override
  String toString() =>
      'SvgHslColor($alpha, ${hue.toStringAsFixed(1)}, ${saturation.toStringAsFixed(1)}%, ${lightness.toStringAsFixed(1)}%)';
}
