part of '../../svg_element.dart';

/// Base class for SVG graphics elements (elements that can be rendered).
@immutable
sealed class SvgGraphicsElement extends SvgElement {
  const SvgGraphicsElement({
    super.id,
    this.fill,
    this.fillOpacity,
    this.stroke,
    this.opacity,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.cssClass,
    this.inlineStyle,
    this.transform,
  });

  /// The fill color of the element.
  final SvgColor? fill;

  /// The opacity of the fill.
  final SvgLengthPercentage? fillOpacity;

  /// The grouped stroke attributes of the element.
  final SvgStrokeAttributes? stroke;

  /// The transparency of the element.
  final SvgLengthPercentage? opacity;

  /// The size of the font.
  final SvgLengthPercentage? fontSize;

  /// The weight of the font.
  final String? fontWeight;

  /// The style of the font.
  final String? fontStyle;

  /// The family of the font.
  final String? fontFamily;

  /// The CSS class(es) of the element.
  final String? cssClass;

  /// Inline CSS style rules for the element.
  final String? inlineStyle;

  /// The transform applied to the element.
  final String? transform;
}
