import '../../svg_model/_svg_model.dart';

/// Extension on [String] to convert it to an [SvgTextAnchor].
extension ToSvgTextAnchor on String {
  /// Parses the string as an [SvgTextAnchor].
  SvgTextAnchor? toSvgTextAnchor() {
    return SvgTextAnchor.from(trim().toLowerCase());
  }
}
