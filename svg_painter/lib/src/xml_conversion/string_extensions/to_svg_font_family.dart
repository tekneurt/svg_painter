import '../../svg_model/_svg_model.dart';

/// Extension on [String] to facilitate conversion to SVG font families.
extension ToSvgFontFamily on String {
  /// Parses the string as an [SvgFontFamily].
  SvgFontFamily toSvgFontFamily() {
    return SvgFontFamily(trim());
  }
}
