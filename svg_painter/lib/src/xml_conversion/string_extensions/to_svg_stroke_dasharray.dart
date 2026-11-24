import '../../svg_model/_svg_model.dart';

/// Extension on [String] to convert it to an [SvgPointList] for stroke-dasharray.
extension ToSvgStrokeDasharray on String {
  /// Parses the string as an [SvgPointList] for stroke-dasharray.
  ///
  /// Supports comma- and whitespace-separated lengths and percentages.
  /// Per SVG 1.1 Section 11.4:
  /// - 'none' returns null (indicating no dashing).
  /// - A negative value for a length or percentage is an error; returns null.
  /// - If an error occurs, it is treated as 'none' (returns null).
  SvgPointList? toSvgStrokeDasharray() {
    final String trimmed = trim();
    if (trimmed.isEmpty || trimmed.toLowerCase() == 'none') {
      return null;
    }

    final List<String> tokens = trimmed.split(RegExp(r'[\s,]+'));
    final values = <double>[];
    final tokenRegex = RegExp(r'^([+-]?\d*\.?\d+(?:[eE][+-]?\d+)?)([a-zA-Z%]*)$');

    for (final token in tokens) {
      if (token.isEmpty) {
        continue;
      }
      final Match? match = tokenRegex.firstMatch(token);
      if (match == null) {
        return null; // Invalid token per SVG spec
      }
      final String? numberStr = match.group(1);
      final String unit = match.group(2) ?? '';
      if (numberStr == null) {
        return null;
      }
      final double? parsedNumber = double.tryParse(numberStr);
      if (parsedNumber == null || parsedNumber < 0.0) {
        return null; // Negative or unparseable is an error
      }

      final double userUnits = _toUserUnits(parsedNumber, unit);
      if (userUnits.isNaN) {
        return null; // Unknown unit
      }
      values.add(userUnits);
    }

    if (values.isEmpty) {
      return null;
    }

    return SvgPointList(values);
  }

  static double _toUserUnits(double value, String unit) {
    const dpi = 96.0;
    return switch (unit.toLowerCase()) {
      '' || 'px' => value,
      'in' => value * dpi,
      'cm' => value * dpi / 2.54,
      'mm' => value * dpi / 25.4,
      'q' => value * dpi / 101.6,
      'pt' => value * dpi / 72.0,
      'pc' => value * dpi / 6.0,
      '%' => value,
      _ => double.nan,
    };
  }
}
