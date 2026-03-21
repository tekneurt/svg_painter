/// Enumeration of standard XML element tag names used in SVG.
enum XmlElementName {
  /// The root `<svg>` element.
  svg('svg'),

  /// The `<circle>` element.
  circle('circle'),

  /// The `<ellipse>` element.
  ellipse('ellipse'),

  /// The `<rect>` element.
  rect('rect'),

  /// The `<line>` element.
  line('line'),

  /// The `<path>` element.
  path('path'),

  /// The `<polyline>` element.
  polyline('polyline'),

  /// The `<polygon>` element.
  polygon('polygon'),

  /// The `<defs>` element.
  defs('defs'),

  /// The `<g>` element.
  g('g'),

  /// The `<symbol>` element.
  symbol('symbol'),

  /// The `<use>` element.
  use('use'),
  radialGradient('radialGradient'),
  linearGradient('linearGradient'),
  stop('stop'),
  style('style'),
  text('text'),
  title('title'),
  desc('desc');

  const XmlElementName(this.tagName);

  /// The standard string representation of the element tag name.
  final String tagName;

  /// parses a string into an [XmlElementName], or returns null if unknown.
  static XmlElementName? from(String tagName) {
    for (final XmlElementName element in XmlElementName.values) {
      if (element.tagName == tagName) {
        return element;
      }
    }
    return null;
  }
}
