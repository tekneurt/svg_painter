import '../../svg_model/_svg_model.dart';

/// Extension on [String] to convert it to an [SvgFillRule].
extension ToSvgFillRule on String {
  /// Parses the string as an [SvgFillRule].
  SvgFillRule? toSvgFillRule() {
    return SvgFillRule.from(trim().toLowerCase());
  }
}
