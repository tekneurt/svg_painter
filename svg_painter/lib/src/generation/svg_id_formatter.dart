/// Utility to format SVG IDs into valid Dart identifiers.
class SvgIdFormatter {
  /// Reserved words in Dart that cannot be used as identifier names.
  static const Set<String> _reservedWords = <String>{
    'abstract',
    'as',
    'assert',
    'async',
    'await',
    'break',
    'case',
    'catch',
    'class',
    'const',
    'continue',
    'covariant',
    'default',
    'deferred',
    'do',
    'dynamic',
    'else',
    'enum',
    'export',
    'extends',
    'extension',
    'external',
    'factory',
    'false',
    'final',
    'finally',
    'for',
    'get',
    'hide',
    'if',
    'implements',
    'import',
    'in',
    'interface',
    'is',
    'late',
    'library',
    'mixin',
    'new',
    'null',
    'on',
    'operator',
    'part',
    'patch',
    'required',
    'rethrow',
    'return',
    'set',
    'show',
    'static',
    'super',
    'switch',
    'sync',
    'this',
    'throw',
    'true',
    'try',
    'typedef',
    'var',
    'void',
    'while',
    'with',
    'yield',
  };

  /// Formats an SVG [id] into a valid `lowerCamelCase` Dart identifier.
  static String format(String id) {
    if (id.isEmpty) {
      return 'unnamed';
    }

    // 1. Remove non-alphanumeric characters (except spaces/hyphens/underscores which help delimit words)
    final String clean = id.replaceAll(RegExp(r'[^a-zA-Z0-9\s_-]'), '');

    if (clean.isEmpty) {
      return 'identifier';
    }

    // 2. Split into words and convert to lowerCamelCase
    final List<String> words = clean
        .split(RegExp(r'[\s_-]+'))
        .where((String w) => w.isNotEmpty)
        .toList();

    if (words.isEmpty) {
      return 'identifier';
    }

    final buffer = StringBuffer();
    for (var i = 0; i < words.length; i++) {
      final String word = words[i];
      if (i == 0) {
        buffer.write(_lowercaseFirst(word));
      } else {
        buffer.write(_uppercaseFirst(word));
      }
    }

    var result = buffer.toString();

    // 3. Handle leading digits
    if (RegExp(r'^[0-9]').hasMatch(result)) {
      result = 'v$result';
    }

    // 4. Handle reserved words
    if (_reservedWords.contains(result)) {
      result = '${result}Property';
    }

    return result;
  }

  static String _lowercaseFirst(String s) {
    if (s.isEmpty) {
      return s;
    }
    return s[0].toLowerCase() + s.substring(1);
  }

  static String _uppercaseFirst(String s) {
    if (s.isEmpty) {
      return s;
    }
    return s[0].toUpperCase() + s.substring(1);
  }
}
