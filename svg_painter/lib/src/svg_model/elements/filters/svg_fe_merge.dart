part of '../../svg_element.dart';

/// Represents an `<feMerge>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/feMerge
@immutable
final class SvgFeMerge extends SvgFilterPrimitive {
  const SvgFeMerge({
    required this.nodes,
    super.inSource,
    super.result,
    super.coreAttributes,
  });

  /// The list of `<feMergeNode>` children.
  final List<SvgFeMergeNode> nodes;

  @override
  String toString() => 'SvgFeMerge(nodes: ${nodes.length}, result: $result)';
}
