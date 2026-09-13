part of '../svg_value.dart';

/// Represents the possible values for the SVG `vector-effect` attribute.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/vector-effect
enum SvgVectorEffect implements SvgBaseValue {
  /// Default. No vector effect is applied.
  none('none'),

  /// The stroke width does not scale when the coordinate system is transformed.
  nonScalingStroke('non-scaling-stroke');

  const SvgVectorEffect(this.value);

  /// The string representation of the vector effect in SVG.
  final String value;

  /// Returns the [SvgVectorEffect] matching [value], or `null` if not recognized.
  static SvgVectorEffect? from(String? value) {
    if (value == null) {
      return null;
    }
    for (final SvgVectorEffect effect in values) {
      if (effect.value == value) {
        return effect;
      }
    }
    return null;
  }

  @override
  String toString() => 'SvgVectorEffect.$name';
}
