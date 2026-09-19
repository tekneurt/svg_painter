part of '../../svg_element.dart';

/// Represents the root `<svg>` element of an SVG document.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/svg
@immutable
final class SvgRoot extends SvgSvg {
  const SvgRoot({
    required super.children,
    super.title,
    super.desc,
    super.x,
    super.y,
    super.width,
    super.height,
    super.viewportAttributes,
    super.presentationAttributes,
    super.coreAttributes,
    this.styleSheet = const SvgStyleSheet.empty(),
  });

  /// The internal style sheet for this SVG document.
  final SvgStyleSheet styleSheet;

  @override
  String toString() => 'SvgRoot(children: ${children.length}, id: $id)';
}
