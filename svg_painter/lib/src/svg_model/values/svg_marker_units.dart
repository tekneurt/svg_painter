part of '../svg_value.dart';

/// Defines the coordinate system for marker attributes `markerWidth` and `markerHeight`.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/markerUnits
enum SvgMarkerUnits with SvgBaseValue {
  /// The coordinate system is relative to the stroke-width of the element referencing the marker.
  strokeWidth('strokeWidth'),

  /// The coordinate system is the same as the current user coordinate system.
  userSpaceOnUse('userSpaceOnUse')
  ;

  const SvgMarkerUnits(this.value);

  /// The string value as it appears in SVG XML.
  final String value;

  /// Parses a string into an [SvgMarkerUnits], or returns null if unknown.
  static SvgMarkerUnits? from(String? value) {
    if (value == null) {
      return null;
    }
    return SvgMarkerUnits.values.cast<SvgMarkerUnits?>().firstWhere(
      (unit) => unit?.value == value,
      orElse: () => null,
    );
  }
}
