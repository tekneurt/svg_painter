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

    // Handle CSS font-size keywords
    final SvgLengthPercentage? keywordLength = switch (trimmed.toLowerCase()) {
      'xx-small' => const SvgLength(9.0, SvgLengthUnit.px),
      'x-small' => const SvgLength(10.0, SvgLengthUnit.px),
      'small' => const SvgLength(13.333333333333334, SvgLengthUnit.px),
      'medium' => const SvgLength(16.0, SvgLengthUnit.px),
      'large' => const SvgLength(19.2, SvgLengthUnit.px),
      'x-large' => const SvgLength(24.0, SvgLengthUnit.px),
      'xx-large' => const SvgLength(32.0, SvgLengthUnit.px),
      'xxx-large' => const SvgLength(48.0, SvgLengthUnit.px),
      'smaller' => const SvgLength(1.0 / 1.2, SvgLengthUnit.em),
      'larger' => const SvgLength(1.2, SvgLengthUnit.em),
      _ => null,
    };
    if (keywordLength != null) {
      return keywordLength;
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
    final unitRegex = RegExp(r'^(-?\d*\.?\d*)([a-zA-Z%]*)$');
    final Match? match = unitRegex.firstMatch(trimmed);

    if (match != null) {
      if ((match.group(1), match.group(2)) case (
        final String numberPart,
        final String unitSuffix,
      )) {
        final double? parsedNumber = double.tryParse(numberPart);
        if (parsedNumber != null) {
          final SvgLengthUnit unit = unitSuffix.toSvgLengthUnit();
          return SvgLength(parsedNumber, unit);
        }
      }
    }

    // Fallback if no specific unit or percentage found, or parsing failed
    return const SvgLength(0.0);
  }
}
