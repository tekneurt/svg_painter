part of '../../svg_element.dart';

/// Mixin for elements that support the `viewBox` and `preserveAspectRatio` attributes.
///
/// Elements like `<svg>`, `<symbol>`, `<marker>`, `<pattern>`, and `<view>`
/// establish a new viewport and require these attributes to map their coordinate
/// systems.
mixin SvgViewBoxed on SvgElement {
  /// The viewBox attribute defining the coordinate system for the element's children.
  SvgViewBox? get viewBox;

  /// The preserveAspectRatio attribute defining how the viewBox is mapped to the viewport.
  SvgPreserveAspectRatio? get preserveAspectRatio;
}
