part of '../svg_value.dart';

/// The rule used to determine the interior of a shape.
enum SvgFillRule with SvgBaseValue {
  /// The nonzero winding rule.
  nonzero('nonzero'),

  /// The evenodd winding rule.
  evenodd('evenodd');

  const SvgFillRule(this.value);

  /// The string value as it appears in SVG XML.
  final String value;

  /// Parses a string into an [SvgFillRule], or returns null if unknown.
  static SvgFillRule? from(String? value) {
    if (value == null) {
      return null;
    }
    return SvgFillRule.values.cast<SvgFillRule?>().firstWhere(
      (rule) => rule?.value == value,
      orElse: () => null,
    );
  }
}
