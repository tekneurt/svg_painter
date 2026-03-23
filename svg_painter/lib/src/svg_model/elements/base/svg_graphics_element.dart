part of '../../svg_element.dart';

/// Base class for SVG graphics elements (elements that can be rendered).
@immutable
sealed class SvgGraphicsElement extends SvgElement
    with SvgFillAttributable, SvgStrokeAttributable, SvgGraphicsAttributable, SvgPresentable {
  const SvgGraphicsElement({
    this.presentationAttributes,
    super.coreAttributes,
  });

  @override
  final SvgPresentationAttributes? presentationAttributes;

  @override
  SvgFillAttributes? get fillAttributes => presentationAttributes?.fill;

  @override
  SvgStrokeAttributes? get strokeAttributes => presentationAttributes?.stroke;

  @override
  SvgGraphicsAttributes? get graphicsAttributes => presentationAttributes?.graphics;

  /// The transparency of the element.
  SvgLengthPercentage? get opacity => graphicsAttributes?.opacity;

  /// The transform applied to the element.
  SvgTransformAttributes? get transformAttributes => graphicsAttributes?.transformAttributes;
}
