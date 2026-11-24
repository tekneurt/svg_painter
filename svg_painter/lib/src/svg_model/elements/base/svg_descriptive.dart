part of '../../svg_element.dart';

/// Mixin for elements that can contain `<title>` and `<desc>` metadata elements.
mixin SvgDescriptive on SvgElement {
  /// The title of the element, if specified.
  SvgTitle? get title;

  /// The description of the element, if specified.
  SvgDesc? get desc;
}
