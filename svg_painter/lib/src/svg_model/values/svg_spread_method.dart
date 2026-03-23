part of '../svg_value.dart';

/// Enumeration of possible values for the `spreadMethod` attribute.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/spreadMethod
enum SvgSpreadMethod with SvgBaseValue {
  /// The first and last colors of the gradient are extended to fill the remaining area.
  pad('pad'),

  /// The gradient is mirrored and repeated.
  reflect('reflect'),

  /// The gradient is repeated from the beginning.
  repeat('repeat');

  const SvgSpreadMethod(this.value);

  /// The standard SVG string representation.
  final String value;

  /// Returns the [SvgSpreadMethod] for the given [value], or null if unknown.
  static SvgSpreadMethod? from(String value) {
    for (final SvgSpreadMethod method in SvgSpreadMethod.values) {
      if (method.value == value) {
        return method;
      }
    }
    return null;
  }
}
