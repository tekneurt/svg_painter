/// Helper for normalizing SVG whitespace according to spec rules.
extension SvgWhitespaceNormalizer on String {
  /// Normalizes this string according to SVG whitespace rules.
  ///
  /// If [preserve] is true, it follows `xml:space="preserve"` rules:
  /// - Replace all newline (\n), tab (\t), and carriage return (\r) with space.
  ///
  /// If [preserve] is false, it follows `xml:space="default"` rules:
  /// - Replace all newline (\n), tab (\t), and carriage return (\r) with space.
  /// - Collapse consecutive spaces to a single space.
  ///
  /// Note: Trimming of leading/trailing spaces is handled at the element level.
  String normalizeSvgWhitespace({required bool preserve}) {
    // 1. Convert all whitespace characters to space
    String result = replaceAll(RegExp(r'[\n\r\t]'), ' ');

    if (!preserve) {
      // 2. Collapse multiple spaces
      result = result.replaceAll(RegExp(r' +'), ' ');
    }

    return result;
  }
}
