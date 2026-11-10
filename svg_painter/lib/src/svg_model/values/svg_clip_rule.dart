part of '../svg_value.dart';

/// The algorithm used to determine what parts of the canvas are inside a clipping path.
enum SvgClipRule with SvgBaseValue {
  /// The nonzero winding rule.
  nonzero('nonzero'),

  /// The evenodd winding rule.
  evenodd('evenodd');

  const SvgClipRule(this.value);

  /// The string value as it appears in SVG XML.
  final String value;

  /// Parses a string into an [SvgClipRule], or returns null if unknown.
  static SvgClipRule? from(String? value) {
    if (value == null) {
      return null;
    }
    return SvgClipRule.values.cast<SvgClipRule?>().firstWhere(
      (rule) => rule?.value == value,
      orElse: () => null,
    );
  }
}
