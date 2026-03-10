import '../../svg_model/_svg_model.dart'; // For SvgLength, SvgPercentage, SvgLengthUnit
import 'to_svg_length_unit.dart'; // For StringToSvgLengthUnit extension

/// Extension on [String] to convert it to [SvgLengthPercentage].
extension ToSvgLengthPercentage on String {
  /// Parses the string as an [SvgLengthPercentage].
  SvgLengthPercentage toSvgLengthPercentage() {
    final String trimmed = trim();
    if (trimmed.isEmpty) {
      return const SvgLength(0.0);
    }

    // Handle percentage first
    if (trimmed.endsWith('%')) {
      final String numberPart = trimmed.substring(0, trimmed.length - 1);
      final double? parsed = double.tryParse(numberPart);
      if (parsed == null) {
        // Failed to parse percentage number
      } else {
        return SvgPercentage(parsed);
      }
    }

    // Try to extract number and unit suffix
    final RegExp unitRegex = RegExp(r'^(-?\d*\.?\d*)([a-zA-Z%]*)$');
    final Match? match = unitRegex.firstMatch(trimmed);

    if (match != null) {
      final String? numberPart = match.group(1);
      final String? unitSuffix = match.group(2);

      if (numberPart != null && unitSuffix != null) {
        final double? parsedNumber = double.tryParse(numberPart);
        if (parsedNumber != null) {
          final SvgLengthUnit unit = unitSuffix.toSvgLengthUnit(); // Use new extension
          return SvgLength(parsedNumber, unit);
        }
      }
    }

    // Fallback if no specific unit or percentage found, or parsing failed
    return const SvgLength(0.0);
  }
}
