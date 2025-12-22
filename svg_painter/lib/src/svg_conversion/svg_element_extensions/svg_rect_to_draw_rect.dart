import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';
import '../svg_value_extensions/svg_auto_to_double.dart';
import '../svg_value_extensions/svg_color_to_int.dart';
import '../svg_value_extensions/svg_length_percentage_to_double.dart';
import '../svg_value_extensions/svg_percentage_to_double.dart';

/// Extension to convert [SvgRect] to [DrawRect].
extension SvgRectToPainting on SvgRect {
  /// Converts this [SvgRect] to a [DrawRect].
  Result<DrawRect> toDrawRect(SvgPaintingContext context) {
    final double? resolvedRx = rx.toDoubleOrNull(context, SvgOrientation.horizontal);
    final double? resolvedRy = ry.toDoubleOrNull(context, SvgOrientation.vertical);

    double finalRx;
    double finalRy;

    if (resolvedRx == null && resolvedRy == null) {
      finalRx = 0.0;
      finalRy = 0.0;
    } else if (resolvedRx == null) {
      finalRx = resolvedRy!;
      finalRy = resolvedRy;
    } else if (resolvedRy == null) {
      finalRx = resolvedRx;
      finalRy = resolvedRx;
    } else {
      finalRx = resolvedRx;
      finalRy = resolvedRy;
    }

    final double widthPx = width.toDoubleOrNull(context, SvgOrientation.horizontal) ?? 0.0;
    final double heightPx = height.toDoubleOrNull(context, SvgOrientation.vertical) ?? 0.0;

    // Clamp radii per spec
    finalRx = finalRx.clamp(0.0, widthPx / 2.0);
    finalRy = finalRy.clamp(0.0, heightPx / 2.0);

    int? fillColorArgb;
    String? fillShaderId;
    int? strokeColorArgb;
    String? strokeShaderId;

    final SvgColor? fillPaint = fill;
    if (fillPaint is SvgPaintReference) {
      fillShaderId = fillPaint.id;
    } else {
      fillColorArgb = fillPaint.toFillArgb();
    }

    final SvgColor? strokePaint = stroke;
    if (strokePaint is SvgPaintReference) {
      strokeShaderId = strokePaint.id;
    } else {
      strokeColorArgb = strokePaint.toStrokeArgb();
    }

    return Success<DrawRect>(
      DrawRect(
        x: x.toPosition(context, SvgOrientation.horizontal),
        y: y.toPosition(context, SvgOrientation.vertical),
        width: widthPx,
        height: heightPx,
        rx: finalRx,
        ry: finalRy,
        fillColorArgb: fillColorArgb,
        strokeColorArgb: strokeColorArgb,
        strokeWidth: strokeWidth?.toDouble(context, SvgOrientation.normalized) ?? 1.0,
        fillShaderId: fillShaderId,
        strokeShaderId: strokeShaderId,
      ),
    );
  }
}
