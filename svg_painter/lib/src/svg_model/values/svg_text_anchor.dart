part of '../svg_value.dart';

/// The horizontal alignment of text relative to a given point.
enum SvgTextAnchor with SvgBaseValue {
  /// The start of the text is aligned to the anchor point.
  start('start'),

  /// The middle of the text is aligned to the anchor point.
  middle('middle'),

  /// The end of the text is aligned to the anchor point.
  end('end');

  const SvgTextAnchor(this.value);

  /// The string value as it appears in SVG XML.
  final String value;

  /// Parses a string into an [SvgTextAnchor], or returns null if unknown.
  static SvgTextAnchor? from(String? value) {
    if (value == null) {
      return null;
    }
    return SvgTextAnchor.values.cast<SvgTextAnchor?>().firstWhere(
      (anchor) => anchor?.value == value,
      orElse: () => null,
    );
  }
}
