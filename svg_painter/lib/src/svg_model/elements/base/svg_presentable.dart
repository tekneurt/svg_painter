part of '../../svg_element.dart';

/// Mixin for elements that support presentation attributes.
mixin SvgPresentable on SvgElement {
  /// The unified set of presentation attributes for the element.
  SvgPresentationAttributes? get presentationAttributes;
}
