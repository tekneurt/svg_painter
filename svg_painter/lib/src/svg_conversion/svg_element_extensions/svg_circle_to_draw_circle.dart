import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';
import '../svg_value_extensions/svg_color_to_int.dart';
import '../svg_value_extensions/svg_length_percentage_to_double.dart';
import '../svg_value_extensions/svg_percentage_to_double.dart';

/// Orientation for resolving percentages.
extension SvgCircleToPainting on SvgCircle {
  /// Converts this [SvgCircle] to a [DrawCircle].
  Result<DrawCircle> toDrawCircle(SvgPaintingContext context) {
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

    return Success<DrawCircle>(
      DrawCircle(
        cx: cx.toDouble(context, SvgOrientation.horizontal),
        cy: cy.toDouble(context, SvgOrientation.vertical),
        radius: r.toDouble(context, SvgOrientation.normalized),
        fillColorArgb: fillColorArgb,
        strokeColorArgb: strokeColorArgb,
        strokeWidth: strokeWidth?.toDouble(context, SvgOrientation.normalized) ?? 1.0,
        fillShaderId: fillShaderId,
        strokeShaderId: strokeShaderId,
      ),
    );
  }
}
