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

  /// The x-axis start coordinate for linear gradients.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/x1
  x1('x1'),

  /// The y-axis start coordinate for linear gradients.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/y1
  y1('y1'),

  /// The x-axis end coordinate for linear gradients.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/x2
  x2('x2'),

  /// The y-axis end coordinate for linear gradients.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/y2
  y2('y2'),

  /// The x-axis coordinate of the center of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/cx
  cx('cx'),

  /// The y-axis coordinate of the center of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/cy
  cy('cy'),

  /// The points of a polyline or polygon.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/points
  points('points'),

  /// The radius of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/r
  r('r'),

  /// The x-axis radius of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/rx
  rx('rx'),

  /// The y-axis radius of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/ry
  ry('ry'),

  /// The width of the rectangle.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/width
  width('width'),

  /// The height of the rectangle.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/height
  height('height'),

  /// The total length of the path in user units.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/pathLength
  pathLength('pathLength'),

  /// The transformation applied to the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform
  transform('transform'),

  /// The unique identifier of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/id
  id('id'),

  /// The reference to another element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/href
  href('href'),

  /// The x-axis coordinate of the focal point for radial gradients.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fx
  fx('fx'),

  /// The y-axis coordinate of the focal point for radial gradients.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fy
  fy('fy'),

  /// The radius of the focal circle for radial gradients.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fr
  fr('fr'),

  /// The path data.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/d
  d('d'),

  /// The offset of a gradient stop.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/offset
  offset('offset'),

  /// The color of a gradient stop.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stop-color
  stopColor('stop-color'),

  /// The opacity of a gradient stop.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stop-opacity
  stopOpacity('stop-opacity'),

  /// The transform applied to a gradient.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/gradientTransform
  gradientTransform('gradientTransform'),

  /// The CSS class(es) of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/class
  className('class'),

  /// Inline style rules for the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/style
  style('style'),

  /// The fill color of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill
  fill('fill'),

  /// The opacity of the fill.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill-opacity
  fillOpacity('fill-opacity'),

  /// The stroke color of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke
  stroke('stroke'),

  /// The opacity of the stroke.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-opacity
  strokeOpacity('stroke-opacity'),

  /// The width of the stroke.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-width
  strokeWidth('stroke-width'),

  /// The dash pattern for the stroke.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-dasharray
  strokeDasharray('stroke-dasharray'),

  /// The shape to be used at the end of open subpaths when they are stroked.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-linecap
  strokeLinecap('stroke-linecap'),

  /// The shape to be used at the corners of paths or basic shapes.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-linejoin
  strokeLinejoin('stroke-linejoin'),

  /// The transparency of an object or a group of objects.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/opacity
  opacity('opacity'),

  /// The size of the font.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-size
  fontSize('font-size'),

  /// The weight of the font.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-weight
  fontWeight('font-weight'),

  /// The style of the font.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-style
  fontStyle('font-style'),

  /// The family of the font.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-family
  fontFamily('font-family'),

  /// The viewBox of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/viewBox
  viewBox('viewBox');

  const XmlAttributeName(this.name);

  /// The standard string representation of the attribute name.
  final String name;
}
