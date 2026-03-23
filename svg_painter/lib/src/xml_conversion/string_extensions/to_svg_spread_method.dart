import '../../svg_model/_svg_model.dart';

/// Extension to convert a string to [SvgSpreadMethod].
extension ToSvgSpreadMethod on String {
  /// Converts this string to an [SvgSpreadMethod] enum value.
  SvgSpreadMethod toSvgSpreadMethod() {
    return SvgSpreadMethod.from(trim()) ?? SvgSpreadMethod.pad;
  }
}
