import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';
import '../svg_value_extensions/svg_color_to_int.dart';
import '../svg_value_extensions/svg_length_percentage_to_double.dart';
import '../svg_value_extensions/svg_percentage_to_double.dart';

/// Extension to convert [SvgPolygon] to [DrawPolygon].
extension SvgPolygonToPainting on SvgPolygon {
  /// Converts this [SvgPolygon] to a [DrawPolygon].
  Result<DrawPolygon> toDrawPolygon(SvgPaintingContext context) {
    // Resolve points relative to viewBox
    final List<double> resolvedPoints = <double>[];
    for (int i = 0; i < points.points.length; i += 2) {
      if (i + 1 >= points.points.length) {
        break;
      }
      final double x = points.points[i];
      final double y = points.points[i + 1];

      // Apply transform directly to points
      resolvedPoints.add((x * context.parentSx) + context.parentTx);
      resolvedPoints.add((y * context.parentSy) + context.parentTy);
    }

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
    final double finalStrokeWidth =
        (sw?.toDouble(context, SvgOrientation.normalized) ?? 1.0) * context.parentScale;

    return Success<DrawPolygon>(
      DrawPolygon(
        points: resolvedPoints,
        fillColorArgb: fillColorArgb,
        strokeColorArgb: strokeColorArgb,
        strokeWidth: finalStrokeWidth,
        fillShaderId: fillShaderId,
        strokeShaderId: strokeShaderId,
        transform: transform,
      ),
    );
  }
}
