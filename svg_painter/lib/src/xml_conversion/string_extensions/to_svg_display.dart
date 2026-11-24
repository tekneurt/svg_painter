import '../../svg_model/svg_value.dart';

/// Extension on [String] to convert it to an [SvgDisplay].
extension ToSvgDisplay on String {
  /// Parses the string as an [SvgDisplay].
  SvgDisplay? toSvgDisplay() {
    return SvgDisplay.from(this);
  }
}
