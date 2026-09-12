part of '../svg_value.dart';

/// Defines the coordinate system for the contents of the [SvgClipPath].
enum SvgClipPathUnits {
  /// The coordinate system is the same as the user coordinate system.
  userSpaceOnUse('userSpaceOnUse'),

  /// The coordinate system is relative to the element the clip path is applied to.
  objectBoundingBox('objectBoundingBox');

  const SvgClipPathUnits(this.value);

  /// The string value as it appears in SVG XML.
  final String value;

  /// Parses a string into an [SvgClipPathUnits], or returns null if unknown.
  static SvgClipPathUnits? from(String? value) {
    if (value == null) {
      return null;
    }
    return SvgClipPathUnits.values.cast<SvgClipPathUnits?>().firstWhere(
      (unit) => unit?.value == value,
      orElse: () => null,
    );
  }
}
