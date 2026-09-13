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

  /// The coordinate system used for the shader coordinates.
  PaintingGradientUnits? get shaderUnits;

  /// The opacity of the paint (0.0 to 1.0).
  double get opacity;

  /// Whether this style was explicitly defined on the element.
  bool get isExplicit;

  /// Whether this style uses the 'currentColor' keyword.
  bool get isCurrentColor;
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
    this.paintOrder = SvgPaintOrder.normal,
    this.vectorEffect = SvgVectorEffect.none,
  });

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
      if (paintOrder != SvgPaintOrder.normal) 'paintOrder: $paintOrder',
      if (vectorEffect != SvgVectorEffect.none) 'vectorEffect: $vectorEffect',
    ];
    if (parts.isEmpty) {
      return 'PaintingStyle()';
    } else {
      return 'PaintingStyle(${parts.join(', ')})';
    }
  }
}
