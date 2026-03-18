part of '../../svg_element.dart';

/// Mixin for elements that define a rectangular boundary or viewport via x, y, width, and height.
///
/// Applied to elements like `<svg>`, `<rect>`, `<use>`, `<image>`, `<mask>`, and `<pattern>`.
mixin SvgBounded on SvgElement {
  /// The x-axis coordinate.
  SvgLengthPercentageAuto? get x;

  /// The y-axis coordinate.
  SvgLengthPercentageAuto? get y;

  /// The width of the element.
  SvgLengthPercentageAuto? get width;

  /// The height of the element.
  SvgLengthPercentageAuto? get height;
}
