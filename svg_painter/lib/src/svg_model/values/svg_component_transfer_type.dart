part of '../svg_value.dart';

/// The component transfer type for `<feFuncR>`, `<feFuncG>`, `<feFuncB>`, `<feFuncA>`.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/feComponentTransfer
enum SvgComponentTransferType {
  /// Identity transfer function (C' = C).
  identity('identity'),

  /// Table lookup transfer function with linear interpolation.
  table('table'),

  /// Discrete table lookup transfer function with step function.
  discrete('discrete'),

  /// Linear transfer function (C' = slope * C + intercept).
  linear('linear'),

  /// Gamma transfer function (C' = amplitude * pow(C, exponent) + offset).
  gamma('gamma');

  const SvgComponentTransferType(this.value);

  /// The string value as it appears in SVG XML.
  final String value;

  /// Parses a string into an [SvgComponentTransferType], or returns null if unknown.
  static SvgComponentTransferType? from(String? value) {
    if (value == null) {
      return null;
    }
    return SvgComponentTransferType.values.cast<SvgComponentTransferType?>().firstWhere(
      (type) => type?.value == value,
      orElse: () => null,
    );
  }
}
