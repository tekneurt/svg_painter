/// Enumeration of standard XML element tag names used in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element
enum XmlElementName {
  /// The `<a>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/a
  a('a'),

  /// The `<circle>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/circle
  circle('circle'),

  /// The `<clipPath>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/clipPath
  clipPath('clipPath'),

  /// The `<defs>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/defs
  defs('defs'),

  /// The `<desc>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/desc
  desc('desc'),

  /// The `<ellipse>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/ellipse
  ellipse('ellipse'),

  /// The `<feComponentTransfer>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/feComponentTransfer
  feComponentTransfer('feComponentTransfer'),

  /// The `<feDropShadow>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/feDropShadow
  feDropShadow('feDropShadow'),

  /// The `<feFlood>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/feFlood
  feFlood('feFlood'),

  /// The `<feFuncA>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/feFuncA
  feFuncA('feFuncA'),

  /// The `<feFuncB>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/feFuncB
  feFuncB('feFuncB'),

  /// The `<feFuncG>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/feFuncG
  feFuncG('feFuncG'),

  /// The `<feFuncR>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/feFuncR
  feFuncR('feFuncR'),

  /// The `<feGaussianBlur>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/feGaussianBlur
  feGaussianBlur('feGaussianBlur'),

  /// The `<feMerge>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/feMerge
  feMerge('feMerge'),

  /// The `<feMergeNode>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/feMergeNode
  feMergeNode('feMergeNode'),

  /// The `<feOffset>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/feOffset
  feOffset('feOffset'),

  /// The `<filter>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/filter
  filter('filter'),

  /// The `<g>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/g
  g('g'),

  /// The `<image>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/image
  image('image'),

  /// The `<line>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/line
  line('line'),

  /// The `<linearGradient>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/linearGradient
  linearGradient('linearGradient'),

  /// The `<marker>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/marker
  marker('marker'),

  /// The `<mask>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/mask
  mask('mask'),

  /// The `<path>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/path
  path('path'),

  /// The `<pattern>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/pattern
  pattern('pattern'),

  /// The `<polygon>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/polygon
  polygon('polygon'),

  /// The `<polyline>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/polyline
  polyline('polyline'),

  /// The `<radialGradient>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/radialGradient
  radialGradient('radialGradient'),

  /// The `<rect>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/rect
  rect('rect'),

  /// The `<stop>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/stop
  stop('stop'),

  /// The `<style>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/style
  style('style'),

  /// The root `<svg>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/svg
  svg('svg'),

  /// The `<symbol>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/symbol
  symbol('symbol'),

  /// The `<text>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/text
  text('text'),

  /// The `<textPath>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/textPath
  textPath('textPath'),

  /// The `<title>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/title
  title('title'),

  /// The `<tspan>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/tspan
  tspan('tspan'),

  /// The `<use>` element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/use
  use('use'),
  ;

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
