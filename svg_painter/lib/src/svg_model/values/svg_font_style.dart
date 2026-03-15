part of '../svg_value.dart';

/// Enumeration of possible values for the 'font-style' attribute.
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-style
enum SvgFontStyle with SvgBaseValue {
  /// The default style.
  normal('normal'),

  /// Italicized text.
  italic('italic'),

  /// Oblique text.
  oblique('oblique');

  const SvgFontStyle(this.value);

  /// The standard string representation of the font style.
  final String value;

  @override
  String toString() => 'SvgFontStyle($value)';
}
