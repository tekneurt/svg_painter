part of '../../svg_element.dart';

/// Represents a `<title>` element.
@immutable
final class SvgTitle extends SvgMetadataElement {
  const SvgTitle({required super.content, super.coreAttributes});

  @override
  String toString() => 'SvgTitle(content: $content, id: $id)';
}
