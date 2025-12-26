import '../svg_model/_svg_model.dart';

/// Parser for <style> element content in SVG.
class SvgStyleParser {
  /// Parses CSS content into an [SvgStyleSheet].
  ///
  /// Currently only supports basic class selectors (e.g. .className { fill: red; }).
  static SvgStyleSheet parse(String css) {
    final Map<String, Map<String, String>> rules = <String, Map<String, String>>{};

    // Remove comments
    final String cleanCss = css.replaceAll(RegExp(r'/\*[\s\S]*?\*/'), '');

    // Regex to match class rules: .className { properties }
    // Group 1: class name (without dot)
    // Group 2: properties block
    final RegExp ruleRegex = RegExp(r'\.([a-zA-Z0-9_-]+)\s*\{([^}]*)\}');

    for (final Match match in ruleRegex.allMatches(cleanCss)) {
      final String className = match.group(1)!;
      final String propsBlock = match.group(2)!;

      final Map<String, String> properties = <String, String>{};
      final List<String> declarations = propsBlock.split(';');

      for (final String decl in declarations) {
        final String trimmedDecl = decl.trim();
        if (trimmedDecl.isEmpty) {
          continue;
        }
        final List<String> parts = trimmedDecl.split(':');
        if (parts.length == 2) {
          final String key = parts[0].trim();
          final String value = parts[1].trim();
          properties[key] = value;
        }
      }

      if (properties.isNotEmpty) {
        rules[className] = properties;
      }
    }

    return SvgStyleSheet(rules);
  }
}
