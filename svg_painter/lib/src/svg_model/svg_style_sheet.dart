import 'package:meta/meta.dart';

import 'values/svg_media_query.dart';

/// Represents a conditional set of CSS rules tied to an [SvgMediaQuery].
@immutable
final class SvgMediaRule {
  const SvgMediaRule({
    required this.query,
    required this.rules,
  });

  /// The media query condition.
  final SvgMediaQuery query;

  /// The CSS rules applied when the query matches.
  final Map<String, Map<String, String>> rules;

  @override
  String toString() => 'SvgMediaRule($query: $rules)';
}

/// Represents a set of CSS rules parsed from `<style>` elements.
@immutable
final class SvgStyleSheet {
  const SvgStyleSheet(
    this.rules, [
    this.mediaRules = const <SvgMediaRule>[],
  ]);

  /// Creates an empty style sheet.
  const SvgStyleSheet.empty()
      : rules = const <String, Map<String, String>>{},
        mediaRules = const <SvgMediaRule>[];

  /// Map of class names to their associated style properties.
  /// Key: class name (without the dot).
  /// Value: Map of attribute names to their SvgBaseValue representations.
  final Map<String, Map<String, String>> rules;

  /// Conditional style rules wrapped in media queries.
  final List<SvgMediaRule> mediaRules;

  @override
  String toString() {
    if (mediaRules.isEmpty) {
      return 'SvgStyleSheet($rules)';
    } else {
      return 'SvgStyleSheet(rules: $rules, mediaRules: $mediaRules)';
    }
  }
}
