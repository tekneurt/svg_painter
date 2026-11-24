part of '../../svg_element.dart';

/// Represents a `<feGaussianBlur>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/feGaussianBlur
@immutable
final class SvgFeGaussianBlur extends SvgFilterPrimitive {
  const SvgFeGaussianBlur({
    this.stdDeviationX = 0.0,
    this.stdDeviationY = 0.0,
    super.inSource,
    super.result,
    super.coreAttributes,
  });

  /// The standard deviation along the x-axis for the blur operation.
  final double stdDeviationX;

  /// The standard deviation along the y-axis for the blur operation.
  final double stdDeviationY;

  @override
  String toString() =>
      'SvgFeGaussianBlur(stdDeviation: ($stdDeviationX, $stdDeviationY), in: $inSource, result: $result)';
}
