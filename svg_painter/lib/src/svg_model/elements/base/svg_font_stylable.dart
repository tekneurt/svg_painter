part of '../../svg_element.dart';

/// Mixin for elements that support font-related presentation attributes.
mixin SvgFontStylable on SvgElement {
  /// The grouped font attributes of the element.
  SvgFontAttributes? get font;
}
