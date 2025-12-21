import '../../svg_model/_svg_model.dart';
import '../converters/svg_color_name_map.dart';

extension SvgColorToInt on SvgColor? {
  /// Returns the ARGB integer value of this color.
  ///
  /// If this color is null (not specified in SVG), it defaults to [fallback].
  /// Common SVG defaults are:
  /// - Fill: Black (0xFF000000)
  /// - Stroke: None (0x00000000)
  int toArgb({int fallback = 0x00000000}) {
    final SvgColor? self = this;
    if (self == null) {
      return fallback;
    }

    return switch (self) {
      final SvgNamedColor named => svgColorNameMap[named.name] ?? 0xFF000000,
      final SvgRgbColor rgb => (rgb.alpha << 24) |
          (rgb.red << 16) |
          (rgb.green << 8) |
          rgb.blue,
      final SvgHslColor hsl => _hslToArgb(hsl),
      final SvgNoneColor _ => 0x00000000,
      final SvgCurrentColor _ => 0xFF000000, // TODO(Gemini): Support currentColor context
      final SvgPaintReference ref => ref.fallback.toArgb(fallback: fallback),
    };
  }

  int _hslToArgb(SvgHslColor hsl) {
    final double h = hsl.hue;
    final double s = hsl.saturation / 100.0;
    final double l = hsl.lightness / 100.0;

    final double c = (1 - (2 * l - 1).abs()) * s;
    final double x = c * (1 - ((h / 60) % 2 - 1).abs());
    final double m = l - c / 2;

    double rPrime = 0, gPrime = 0, bPrime = 0;

    if (h < 60) {
      rPrime = c;
      gPrime = x;
    } else if (h < 120) {
      rPrime = x;
      gPrime = c;
    } else if (h < 180) {
      gPrime = c;
      bPrime = x;
    } else if (h < 240) {
      gPrime = x;
      bPrime = c;
    } else if (h < 300) {
      rPrime = x;
      bPrime = c;
    } else {
      rPrime = c;
      bPrime = x;
    }

    final int r = ((rPrime + m) * 255).round();
    final int g = ((gPrime + m) * 255).round();
    final int b = ((bPrime + m) * 255).round();
    final int a = (hsl.alpha * 255).round();

    return (a << 24) | (r << 16) | (g << 8) | b;
  }

  /// Returns the ARGB integer for a fill color, defaulting to black if null.
  int toFillArgb() => toArgb(fallback: 0xFF000000);

  /// Returns the ARGB integer for a stroke color, defaulting to none/transparent if null.
  int toStrokeArgb() => toArgb(fallback: 0x00000000);
}
