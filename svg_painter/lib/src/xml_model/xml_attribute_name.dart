/// Enumeration of standard XML attribute names used in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute
enum XmlAttributeName {
  /// The CSS class(es) of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/class
  className('class'),

  /// The reference to a clipPath element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/clip-path
  clipPath('clip-path'),

  /// The coordinate system for the clipPath content.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/clipPathUnits
  clipPathUnits('clipPathUnits'),

  /// The color property used as an indirect value for currentColor.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color
  color('color'),

  /// The x-axis coordinate of the center of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/cx
  cx('cx'),

  /// The y-axis coordinate of the center of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/cy
  cy('cy'),

  /// The path data.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/d
  d('d'),

  /// The decoding hint for the image.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/decoding
  decoding('decoding'),

  /// The relative x-axis shift for text.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/dx
  dx('dx'),

  /// The relative y-axis shift for text.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/dy
  dy('dy'),

  /// The fill color of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill
  fill('fill'),

  /// The opacity of the fill.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill-opacity
  fillOpacity('fill-opacity'),

  /// The algorithm to use to determine the inside part of a shape.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill-rule
  fillRule('fill-rule'),

  /// The family of the font.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-family
  fontFamily('font-family'),

  /// The size of the font.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-size
  fontSize('font-size'),

  /// The style of the font.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-style
  fontStyle('font-style'),

  /// The weight of the font.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-weight
  fontWeight('font-weight'),

  /// The radius of the focal circle for radial gradients.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fr
  fr('fr'),

  /// The x-axis coordinate of the focal point for radial gradients.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fx
  fx('fx'),

  /// The y-axis coordinate of the focal point for radial gradients.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fy
  fy('fy'),

  /// The transform applied to a gradient.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/gradientTransform
  gradientTransform('gradientTransform'),

  /// The coordinate system used for the gradient coordinates.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/gradientUnits
  gradientUnits('gradientUnits'),

  /// The height of the rectangle.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/height
  height('height'),

  /// The reference to another element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/href
  href('href'),

  /// The unique identifier of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/id
  id('id'),

  /// The reference to a mask element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/mask
  mask('mask'),

  /// The coordinate system for the mask content.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/maskContentUnits
  maskContentUnits('maskContentUnits'),

  /// The coordinate system for the mask.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/maskUnits
  maskUnits('maskUnits'),

  /// The media for which the style is applicable.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/media
  media('media'),

  /// The offset of a gradient stop.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/offset
  offset('offset'),

  /// The transparency of an object or a group of objects.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/opacity
  opacity('opacity'),

  /// The order that the fill, stroke, and markers of a shape or text element are painted.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/paint-order
  paintOrder('paint-order'),

  /// The total length of the path in user units.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/pathLength
  pathLength('pathLength'),

  /// The points of a polyline or polygon.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/points
  points('points'),

  /// The preserveAspectRatio of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/preserveAspectRatio
  preserveAspectRatio('preserveAspectRatio'),

  /// The radius of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/r
  r('r'),

  /// The supplemental rotation applied to characters.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/rotate
  rotate('rotate'),

  /// The x-axis radius of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/rx
  rx('rx'),

  /// The y-axis radius of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/ry
  ry('ry'),

  /// The method used to fill the area outside the gradient vector.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/spreadMethod
  spreadMethod('spreadMethod'),

  /// How far the beginning of the text should be offset from the beginning of the path.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/startOffset
  startOffset('startOffset'),

  /// The color of a gradient stop.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stop-color
  stopColor('stop-color'),

  /// The opacity of a gradient stop.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stop-opacity
  stopOpacity('stop-opacity'),

  /// The stroke color of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke
  stroke('stroke'),

  /// The dash pattern for the stroke.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-dasharray
  strokeDasharray('stroke-dasharray'),

  /// The distance into the dash pattern to start the dash.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-dashoffset
  strokeDashoffset('stroke-dashoffset'),

  /// The shape to be used at the end of open subpaths when they are stroked.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-linecap
  strokeLinecap('stroke-linecap'),

  /// The shape to be used at the corners of paths or basic shapes.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-linejoin
  strokeLinejoin('stroke-linejoin'),

  /// The limit on the ratio of the miter length to the stroke-width.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-miterlimit
  strokeMiterlimit('stroke-miterlimit'),

  /// The opacity of the stroke.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-opacity
  strokeOpacity('stroke-opacity'),

  /// The width of the stroke.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-width
  strokeWidth('stroke-width'),

  /// Inline style rules for the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/style
  style('style'),

  /// The alignment of text relative to a given point.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/text-anchor
  textAnchor('text-anchor'),

  /// The title of the element or style.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/title
  title('title'),

  /// The transformation applied to the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform
  transform('transform'),

  /// The type of the style or script.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/type
  type('type'),

  /// The vector effect to use when drawing an object.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/vector-effect
  vectorEffect('vector-effect'),

  /// The viewBox of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/viewBox
  viewBox('viewBox'),

  /// The width of the rectangle.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/width
  width('width'),

  /// The x-axis coordinate of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/x
  x('x'),

  /// The x-axis start coordinate for linear gradients.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/x1
  x1('x1'),

  /// The x-axis end coordinate for linear gradients.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/x2
  x2('x2'),

  /// The xml:space attribute.
  /// https://www.w3.org/TR/SVG11/styling.html#XMLSpaceAttribute
  xmlSpace('xml:space'),

  /// The y-axis coordinate of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/y
  y('y'),

  /// The y-axis start coordinate for linear gradients.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/y1
  y1('y1'),

  /// The y-axis end coordinate for linear gradients.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/y2
  y2('y2')
  ;

  const XmlAttributeName(this.name);

  /// The standard string representation of the attribute name.
  final String name;
}
