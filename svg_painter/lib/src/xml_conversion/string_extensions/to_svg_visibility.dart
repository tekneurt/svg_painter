import '../../svg_model/svg_value.dart';

/// Extension on [String] to convert it to an [SvgVisibility].
extension ToSvgVisibility on String {
  /// Parses the string as an [SvgVisibility].
  SvgVisibility? toSvgVisibility() {
    return SvgVisibility.from(this);
  }
}
