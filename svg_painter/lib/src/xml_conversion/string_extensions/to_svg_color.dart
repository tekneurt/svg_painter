import '../../svg_model/_svg_model.dart';
import 'to_svg_url.dart';

/// Extension on [String] to convert it to an [SvgColor].
extension ToSvgColor on String {
  /// Parses the string as an [SvgColor].
  SvgColor? toSvgColor() {
    final String trimmed = trim();
    if (trimmed.isEmpty) {
      return null;
    }

    // url(#id) - Case sensitive ID
    final String? urlId = trimmed.extractUrlId();
    if (urlId != null) {
      return SvgPaintReference(urlId);
    }

    final String normalized = trimmed.toLowerCase();

    // Special keywords
    if (normalized == 'none') {
      return const SvgNoneColor();
    }
    if (normalized == 'currentcolor') {
      return const SvgCurrentColor();
    }

    // Named colors
    final SvgColorName? name = SvgColorName.fromName(normalized);
    if (name != null) {
      return SvgNamedColor(name);
    }

    // rgb(r, g, b) or rgba(r, g, b, a)
    if (normalized.startsWith('rgb')) {
      return _parseRgb(normalized);
    }

    // hsl(h, s, l) or hsla(h, s, l, a)
    if (normalized.startsWith('hsl')) {
      return _parseHsl(normalized);
    }

    // Hex codes
    if (normalized.startsWith('#')) {
      return _parseHex(normalized.substring(1));
    }

    return null;
  }

  SvgColor? _parseHsl(String hsl) {
    final RegExp hslRegex = RegExp(
      r'^hsla?\(\s*([\d.]+)(?:deg)?\s*,\s*([\d.]+)%\s*,\s*([\d.]+)%\s*(?:,\s*([\d.]+)\s*)?\)$',
    );
    final Match? match = hslRegex.firstMatch(hsl);
    if (match == null) {
      return null;
    }

    final double h = double.parse(match.group(1)!) % 360;
    final double s = double.parse(match.group(2)!).clamp(0.0, 100.0);
    final double l = double.parse(match.group(3)!).clamp(0.0, 100.0);
    final String? aGroup = match.group(4);
    final double a = aGroup == null ? 1.0 : double.parse(aGroup).clamp(0.0, 1.0);

    return SvgHslColor(a, h, s, l);
  }

  SvgColor? _parseRgb(String rgb) {
    final RegExp rgbRegex = RegExp(
      r'^rgba?\(\s*(\d+%?)\s*,\s*(\d+%?)\s*,\s*(\d+%?)\s*(?:,\s*([\d.]+)\s*)?\)$',
    );
    final Match? match = rgbRegex.firstMatch(rgb);
    if (match == null) {
      return null;
    }

    int parsePart(String part) {
      if (part.endsWith('%')) {
        final double percentage = double.parse(part.substring(0, part.length - 1));
        return (percentage * 255 / 100).round().clamp(0, 255);
      }
      return int.parse(part).clamp(0, 255);
    }

    final int r = parsePart(match.group(1)!);
    final int g = parsePart(match.group(2)!);
    final int b = parsePart(match.group(3)!);
    final String? aGroup = match.group(4);
    final int a = aGroup == null ? 255 : (double.parse(aGroup) * 255).round().clamp(0, 255);

    return SvgRgbColor(a, r, g, b);
  }

  SvgColor? _parseHex(String hex) {
    if (hex.length == 3) {
      final String r = hex[0];
      final String g = hex[1];
      final String b = hex[2];
      return _parseHex('$r$r$g$g$b$b');
    }

    if (hex.length == 6) {
      final int? val = int.tryParse(hex, radix: 16);
      if (val != null) {
        return SvgRgbColor.fromArgb(0xFF000000 | val);
      }
    }

    if (hex.length == 8) {
      final int? val = int.tryParse(hex, radix: 16);
      if (val != null) {
        // SVG hex 8-digit is RRGGBBAA, but SvgColor.fromArgb expects AARRGGBB
        final int rr = (val >> 24) & 0xFF;
        final int gg = (val >> 16) & 0xFF;
        final int bb = (val >> 8) & 0xFF;
        final int aa = val & 0xFF;
        return SvgRgbColor(aa, rr, gg, bb);
      }
    }

    return null;
  }
}
