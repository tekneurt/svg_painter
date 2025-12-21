import 'package:meta/meta.dart';

import 'svg_value.dart';

part 'elements/svg_circle.dart';
part 'elements/svg_ellipse.dart';
part 'elements/svg_rect.dart';
part 'elements/svg_svg.dart';

/// The base class for all SVG elements in the domain model.
@immutable
sealed class SvgElement {
  const SvgElement();
}

/// Base class for SVG graphics elements (elements that can be rendered).
/// Corresponds to the 'SVGGraphicsElement' interface in the SVG DOM.
@immutable
sealed class SvgGraphicsElement extends SvgElement {
  const SvgGraphicsElement({this.fill, this.stroke, this.strokeWidth});

  /// The fill color of the element.
  final SvgColor? fill;

  /// The stroke color of the element.
  final SvgColor? stroke;

  /// The width of the stroke.
  final SvgLengthPercentage? strokeWidth;
}
