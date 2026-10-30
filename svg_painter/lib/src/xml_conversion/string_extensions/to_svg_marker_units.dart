import '../../svg_model/_svg_model.dart';

/// Extension on [String] to convert it to an [SvgMarkerUnits].
extension ToSvgMarkerUnits on String {
  /// Parses the string as an [SvgMarkerUnits].
  SvgMarkerUnits? toSvgMarkerUnits() {
    final String trimmed = trim();
    if (trimmed.isEmpty) {
      return null;
    }
    return SvgMarkerUnits.from(trimmed);
  }
}
