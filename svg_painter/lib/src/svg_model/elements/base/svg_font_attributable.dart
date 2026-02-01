part of '../../svg_element.dart';

/// Mixin for elements that support font-related presentation attributes.
mixin SvgFontAttributable on SvgElement {
  /// The grouped font attributes of the element.
  SvgFontAttributes? get fontAttributes;
}
