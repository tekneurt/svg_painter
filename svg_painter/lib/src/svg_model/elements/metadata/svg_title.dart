part of '../../svg_element.dart';

/// Represents a `<title>` element.
@immutable
final class SvgTitle extends SvgMetadataElement {
  const SvgTitle({required super.content, super.id});

  @override
  String toString() => 'SvgTitle(content: $content, id: $id)';
}
