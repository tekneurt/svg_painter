import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';
import '../svg_value_extensions/svg_color_to_int.dart';
import '../svg_value_extensions/svg_length_percentage_to_double.dart';
import '../svg_value_extensions/svg_percentage_to_double.dart';

/// Extension to convert [SvgPolyline] to [DrawPolyline].
extension SvgPolylineToPainting on SvgPolyline {
  /// Converts this [SvgPolyline] to a [DrawPolyline].
  Result<DrawPolyline> toDrawPolyline(SvgPaintingContext context) {
    // Resolve points relative to viewBox
    final List<double> resolvedPoints = <double>[];
    for (int i = 0; i < points.points.length; i += 2) {
      if (i + 1 >= points.points.length) break;
      final double x = points.points[i];
      final double y = points.points[i + 1];
      resolvedPoints.add(x - context.viewBoxMinX);
      resolvedPoints.add(y - context.viewBoxMinY);
    }

    int? fillColorArgb;
    String? fillShaderId;
    int? strokeColorArgb;
    String? strokeShaderId;

    final SvgColor? fillPaint = fill;
    if (fillPaint is SvgPaintReference) {
      fillShaderId = fillPaint.id;
    } else {
      // Polyline default fill is black (usually, unlike line which is none).
      // But spec says open shapes can be filled.
      fillColorArgb = fillPaint.toFillArgb();
    }

    final SvgColor? strokePaint = stroke;
    if (strokePaint is SvgPaintReference) {
      strokeShaderId = strokePaint.id;
    } else {
      strokeColorArgb = strokePaint.toStrokeArgb();
    }

    return Success<DrawPolyline>(
      DrawPolyline(
        points: resolvedPoints,
        fillColorArgb: fillColorArgb,
        strokeColorArgb: strokeColorArgb,
        strokeWidth: strokeWidth?.toDouble(context, SvgOrientation.normalized) ?? 1.0,
        fillShaderId: fillShaderId,
        strokeShaderId: strokeShaderId,
      ),
    );
  }
}
