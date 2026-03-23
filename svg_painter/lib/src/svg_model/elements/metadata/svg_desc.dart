part of '../../svg_element.dart';

/// Represents a `<desc>` element.
@immutable
final class SvgDesc extends SvgMetadataElement {
  const SvgDesc({required super.content, super.coreAttributes});

  @override
  String toString() => 'SvgDesc(content: $content, id: $id)';
}
