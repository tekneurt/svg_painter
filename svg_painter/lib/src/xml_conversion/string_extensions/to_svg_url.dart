/// Extension on [String] to parse 'url(#id)'.
extension StringToUrl on String {
  /// Extracts the ID from a 'url(#id)' string.
  /// Returns null if the format doesn't match.
  String? extractUrlId() {
    final String trimmed = trim();
    final RegExp urlRegex = RegExp(r'''^url\(['"]?#([^'"]+)['"]?\)$''');
    final Match? match = urlRegex.firstMatch(trimmed);
    return match?.group(1);
  }
}
