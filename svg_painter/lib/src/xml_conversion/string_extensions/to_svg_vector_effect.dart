import '../../svg_model/_svg_model.dart';

/// Extension on [String] to convert it to an [SvgVectorEffect].
extension ToSvgVectorEffect on String {
  /// Parses the string as an [SvgVectorEffect].
  ///
  /// Supports `none` and `non-scaling-stroke`.
  SvgVectorEffect? toSvgVectorEffect() {
    final String trimmed = trim().toLowerCase();
    if (trimmed.isEmpty) {
      return null;
    }
    return SvgVectorEffect.from(trimmed);
  }
}
