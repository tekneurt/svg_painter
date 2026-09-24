part of '../../svg_element.dart';

/// Represents a `<textPath>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/textPath
@immutable
final class SvgTextPath extends SvgGraphicsElement with SvgFontAttributable, SvgTextContent {
  const SvgTextPath({
    required this.href,
    required this.children,
    this.startOffset,
    this.pathData,
    super.title,
    super.desc,
    super.presentationAttributes,
    super.coreAttributes,
  });

  /// The reference URL/ID of the path on which to render the text.
  final String href;

  /// The path data on which to render the text (SVG 2 inline path).
  final String? pathData;

  /// How far the beginning of the text should be offset from the beginning of the path.
  final SvgLengthPercentage? startOffset;

  /// The child elements or character data contained within this textPath.
  final List<SvgTextContent> children;

  @override
  SvgFontAttributes? get fontAttributes => presentationAttributes?.font;

  @override
  String toString() => 'SvgTextPath(href: $href, startOffset: $startOffset, children: ${children.length}, id: $id)';
}
