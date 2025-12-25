part of '../svg_value.dart';

/// Enumeration of possible values for the 'stroke-linecap' attribute.
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-linecap
enum SvgStrokeLinecap with SvgBaseValue {
  /// The stroke is terminated at the end of the path.
  butt('butt'),

  /// The stroke is terminated with a rounded end.
  round('round'),

  /// The stroke is terminated with a square end.
  square('square');

  const SvgStrokeLinecap(this.value);

  /// The standard string representation of the linecap value.
  final String value;

  /// Parses a string into an [SvgStrokeLinecap], or returns null if unknown.
  static SvgStrokeLinecap? from(String value) {
    for (final SvgStrokeLinecap cap in SvgStrokeLinecap.values) {
      if (cap.value == value) {
        return cap;
      }
    }
    return null;
  }
}
