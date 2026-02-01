part of '../../svg_element.dart';

/// Mixin for elements that support fill-related presentation attributes.
mixin SvgFillAttributable on SvgElement {
  /// The grouped fill attributes of the element.
  SvgFillAttributes? get fillAttributes;
}
