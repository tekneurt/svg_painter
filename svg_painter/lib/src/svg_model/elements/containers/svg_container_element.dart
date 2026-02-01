part of '../../svg_element.dart';

/// Base class for container elements (`<svg>`, `<g>`).
@immutable
sealed class SvgContainerElement extends SvgGraphicsElement with SvgParent {
  const SvgContainerElement({
    required this.children,
    super.id,
    super.fill,
    super.fillOpacity,
    super.stroke,
    super.opacity,
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.fontFamily,
    super.cssClass,
    super.inlineStyle,
    super.transform,
  });

  @override
  final List<SvgElement> children;
}
