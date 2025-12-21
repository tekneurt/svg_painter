/// Enumeration of standard XML attribute names used in SVG.
enum XmlAttributeName {
  /// The x-axis coordinate of the center of the element.
  cx('cx'),

  /// The y-axis coordinate of the center of the element.
  cy('cy'),

  /// The radius of the element.
  r('r');

  const XmlAttributeName(this.name);

  /// The standard string representation of the attribute name.
  final String name;
}
