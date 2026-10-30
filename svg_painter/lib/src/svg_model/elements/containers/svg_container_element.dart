part of '../../svg_element.dart';

/// Base class for container elements (`<svg>`, `<g>`).
@immutable
sealed class SvgContainerElement extends SvgGraphicsElement with SvgParent, SvgFontAttributable {
  const SvgContainerElement({
    required this.children,
    super.title,
    super.desc,
    super.presentationAttributes,
    super.coreAttributes,
  });

  @override
  final List<SvgElement> children;

  @override
  SvgFontAttributes? get fontAttributes => presentationAttributes?.font;
}
