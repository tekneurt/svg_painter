part of '../svg_value.dart';

/// Defines the coordinate system for the [SvgFilter] element and its primitives.
enum SvgFilterUnits {
  /// The coordinate system is relative to the element the filter is applied to.
  objectBoundingBox('objectBoundingBox'),

  /// The coordinate system is the same as the user coordinate system.
  userSpaceOnUse('userSpaceOnUse');

  const SvgFilterUnits(this.value);

  /// The string value as it appears in SVG XML.
  final String value;

  /// Parses a string into an [SvgFilterUnits], or returns null if unknown.
  static SvgFilterUnits? from(String? value) {
    if (value == null) {
      return null;
    }
    return SvgFilterUnits.values.cast<SvgFilterUnits?>().firstWhere(
      (unit) => unit?.value == value,
      orElse: () => null,
    );
  }
}
