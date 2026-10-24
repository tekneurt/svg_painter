part of '../../svg_element.dart';

/// Represents an `<feMergeNode>` element inside an `<feMerge>`.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/feMergeNode
@immutable
final class SvgFeMergeNode extends SvgElement {
  const SvgFeMergeNode({
    this.inSource,
    super.coreAttributes,
  });

  /// The input for this merge node.
  final String? inSource;

  @override
  String toString() => 'SvgFeMergeNode(in: $inSource)';
}
