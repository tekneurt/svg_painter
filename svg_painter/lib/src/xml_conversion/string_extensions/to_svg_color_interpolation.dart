import '../../svg_model/_svg_model.dart';

/// Extension to convert a string to [SvgColorInterpolation].
extension ToSvgColorInterpolation on String {
  /// Converts this string to an [SvgColorInterpolation] enum value.
  SvgColorInterpolation toSvgColorInterpolation() {
    return SvgColorInterpolation.from(trim()) ?? SvgColorInterpolation.sRGB;
  }
}
