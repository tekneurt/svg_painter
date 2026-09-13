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
    if (urlId == null) {
      // Not a reference
    } else {
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
    if (name == null) {
      // Not a named color
    } else {
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
    final hslCommaRegex = RegExp(
      r'^hsla?\(\s*([\d.]+)(?:deg)?\s*,\s*([\d.]+)%\s*,\s*([\d.]+)%\s*(?:,\s*([\d.]+%?)\s*)?\)$',
    );
    final hslSpaceRegex = RegExp(
      r'^hsla?\(\s*([\d.]+)(?:deg)?\s+([\d.]+)%\s+([\d.]+)%\s*(?:\/\s*([\d.]+%?)\s*)?\)$',
    );
    final Match? match = hslCommaRegex.firstMatch(hsl) ?? hslSpaceRegex.firstMatch(hsl);
    if (match == null) {
      return null;
    }

    final String? aGroup = match.group(4);
    final double a = switch (aGroup) {
      null => 1.0,
      final String s when s.endsWith('%') =>
        (double.parse(s.substring(0, s.length - 1)) / 100.0).clamp(0.0, 1.0),
      final String s => double.parse(s).clamp(0.0, 1.0),
    };

    return switch ((match.group(1), match.group(2), match.group(3))) {
      (final String hStr, final String sStr, final String lStr) => SvgHslColor(
          a,
          double.parse(hStr) % 360,
          double.parse(sStr).clamp(0.0, 100.0),
          double.parse(lStr).clamp(0.0, 100.0),
        ),
      _ => null,
    };
  }

  SvgColor? _parseRgb(String rgb) {
    final rgbCommaRegex = RegExp(
      r'^rgba?\(\s*(\d+%?)\s*,\s*(\d+%?)\s*,\s*(\d+%?)\s*(?:,\s*([\d.]+%?)\s*)?\)$',
    );
    final rgbSpaceRegex = RegExp(
      r'^rgba?\(\s*(\d+%?)\s+(\d+%?)\s+(\d+%?)\s*(?:\/\s*([\d.]+%?)\s*)?\)$',
    );
    final Match? match = rgbCommaRegex.firstMatch(rgb) ?? rgbSpaceRegex.firstMatch(rgb);
    if (match == null) {
      return null;
    }

    int parsePart(String part) {
      if (part.endsWith('%')) {
        final double percentage = double.parse(part.substring(0, part.length - 1));
        return (percentage * 255 / 100).round().clamp(0, 255);
      } else {
        return int.parse(part).clamp(0, 255);
      }
    }

    int parseAlpha(String? part) {
      if (part == null) {
        return 255;
      } else if (part.endsWith('%')) {
        final double percentage = double.parse(part.substring(0, part.length - 1));
        return (percentage * 255 / 100).round().clamp(0, 255);
      } else {
        return (double.parse(part) * 255).round().clamp(0, 255);
      }
    }

    final int a = parseAlpha(match.group(4));

    return switch ((match.group(1), match.group(2), match.group(3))) {
      (final String rStr, final String gStr, final String bStr) => SvgRgbColor(
          a,
          parsePart(rStr),
          parsePart(gStr),
          parsePart(bStr),
        ),
      _ => null,
    };
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
      if (val == null) {
        return null;
      } else {
        return SvgRgbColor.fromArgb(0xFF000000 | val);
      }
    }

    if (hex.length == 8) {
      final int? val = int.tryParse(hex, radix: 16);
      if (val == null) {
        return null;
      } else {
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
