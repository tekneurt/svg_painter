part of '../../svg_element.dart';

/// Mixin for elements that can be part of a text content element's children.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Content_type#text_content_element
mixin class SvgTextContent {}

/// Represents raw character data within a text content element.
@immutable
final class SvgCharacterData implements SvgTextContent {
  const SvgCharacterData(this.text);

  /// The raw text content.
  final String text;

  @override
  String toString() => 'SvgCharacterData("$text")';
}
