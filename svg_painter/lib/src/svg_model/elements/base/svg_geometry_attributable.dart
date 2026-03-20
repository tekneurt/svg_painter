part of '../../svg_element.dart';

/// Mixin for elements that define a geometry path (and thus support pathLength).
mixin SvgGeometryAttributable on SvgGraphicsElement {
  /// The grouped geometry attributes of the element.
  SvgGeometryAttributes? get geometryAttributes;

  /// The total length of the path in user units.
  SvgNumber? get pathLength => geometryAttributes?.pathLength;
}
