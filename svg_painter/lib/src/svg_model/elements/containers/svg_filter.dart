part of '../../svg_element.dart';

/// Represents a `<filter>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/filter
@immutable
final class SvgFilter extends SvgContainerElement with SvgBounded {
  const SvgFilter({
    required super.children,
    super.title,
    super.desc,
    this.x,
    this.y,
    this.width,
    this.height,
    this.filterUnits = SvgFilterUnits.objectBoundingBox,
    this.primitiveUnits = SvgFilterUnits.userSpaceOnUse,
    super.presentationAttributes,
    super.coreAttributes,
  });

  @override
  final SvgLengthPercentageAuto? x;

  @override
  final SvgLengthPercentageAuto? y;

  @override
  final SvgLengthPercentageAuto? width;

  @override
  final SvgLengthPercentageAuto? height;

  /// Defines the coordinate system for the filter region.
  final SvgFilterUnits filterUnits;

  /// Defines the coordinate system for the filter primitives.
  final SvgFilterUnits primitiveUnits;

  /// Filter primitives extracted from [children].
  List<SvgFilterPrimitive> get primitives =>
      children.whereType<SvgFilterPrimitive>().toList();

  @override
  String toString() => 'SvgFilter(primitives: ${primitives.length}, id: $id)';
}
