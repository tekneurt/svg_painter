part of '../svg_value.dart';

/// Enumeration of possible values for the 'decoding' attribute on <image>.
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/decoding
enum SvgImageDecoding with SvgBaseValue {
  /// The browser chooses what's best for the user. We map this to async.
  auto('auto'),

  /// Decode the image synchronously.
  sync('sync'),

  /// Decode the image asynchronously.
  async('async');

  const SvgImageDecoding(this.value);

  /// The standard string representation of the decoding mode.
  final String value;

  @override
  String toString() => 'SvgImageDecoding($value)';
}
