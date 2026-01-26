import 'package:meta/meta.dart';

/// Represents a set of CSS rules parsed from a `<style>` element.
@immutable
final class SvgStyleSheet {
  const SvgStyleSheet(this.rules);

  /// Creates an empty style sheet.
  const SvgStyleSheet.empty() : rules = const <String, Map<String, String>>{};

  /// Map of class names to their associated style properties.
  /// Key: class name (without the dot).
  /// Value: Map of attribute names to their SvgBaseValue representations.
  final Map<String, Map<String, String>> rules;

  @override
  String toString() => 'SvgStyleSheet($rules)';
}
