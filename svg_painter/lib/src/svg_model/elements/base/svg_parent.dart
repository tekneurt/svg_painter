part of '../../svg_element.dart';

/// Mixin for SVG elements that contain child elements.
mixin SvgParent {
  /// The child elements contained within this element.
  List<SvgElement> get children;
}
