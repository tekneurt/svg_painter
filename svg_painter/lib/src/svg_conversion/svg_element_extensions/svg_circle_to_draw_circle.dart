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

    double finalCx = cx.toDouble(context, SvgOrientation.horizontal);
    double finalCy = cy.toDouble(context, SvgOrientation.vertical);
    double finalR = r.toDouble(context, SvgOrientation.normalized);

    // Apply parent transformation
    finalCx = (finalCx * context.parentSx) + context.parentTx;
    finalCy = (finalCy * context.parentSy) + context.parentTy;

    final double scale = context.parentScale;
    finalR = finalR * scale;
    final double finalStrokeWidth =
        (sw?.toDouble(context, SvgOrientation.normalized) ?? 1.0) * scale;

    return Success<DrawCircle>(
      DrawCircle(
        cx: finalCx,
        cy: finalCy,
        radius: finalR,
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
