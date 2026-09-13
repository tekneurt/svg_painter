import '../../svg_model/_svg_model.dart';

/// Extension on [String] to facilitate conversion to SVG numbers.
extension ToSvgNumber on String {
  /// Parses the string as an [SvgNumber].
  ///
  /// Returns null if the string is not a valid number.
  SvgNumber? toSvgNumber() {
    final double? parsed = double.tryParse(trim());
    return parsed == null ? null : SvgGenericNumber(parsed);
  }

  /// Parses the string as an [SvgNonNegativeNumber].
  ///
  /// Returns null if the string is missing, not a valid number, or negative.
  SvgNonNegativeNumber? toSvgNonNegativeNumber() {
    final double? parsed = double.tryParse(trim());
    if (parsed == null || parsed < 0) {
      return null;
    }
    return SvgNonNegativeNumber(parsed);
  }

  /// Parses the string as an [SvgNumber] for miter limit.
  ///
  /// Returns null if the string is missing, not a valid number, or less than 1.0.
  SvgNumber? toSvgMiterLimit() {
    final double? parsed = double.tryParse(trim());
    if (parsed == null || parsed < 1.0) {
      return null;
    }
    return SvgGenericNumber(parsed);
  }
}
