import '../../svg_model/svg_value.dart';

/// Extension on [String] to convert it to [SvgLengthPercentage].
extension StringToLength on String {
  /// Parses the string as an [SvgLengthPercentage].
  SvgLengthPercentage toSvgLengthPercentage() {
    if (endsWith('%')) {
      final String numberPart = substring(0, length - 1);
      final double? parsed = double.tryParse(numberPart);
      if (parsed != null) {
        return SvgPercentage(parsed);
      }
    }

    // Attempt to parse as direct number (simplification of CSS length)
    // TODO(Gemini): Handle units (px, em, etc.)
    final double? parsed = double.tryParse(this);
    if (parsed != null) {
      return SvgLength(parsed);
    }

    return const SvgLength(0.0);
  }
}
