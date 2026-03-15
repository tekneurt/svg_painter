import '../../svg_model/_svg_model.dart';

/// Extension on [String] to facilitate conversion to SVG font weights.
extension ToSvgFontWeight on String {
  /// Parses the string as an [SvgFontWeight].
  ///
  /// Returns null if the string is not a valid font weight.
  SvgFontWeight? toSvgFontWeight() {
    final String trimmed = trim().toLowerCase();

    // Keywords
    switch (trimmed) {
      case 'normal':
        return const SvgFontWeightNormal();
      case 'bold':
        return const SvgFontWeightBold();
      case 'bolder':
        return const SvgFontWeightBolder();
      case 'lighter':
        return const SvgFontWeightLighter();
    }

    // Numeric
    final double? parsed = double.tryParse(trimmed);
    if (parsed != null && parsed >= 1 && parsed <= 1000) {
      return SvgFontWeightNumeric(parsed);
    }

    return null;
  }
}
