import '../../svg_model/_svg_model.dart';

/// Extension on [String] to convert XML attribute strings to [SvgPatternUnits].
extension ToSvgPatternUnits on String {
  /// Converts this string to an [SvgPatternUnits].
  SvgPatternUnits? toSvgPatternUnits() => SvgPatternUnits.from(this);
}
