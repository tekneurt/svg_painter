import '../../painting_model/painting_style.dart';
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

  return PaintingStyle(
    fillColorArgb: fillColorArgb,
    fillShaderId: fillShaderId,
    strokeColorArgb: strokeColorArgb,
    strokeShaderId: strokeShaderId,
    strokeWidth: finalStrokeWidth,
  );
}
