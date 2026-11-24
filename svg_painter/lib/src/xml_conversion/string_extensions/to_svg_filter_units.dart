import '../../svg_model/_svg_model.dart';

/// Extension on [String] to convert XML attribute strings to [SvgFilterUnits].
extension ToSvgFilterUnits on String {
  /// Converts this string to an [SvgFilterUnits].
  SvgFilterUnits? toSvgFilterUnits() => SvgFilterUnits.from(this);
}
