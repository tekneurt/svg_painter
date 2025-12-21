/// Enumeration of standard XML attribute names used in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute
enum XmlAttributeName {
  /// The x-axis coordinate of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/x
  x('x'),

  /// The y-axis coordinate of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/y
  y('y'),

  /// The x-axis coordinate of the center of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/cx
  cx('cx'),

  /// The y-axis coordinate of the center of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/cy
  cy('cy'),

  /// The radius of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/r
  r('r'),

  /// The x-axis radius of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/rx
  rx('rx'),

  /// The y-axis radius of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/ry
  ry('ry'),

  /// The width of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/width
  width('width'),

  /// The height of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/height
  height('height'),

  /// The viewBox of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/viewBox
  viewBox('viewBox'),

  /// The fill color of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill
  fill('fill'),

  /// The stroke color of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke
  stroke('stroke'),

  /// The width of the stroke.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-width
  strokeWidth('stroke-width');

  const XmlAttributeName(this.name);

  /// The standard string representation of the attribute name.
  final String name;
}
