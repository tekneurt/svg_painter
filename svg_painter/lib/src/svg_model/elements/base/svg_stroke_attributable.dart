part of '../../svg_element.dart';

/// Mixin for elements that support stroke-related presentation attributes.
mixin SvgStrokeAttributable on SvgElement {
  /// The grouped stroke attributes of the element.
  SvgStrokeAttributes? get strokeAttributes;
}
