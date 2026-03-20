part of '../../svg_element.dart';

/// Mixin for elements that support presentation attributes specific to graphics elements.
mixin SvgGraphicsAttributable on SvgElement {
  /// The grouped graphics attributes of the element.
  SvgGraphicsAttributes? get graphicsAttributes;
}
