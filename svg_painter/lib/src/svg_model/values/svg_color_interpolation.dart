part of '../svg_value.dart';

/// Enumeration of possible values for the `color-interpolation` attribute.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color-interpolation
enum SvgColorInterpolation with SvgBaseValue {
  /// Indicates that the user agent can choose either the sRGB or linearRGB spaces.
  auto('auto'),

  /// Color interpolation in the sRGB color space.
  sRGB('sRGB'),

  /// Color interpolation in the linear RGB color space.
  linearRGB('linearRGB');

  const SvgColorInterpolation(this.value);

  /// The standard SVG string representation.
  final String value;

  /// Returns the [SvgColorInterpolation] for the given [value], or null if unknown.
  static SvgColorInterpolation? from(String value) {
    for (final SvgColorInterpolation interpolation in SvgColorInterpolation.values) {
      if (interpolation.value == value) {
        return interpolation;
      }
    }
    return null;
  }
}
