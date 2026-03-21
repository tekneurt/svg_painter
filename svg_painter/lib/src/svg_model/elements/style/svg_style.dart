part of '../../svg_element.dart';

/// Represents a `<style>` element in SVG.
///
/// This element is primarily used for parsing and its content is
/// collected into the [SvgStyleSheet] of the [SvgRoot].
@immutable
final class SvgStyle extends SvgElement {
  const SvgStyle({
    required this.content,
    this.type,
    this.media,
    this.title,
    super.coreAttributes,
  });

  /// The raw CSS content of the style element.
  final String content;

  /// The style sheet language (mapped from `type` attribute).
  final String? type;

  /// The media for which the style sheet is applicable (mapped from `media` attribute).
  final String? media;

  /// The title of the style sheet (mapped from `title` attribute).
  final String? title;

  @override
  String toString() {
    final List<String> parts = <String>[
      'content: ${content.length} chars',
      if (type != null) 'type: $type',
      if (media != null) 'media: $media',
      if (title != null) 'title: $title',
      if (id != null) 'id: $id',
    ];
    return 'SvgStyle(${parts.join(', ')})';
  }
}
