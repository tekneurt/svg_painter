import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../svg_value_extensions/svg_color_to_int.dart';
import '../svg_value_extensions/svg_length_percentage_to_double.dart';
import '../svg_value_extensions/svg_percentage_to_double.dart';
import 'svg_painting_context.dart';

/// Resolves the fill, stroke, and stroke-width for an element, handling inheritance and scaling.
PaintingStyle resolvePaint(
  SvgPaintingContext context, {
  SvgColor? fill,
  SvgColor? stroke,
  SvgLengthPercentage? strokeWidth,
  SvgStrokeLinecap? strokeLinecap,
  SvgStrokeLinejoin? strokeLinejoin,
  SvgLengthPercentage? opacity,
}) {
  int? fillColorArgb;
  String? fillShaderId;
  int? strokeColorArgb;
  String? strokeShaderId;

  final SvgColor? fillPaint = fill ?? context.inheritedFill;
  if (fillPaint is SvgPaintReference) {
    fillShaderId = fillPaint.id;
  } else {
    fillColorArgb = fillPaint.toFillArgb();
  }

  final SvgColor? strokePaint = stroke ?? context.inheritedStroke;
  if (strokePaint is SvgPaintReference) {
    strokeShaderId = strokePaint.id;
  } else {
    strokeColorArgb = strokePaint.toStrokeArgb();
  }

  final SvgLengthPercentage? sw = strokeWidth ?? context.inheritedStrokeWidth;
  final double finalStrokeWidth = context.scaleNormalized(
    sw?.toDouble(context, SvgOrientation.normalized) ?? 1.0,
  );

  final SvgStrokeLinecap resolvedCap =
      strokeLinecap ?? context.inheritedStrokeLinecap ?? SvgStrokeLinecap.butt;

  final SvgStrokeLinejoin resolvedJoin =
      strokeLinejoin ?? context.inheritedStrokeLinejoin ?? SvgStrokeLinejoin.miter;

  // Resolve opacity (0.0 to 1.0). Inherited opacity is multiplied.
  // Note: For now we just use the element's opacity or inherited one.
  // Technically SVG opacity multiplies through the hierarchy.
  final double elementOpacity =
      opacity?.toDouble(context, SvgOrientation.normalized) ??
      context.inheritedOpacity?.toDouble(context, SvgOrientation.normalized) ??
      1.0;

  return PaintingStyle(
    fillColorArgb: fillColorArgb,
    fillShaderId: fillShaderId,
    strokeColorArgb: strokeColorArgb,
    strokeShaderId: strokeShaderId,
    strokeWidth: finalStrokeWidth,
    strokeCap: resolvedCap.toStrokeCap(),
    strokeJoin: resolvedJoin.toStrokeJoin(),
    opacity: elementOpacity,
  );
}

extension on SvgStrokeLinecap {
  StrokeCap toStrokeCap() {
    return switch (this) {
      SvgStrokeLinecap.butt => StrokeCap.butt,
      SvgStrokeLinecap.round => StrokeCap.round,
      SvgStrokeLinecap.square => StrokeCap.square,
    };
  }
}

extension on SvgStrokeLinejoin {
  StrokeJoin toStrokeJoin() {
    return switch (this) {
      SvgStrokeLinejoin.miter => StrokeJoin.miter,
      SvgStrokeLinejoin.round => StrokeJoin.round,
      SvgStrokeLinejoin.bevel => StrokeJoin.bevel,
      SvgStrokeLinejoin.miterClip => StrokeJoin.miter,
      SvgStrokeLinejoin.arcs => StrokeJoin.miter,
    };
  }
}
