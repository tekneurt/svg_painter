part of '../../svg_element.dart';

/// Base class for SVG graphics elements (elements that can be rendered).
@immutable
sealed class SvgGraphicsElement extends SvgElement {
  const SvgGraphicsElement({
    super.id,
    this.fill,
    this.stroke,
    this.opacity,
    this.cssClass,
    this.inlineStyle,
    this.transform,
  });

  /// The fill attributes of the element.
  final SvgFillAttributes? fill;

  /// The stroke attributes of the element.
  final SvgStrokeAttributes? stroke;

  /// The transparency of the element.
  final SvgLengthPercentage? opacity;

  /// The CSS class(es) of the element.
  final String? cssClass;

  /// Inline CSS style rules for the element.
  final String? inlineStyle;

  /// The transform applied to the element.
  final String? transform;
}
