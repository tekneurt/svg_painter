part of '../../svg_element.dart';

/// Base class for container elements (`<svg>`, `<g>`).
@immutable
sealed class SvgContainerElement extends SvgGraphicsElement with SvgParent, SvgFontStylable {
  const SvgContainerElement({
    required this.children,
    super.id,
    super.fill,
    super.stroke,
    this.font,
    super.opacity,
    super.cssClass,
    super.inlineStyle,
    super.transform,
  });

  @override
  final List<SvgElement> children;

  @override
  final SvgFontAttributes? font;
}
