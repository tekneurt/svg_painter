part of '../../svg_value.dart';

/// Represents an RGB or RGBA color in SVG.
@immutable
final class SvgRgbColor extends SvgColor {
  const SvgRgbColor(this.alpha, this.red, this.green, this.blue);

  /// Creates an [SvgRgbColor] from an ARGB integer.
  const SvgRgbColor.fromArgb(int argb)
    : alpha = (argb >> 24) & 0xFF,
      red = (argb >> 16) & 0xFF,
      green = (argb >> 8) & 0xFF,
      blue = argb & 0xFF;

  final int alpha;
  final int red;
  final int green;
  final int blue;

  @override
  String toString() => 'SvgRgbColor($alpha, $red, $green, $blue)';
}
