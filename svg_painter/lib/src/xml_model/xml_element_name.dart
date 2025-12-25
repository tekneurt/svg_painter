/// Enumeration of standard XML element tag names used in SVG.
enum XmlElementName {
  /// The root <svg> element.
  svg('svg'),

  /// The <circle> element.
  circle('circle'),

  /// The <ellipse> element.
  ellipse('ellipse'),

  /// The <rect> element.
  rect('rect'),

  /// The <line> element.
  line('line'),

  /// The <path> element.
  path('path'),

  /// The <polyline> element.
  polyline('polyline'),

  /// The <polygon> element.
  polygon('polygon'),

  /// The <defs> element.
  defs('defs'),

  /// The <use> element.
  use('use'),

  /// The <radialGradient> element.
  radialGradient('radialGradient'),

  /// The <linearGradient> element.
  linearGradient('linearGradient'),

  /// The <stop> element.
  stop('stop');

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
