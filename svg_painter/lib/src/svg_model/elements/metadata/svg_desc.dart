part of '../../svg_element.dart';

/// Represents a `<desc>` element.
@immutable
final class SvgDesc extends SvgMetadataElement {
  const SvgDesc({required super.content, super.id});

  @override
  String toString() => 'SvgDesc(content: $content, id: $id)';
}
