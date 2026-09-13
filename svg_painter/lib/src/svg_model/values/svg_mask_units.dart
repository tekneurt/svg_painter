part of '../svg_value.dart';

/// Defines the coordinate system for the [SvgMask] and its contents.
enum SvgMaskUnits {
  /// The coordinate system is relative to the element the mask is applied to.
  objectBoundingBox('objectBoundingBox'),

  /// The coordinate system is the same as the user coordinate system.
  userSpaceOnUse('userSpaceOnUse');

  const SvgMaskUnits(this.value);

  /// The string value as it appears in SVG XML.
  final String value;

  /// Parses a string into an [SvgMaskUnits], or returns null if unknown.
  static SvgMaskUnits? from(String? value) {
    if (value == null) {
      return null;
    }
    return SvgMaskUnits.values.cast<SvgMaskUnits?>().firstWhere(
      (unit) => unit?.value == value,
      orElse: () => null,
    );
  }
}
