part of '../../svg_element.dart';

/// Base class for container elements (`<svg>`, `<g>`).
@immutable
sealed class SvgContainerElement extends SvgGraphicsElement with SvgParent, SvgFontAttributable {
  const SvgContainerElement({
    required this.children,
    super.id,
    super.fillAttributes,
    super.strokeAttributes,
    this.fontAttributes,
    super.opacity,
    super.cssClass,
    super.inlineStyle,
    super.transformAttributes,
  });

  @override
  final List<SvgElement> children;

  @override
  final SvgFontAttributes? fontAttributes;
}
