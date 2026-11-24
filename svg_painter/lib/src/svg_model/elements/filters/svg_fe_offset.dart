part of '../../svg_element.dart';

/// Represents an `<feOffset>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/feOffset
@immutable
final class SvgFeOffset extends SvgFilterPrimitive {
  const SvgFeOffset({
    this.dx = 0.0,
    this.dy = 0.0,
    super.inSource,
    super.result,
    super.coreAttributes,
  });

  /// The horizontal offset distance.
  final double dx;

  /// The vertical offset distance.
  final double dy;

  @override
  String toString() =>
      'SvgFeOffset(dx: $dx, dy: $dy, in: $inSource, result: $result)';
}
