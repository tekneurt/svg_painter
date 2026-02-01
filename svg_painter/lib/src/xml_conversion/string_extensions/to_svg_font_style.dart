import '../../svg_model/_svg_model.dart';

/// Extension on [String] to facilitate conversion to SVG font styles.
extension ToSvgFontStyle on String {
  /// Parses the string as an [SvgFontStyle].
  ///
  /// Returns null if the string is not a valid font style.
  SvgFontStyle? toSvgFontStyle() {
    final String trimmed = trim().toLowerCase();
    for (final SvgFontStyle style in SvgFontStyle.values) {
      if (style.value == trimmed) {
        return style;
      }
    }
    return null;
  }
}
