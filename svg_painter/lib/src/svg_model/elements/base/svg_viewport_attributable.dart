part of '../../svg_element.dart';

/// Mixin for elements that support the `viewBox` and `preserveAspectRatio` attributes.
mixin SvgViewportAttributable on SvgElement {
  /// The grouped viewport attributes of the element.
  SvgViewportAttributes? get viewportAttributes;

  /// The viewBox attribute defining the coordinate system for the element's children.
  SvgViewBox? get viewBox => viewportAttributes?.viewBox;

  /// The preserveAspectRatio attribute defining how the viewBox is mapped to the viewport.
  SvgPreserveAspectRatio? get preserveAspectRatio => viewportAttributes?.preserveAspectRatio;
}
