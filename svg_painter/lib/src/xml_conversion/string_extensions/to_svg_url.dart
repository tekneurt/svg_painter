/// Extension on [String] to facilitate parsing of `url(#id)` references.
extension ToSvgUrl on String {
  /// Extracts the ID from a `url(#id)` string.
  /// Returns null if the format doesn't match.
  String? extractUrlId() {
    final (String? urlId, _) = extractUrlReference() ?? (null, null);
    return urlId;
  }

  /// Extracts the ID and optional fallback string from a `url(#id) [fallback]` string.
  /// Returns null if the format doesn't match.
  (String, String?)? extractUrlReference() {
    final String trimmed = trim();
    final urlRegex = RegExp(r'''^url\(['"]?#([^'"]+)['"]?\)(?:\s+(.*))?$''');
    final Match? match = urlRegex.firstMatch(trimmed);
    if (match == null) {
      return null;
    }
    final String id = match.group(1)!;
    final String? fallback = match.group(2)?.trim();
    if (fallback == null || fallback.isEmpty) {
      return (id, null);
    }
    return (id, fallback);
  }
}
