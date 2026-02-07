part of '../../svg_element.dart';

/// Base class for SVG graphics elements (elements that can be rendered).
@immutable
sealed class SvgGraphicsElement extends SvgElement with SvgFillAttributable, SvgStrokeAttributable {
  const SvgGraphicsElement({
    super.id,
    this.fillAttributes,
    this.strokeAttributes,
    this.opacity,
    this.cssClass,
    this.inlineStyle,
    this.transformAttributes,
  });

  @override
  final SvgFillAttributes? fillAttributes;

  @override
  final SvgStrokeAttributes? strokeAttributes;

  /// The transparency of the element.
  final SvgLengthPercentage? opacity;

  /// The CSS class(es) of the element.
  final String? cssClass;

  /// Inline CSS style rules for the element.
  final String? inlineStyle;

  /// The transform applied to the element.
  final SvgTransformAttributes? transformAttributes;
}
