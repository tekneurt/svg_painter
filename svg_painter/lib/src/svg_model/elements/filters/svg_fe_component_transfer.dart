part of '../../svg_element.dart';

/// Represents an `<feComponentTransfer>` filter primitive in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/feComponentTransfer
@immutable
final class SvgFeComponentTransfer extends SvgFilterPrimitive {
  const SvgFeComponentTransfer({
    this.funcR,
    this.funcG,
    this.funcB,
    this.funcA,
    super.inSource,
    super.result,
    super.coreAttributes,
  });

  /// The `<feFuncR>` component transfer function.
  final SvgFeFuncR? funcR;

  /// The `<feFuncG>` component transfer function.
  final SvgFeFuncG? funcG;

  /// The `<feFuncB>` component transfer function.
  final SvgFeFuncB? funcB;

  /// The `<feFuncA>` component transfer function.
  final SvgFeFuncA? funcA;

  @override
  String toString() =>
      'SvgFeComponentTransfer(R: $funcR, G: $funcG, B: $funcB, A: $funcA, result: $result)';
}
