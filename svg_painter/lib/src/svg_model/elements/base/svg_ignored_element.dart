part of '../../svg_element.dart';

/// Represents an element that should be ignored during rendering.
///
/// Used for foreign namespaces or SVG elements that have no visual representation
/// and aren't explicitly handled as metadata.
@immutable
final class SvgIgnoredElement extends SvgElement {
  const SvgIgnoredElement({super.id});

  @override
  String toString() => 'SvgIgnoredElement(id: $id)';
}
