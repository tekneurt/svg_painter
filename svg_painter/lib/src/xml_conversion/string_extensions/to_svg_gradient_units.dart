import '../../svg_model/_svg_model.dart';

/// Extension to convert a string to [SvgGradientUnits].
extension ToSvgGradientUnits on String {
  /// Converts this string to an [SvgGradientUnits] enum value.
  SvgGradientUnits toSvgGradientUnits() {
    return SvgGradientUnits.from(trim()) ?? SvgGradientUnits.objectBoundingBox;
  }
}
