import '../../svg_model/_svg_model.dart';

/// Extension on [String] to convert it to an [SvgClipRule].
extension ToSvgClipRule on String {
  /// Parses the string as an [SvgClipRule].
  SvgClipRule? toSvgClipRule() {
    return SvgClipRule.from(trim().toLowerCase());
  }
}
