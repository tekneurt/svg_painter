part of '../../svg_element.dart';

/// Mixin for elements that define a geometry path (and thus support pathLength).
mixin SvgGeometry on SvgGraphicsElement {
  /// The total length of the path in user units (non-negative).
  /// If null, the natural length of the path is used.
  SvgNumber? get pathLength;
}
