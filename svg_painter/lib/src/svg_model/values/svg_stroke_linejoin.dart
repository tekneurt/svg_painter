part of '../svg_value.dart';

/// Enumeration of possible values for the 'stroke-linejoin' attribute.
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-linejoin
enum SvgStrokeLinejoin with SvgBaseValue {
  /// A sharp corner is created.
  miter('miter'),

  /// A rounded corner is created.
  round('round'),

  /// A beveled corner is created.
  bevel('bevel'),

  /// A sharp corner is created, but if the miter limit is exceeded, the miter is clipped.
  /// SVG 2 value. Falls back to miter in current implementation.
  miterClip('miter-clip'),

  /// A corner is created by extending the outer edges with arcs.
  /// SVG 2 value. Falls back to miter in current implementation.
  arcs('arcs');

  const SvgStrokeLinejoin(this.value);

  /// The standard string representation of the linejoin value.
  final String value;

  /// Parses a string into an [SvgStrokeLinejoin], or returns null if unknown.
  static SvgStrokeLinejoin? from(String value) {
    for (final SvgStrokeLinejoin join in SvgStrokeLinejoin.values) {
      if (join.value == value) {
        return join;
      }
    }
    return null;
  }
}
