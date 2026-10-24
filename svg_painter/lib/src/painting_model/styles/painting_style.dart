import 'package:meta/meta.dart';

import '../../svg_model/_svg_model.dart';

part 'painting_fill_style.dart';
part 'painting_gradient_units.dart';
part 'painting_stroke_style.dart';
part 'painting_text_style.dart';

/// A simple rect representation to avoid importing dart:ui in the painting model.
@immutable
class PaintingRect {
  const PaintingRect(this.left, this.top, this.width, this.height);

  final double left;
  final double top;
  final double width;
  final double height;

  @override
  String toString() => 'PaintingRect($left, $top, $width, $height)';
}

/// Common interface for styles that can be applied to a [Paint] object (Fill or Stroke).
abstract interface class PaintingPaintStyle {
  /// The ARGB integer for the color.
  int? get colorArgb;

  /// The ID of the shader (e.g., gradient) to use.
  String? get shaderId;

  /// The ID of the pattern to use.
  String? get patternId;

  /// The coordinate system used for the shader coordinates.
  PaintingGradientUnits? get shaderUnits;

  /// The opacity of the paint (0.0 to 1.0).
  double get opacity;

  /// Whether this style was explicitly defined on the element.
  bool get isExplicit;

  /// Whether this style uses the 'currentColor' keyword.
  bool get isCurrentColor;

  /// Whether this style uses the 'context-fill' keyword.
  bool get isContextFill;

  /// Whether this style uses the 'context-stroke' keyword.
  bool get isContextStroke;
}

/// Represents the visual style (fill and stroke) for a drawing command.
@immutable
final class PaintingStyle {
  const PaintingStyle({
    this.fill,
    this.stroke,
    this.text,
    this.groupOpacity = 1.0,
    this.transformAttributes,
    this.clipRect,
    this.maskId,
    this.clipPathId,
    this.filterId,
    this.markerStartId,
    this.markerMidId,
    this.markerEndId,
    this.paintOrder = SvgPaintOrder.normal,
    this.vectorEffect = SvgVectorEffect.none,
    this.strokeWidth = 1.0,
  });

  /// The width of the stroke (used e.g. for marker strokeWidth scaling), even if stroke is none.
  final double strokeWidth;

  /// The filling style, or null if the element is not filled.
  final PaintingFillStyle? fill;

  /// The stroking style, or null if the element is not stroked.
  final PaintingStrokeStyle? stroke;

  /// The text style, or null if the element is not text.
  final PaintingTextStyle? text;

  /// The transparency of the element group (0.0 to 1.0).
  final double groupOpacity;

  /// The structured transform attributes applied to this element.
  final SvgTransformAttributes? transformAttributes;

  /// An explicit clipping rectangle applied to the canvas before drawing.
  final PaintingRect? clipRect;

  /// The ID of the mask to apply to this element.
  final String? maskId;

  /// The ID of the clipPath to apply to this element.
  final String? clipPathId;

  /// The ID of the filter to apply to this element.
  final String? filterId;

  /// The ID of the marker to draw at the start vertex.
  final String? markerStartId;

  /// The ID of the marker to draw at middle vertices.
  final String? markerMidId;

  /// The ID of the marker to draw at the end vertex.
  final String? markerEndId;

  /// Whether this style specifies any markers.
  bool get hasMarkers => markerStartId != null || markerMidId != null || markerEndId != null;

  /// The order that the fill, stroke, and markers of a shape or text element are painted.
  final SvgPaintOrder paintOrder;

  /// The vector effect to use when drawing an object.
  final SvgVectorEffect vectorEffect;

  @override
  String toString() {
    final parts = <String>[
      if (fill != null) 'fill: $fill',
      if (stroke != null) 'stroke: $stroke',
      if (text != null) 'text: $text',
      if (groupOpacity != 1.0) 'groupOpacity: $groupOpacity',
      if (transformAttributes != null) 'transform: $transformAttributes',
      if (clipRect != null) 'clipRect: $clipRect',
      if (maskId != null) 'maskId: $maskId',
      if (clipPathId != null) 'clipPathId: $clipPathId',
      if (filterId != null) 'filterId: $filterId',
      if (markerStartId != null) 'markerStartId: $markerStartId',
      if (markerMidId != null) 'markerMidId: $markerMidId',
      if (markerEndId != null) 'markerEndId: $markerEndId',
      if (paintOrder != SvgPaintOrder.normal) 'paintOrder: $paintOrder',
      if (vectorEffect != SvgVectorEffect.none) 'vectorEffect: $vectorEffect',
      if (strokeWidth != 1.0) 'strokeWidth: $strokeWidth',
    ];
    if (parts.isEmpty) {
      return 'PaintingStyle()';
    } else {
      return 'PaintingStyle(${parts.join(', ')})';
    }
  }
}
