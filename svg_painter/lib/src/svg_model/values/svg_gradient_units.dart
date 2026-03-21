part of '../svg_value.dart';

/// Enumeration of possible values for the `gradientUnits` attribute.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/gradientUnits
enum SvgGradientUnits with SvgBaseValue {
  /// Coordinates are relative to the bounding box of the element (0.0 to 1.0).
  objectBoundingBox('objectBoundingBox'),

  /// Coordinates are in the user coordinate system.
  userSpaceOnUse('userSpaceOnUse');

  const SvgGradientUnits(this.value);

  /// The standard SVG string representation.
  final String value;

  /// Returns the [SvgGradientUnits] for the given [value], or null if unknown.
  static SvgGradientUnits? from(String value) {
    for (final SvgGradientUnits units in SvgGradientUnits.values) {
      if (units.value == value) {
        return units;
      }
    }
    return null;
  }
}
