import '../../svg_model/_svg_model.dart';
import 'to_svg_length_unit.dart';

/// Extension on [String] to convert it to [SvgLength].
extension ToSvgLength on String {
  /// Parses the string as an [SvgLength].
  SvgLength toSvgLength() {
    final String trimmed = trim();
    if (trimmed.isEmpty) {
      return const SvgLength(0.0);
    }

    // Try to extract number and unit suffix
    final unitRegex = RegExp(r'^(-?\d*\.?\d*)([a-zA-Z%]*)$');
    final Match? match = unitRegex.firstMatch(trimmed);

    if (match == null) {
      return const SvgLength(0.0);
    } else {
      final String? numberPart = match.group(1);
      final String? unitSuffix = match.group(2);

      if (numberPart == null || unitSuffix == null) {
        return const SvgLength(0.0);
      }

      final double? parsedNumber = double.tryParse(numberPart);
      if (parsedNumber == null) {
        return const SvgLength(0.0);
      } else {
        final SvgLengthUnit unit = unitSuffix.toSvgLengthUnit();
        return SvgLength(parsedNumber, unit);
      }
    }
  }
}
