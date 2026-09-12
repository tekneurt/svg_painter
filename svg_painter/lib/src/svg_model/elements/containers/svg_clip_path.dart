part of '../../svg_element.dart';

/// Represents a `<clipPath>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/clipPath
@immutable
final class SvgClipPath extends SvgContainerElement {
  const SvgClipPath({
    required super.children,
    this.clipPathUnits = SvgClipPathUnits.userSpaceOnUse,
    super.presentationAttributes,
    super.coreAttributes,
  });

  /// Defines the coordinate system for the contents of the clip path.
  final SvgClipPathUnits clipPathUnits;

  @override
  String toString() => 'SvgClipPath(children: ${children.length}, id: $id)';
}
