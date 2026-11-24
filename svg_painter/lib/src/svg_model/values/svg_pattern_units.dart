part of '../svg_value.dart';

/// Defines the coordinate system for the [SvgPattern] tile dimensions and contents.
enum SvgPatternUnits {
  /// The coordinate system is relative to the element the pattern is applied to.
  objectBoundingBox('objectBoundingBox'),

  /// The coordinate system is the same as the user coordinate system.
  userSpaceOnUse('userSpaceOnUse');

  const SvgPatternUnits(this.value);

  /// The string value as it appears in SVG XML.
  final String value;

  /// Parses a string into an [SvgPatternUnits], or returns null if unknown.
  static SvgPatternUnits? from(String? value) {
    if (value == null) {
      return null;
    }
    return SvgPatternUnits.values.cast<SvgPatternUnits?>().firstWhere(
      (unit) => unit?.value == value,
      orElse: () => null,
    );
  }
}
