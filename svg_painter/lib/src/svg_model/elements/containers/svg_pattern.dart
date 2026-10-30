part of '../../svg_element.dart';

/// Represents a `<pattern>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/pattern
@immutable
final class SvgPattern extends SvgContainerElement with SvgViewportAttributable, SvgBounded {
  const SvgPattern({
    required super.children,
    this.x,
    this.y,
    this.width,
    this.height,
    this.patternUnits = SvgPatternUnits.objectBoundingBox,
    this.patternContentUnits = SvgPatternUnits.userSpaceOnUse,
    this.patternTransformAttributes,
    this.href,
    this.viewportAttributes,
    super.title,
    super.desc,
    super.presentationAttributes,
    super.coreAttributes,
  });

  @override
  final SvgLengthPercentage? x;

  @override
  final SvgLengthPercentage? y;

  @override
  final SvgLengthPercentageAuto? width;

  @override
  final SvgLengthPercentageAuto? height;

  /// The coordinate system for attributes x, y, width and height.
  final SvgPatternUnits patternUnits;

  /// The coordinate system for the contents of the pattern.
  final SvgPatternUnits patternContentUnits;

  /// The optional pattern transform attributes.
  final SvgTransformAttributes? patternTransformAttributes;

  /// The optional reference to another pattern.
  final String? href;

  @override
  final SvgViewportAttributes? viewportAttributes;

  @override
  String toString() => 'SvgPattern(children: ${children.length}, id: $id)';
}
