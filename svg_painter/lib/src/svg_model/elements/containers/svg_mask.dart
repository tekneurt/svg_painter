part of '../../svg_element.dart';

/// Represents a `<mask>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/mask
@immutable
final class SvgMask extends SvgContainerElement with SvgBounded {
  const SvgMask({
    required super.children,
    super.title,
    super.desc,
    this.x,
    this.y,
    this.width,
    this.height,
    this.maskUnits = SvgMaskUnits.objectBoundingBox,
    this.maskContentUnits = SvgMaskUnits.userSpaceOnUse,
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

  /// Defines the coordinate system for the mask's geometry.
  final SvgMaskUnits maskUnits;

  /// Defines the coordinate system for the contents of the mask.
  final SvgMaskUnits maskContentUnits;

  @override
  String toString() => 'SvgMask(children: ${children.length}, id: $id)';
}
