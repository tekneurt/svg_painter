import '../svg_model/_svg_model.dart';

/// Parser for `<style>` element content in SVG.
class SvgStyleParser {
  /// Parses CSS content into an [SvgStyleSheet].
  ///
  /// Currently only supports basic class selectors (e.g. .className { fill: red; }).
  static SvgStyleSheet parse(String css) {
    final Map<String, Map<String, String>> rules = <String, Map<String, String>>{};

    // Remove comments
    final String cleanCss = css.replaceAll(RegExp(r'/\*[\s\S]*?\*/'), '');

    // Regex to match selectors: .className, #idName, or tagName { properties }
    // Group 1: selector name
    // Group 2: properties block
    final RegExp ruleRegex = RegExp(r'([#\.a-zA-Z0-9_-]+)\s*\{([^}]*)\}');

    for (final Match match in ruleRegex.allMatches(cleanCss)) {
      String selector = match.group(1)!;
      final String propsBlock = match.group(2)!;

      // Note: We leave '.' and '#' prefixes on the keys in the rules map
      // so we can distinguish between tags, classes (.name), and IDs (#name).
      // Previously we stripped '.', but to support all three correctly without collision
      // (e.g. tag 'a' vs class '.a'), we should probably keep them.
      // However, to minimize refactoring impact right now, let's keep the existing behavior
      // for classes (strip dot) but keep '#' for IDs.
      // Or better: Let's follow a convention.
      // The current consumer (svg_paint_resolver) expects:
      // - Tag name keys (e.g. "rect")
      // - Class name keys WITHOUT dot (e.g. "myClass")

      if (selector.startsWith('.')) {
        selector = selector.substring(1);
      }
      // For ID selectors, we will keep the '#' prefix to distinguish them from tags/classes
      // (e.g. "#rect" vs "rect").

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
        rules[selector] = properties;
      }
    }

    return SvgStyleSheet(rules);
  }
}
