part of '../../svg_element.dart';

/// Represents a metadata element (`<title>`, `<desc>`).
@immutable
sealed class SvgMetadataElement extends SvgElement {
  const SvgMetadataElement({required this.content, super.id});

  /// The text content of the metadata element.
  final String content;
}
