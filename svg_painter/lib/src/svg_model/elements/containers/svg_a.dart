part of '../../svg_element.dart';

/// Represents an SVG `<a>` element.
@immutable
final class SvgA extends SvgContainerElement {
  const SvgA({
    required super.children,
    super.title,
    super.desc,
    super.presentationAttributes,
    super.coreAttributes,
    this.href,
  });

  /// The target resource URL.
  final String? href;

  @override
  String toString() => 'SvgA(href: $href, children: ${children.length}, id: $id)';
}
