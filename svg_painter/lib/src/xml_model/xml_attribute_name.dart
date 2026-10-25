/// Enumeration of standard XML attribute names used in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute
enum XmlAttributeName {
  /// The amplitude of the gamma function for feFunc*.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/amplitude
  amplitude('amplitude'),

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

  /// Specifies whether or how an element is rendered.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/display
  display('display'),

  /// The relative x-axis shift for text.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/dx
  dx('dx'),

  /// The relative y-axis shift for text.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/dy
  dy('dy'),

  /// The exponent of the gamma function for feFunc*.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/exponent
  exponent('exponent'),

  /// The fill color of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill
  fill('fill'),

  /// The opacity of the fill.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill-opacity
  fillOpacity('fill-opacity'),

  /// The algorithm to use to determine the inside part of a shape.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill-rule
  fillRule('fill-rule'),

  /// The filter effects applied to an element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/filter
  filter('filter'),

  /// The coordinate system for the filter region.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/filterUnits
  filterUnits('filterUnits'),

  /// The color to use to flood the current filter primitive subregion.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/flood-color
  floodColor('flood-color'),

  /// The opacity to use to flood the current filter primitive subregion.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/flood-opacity
  floodOpacity('flood-opacity'),

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

  /// The input for this filter primitive.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/in
  in_('in'),

  /// The intercept of the linear function for feFunc*.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/intercept
  intercept('intercept'),

  /// The marker shorthand attribute.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/marker
  marker('marker'),

  /// The marker to attach to the last vertex of a path, line, polyline or polygon.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/marker-end
  markerEnd('marker-end'),

  /// The height of the viewport into which the marker is to be fitted.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/markerHeight
  markerHeight('markerHeight'),

  /// The marker to attach to all vertices other than the first and last of a path, line, polyline or polygon.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/marker-mid
  markerMid('marker-mid'),

  /// The marker to attach to the first vertex of a path, line, polyline or polygon.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/marker-start
  markerStart('marker-start'),

  /// The coordinate system for attributes markerWidth and markerHeight.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/markerUnits
  markerUnits('markerUnits'),

  /// The width of the viewport into which the marker is to be fitted.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/markerWidth
  markerWidth('markerWidth'),

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

  /// The orientation of the marker relative to the shape it is attached to.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/orient
  orient('orient'),

  /// Specifies whether content of a block-level element is clipped when it overflows the element's box.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/overflow
  overflow('overflow'),

  /// The order that the fill, stroke, and markers of a shape or text element are painted.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/paint-order
  paintOrder('paint-order'),

  /// The total length of the path in user units.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/pathLength
  pathLength('pathLength'),

  /// The coordinate system for the pattern content.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/patternContentUnits
  patternContentUnits('patternContentUnits'),

  /// The transform applied to the pattern tile grid.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/patternTransform
  patternTransform('patternTransform'),

  /// The coordinate system for the pattern tile dimensions.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/patternUnits
  patternUnits('patternUnits'),

  /// The points of a polyline or polygon.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/points
  points('points'),

  /// The preserveAspectRatio of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/preserveAspectRatio
  preserveAspectRatio('preserveAspectRatio'),

  /// The coordinate system for filter primitives.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/primitiveUnits
  primitiveUnits('primitiveUnits'),

  /// The radius of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/r
  r('r'),

  /// The x-axis coordinate of reference point for the marker.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/refX
  refX('refX'),

  /// The y-axis coordinate of reference point for the marker.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/refY
  refY('refY'),

  /// The assigned name for this filter primitive's result.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/result
  result('result'),

  /// The supplemental rotation applied to characters.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/rotate
  rotate('rotate'),

  /// The x-axis radius of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/rx
  rx('rx'),

  /// The y-axis radius of the element.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/ry
  ry('ry'),

  /// The slope of the linear function for feFunc*.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/slope
  slope('slope'),

  /// The method used to fill the area outside the gradient vector.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/spreadMethod
  spreadMethod('spreadMethod'),

  /// How far the beginning of the text should be offset from the beginning of the path.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/startOffset
  startOffset('startOffset'),

  /// The standard deviation for the blur operation.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stdDeviation
  stdDeviation('stdDeviation'),

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

  /// The table values for table or discrete transfer functions for feFunc*.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/tableValues
  tableValues('tableValues'),

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

  /// Specifies whether an element is visible.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/visibility
  visibility('visibility'),

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

  /// The `xlink:href` attribute.
  /// https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/xlink:href
  xlinkHref('xlink:href'),

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
