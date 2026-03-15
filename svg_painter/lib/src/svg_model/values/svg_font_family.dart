part of '../svg_value.dart';

/// Represents the family of a font in SVG.
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-family
@immutable
final class SvgFontFamily with SvgBaseValue {
  const SvgFontFamily(this.value);

  /// The font family name or comma-separated list of names.
  final String value;

  @override
  String toString() => 'SvgFontFamily($value)';
}
