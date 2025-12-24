import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';
import '../svg_value_extensions/svg_color_to_int.dart';
import '../svg_value_extensions/svg_length_percentage_to_double.dart';
import '../svg_value_extensions/svg_percentage_to_double.dart';

/// Extension to convert [SvgLine] to [DrawLine].
extension SvgLineToPainting on SvgLine {
  /// Converts this [SvgLine] to a [DrawLine].
  Result<DrawLine> toDrawLine(SvgPaintingContext context) {
    int? strokeColorArgb;
    String? strokeShaderId;

    final SvgColor? strokePaint = stroke ?? context.inheritedStroke;
    if (strokePaint is SvgPaintReference) {
      strokeShaderId = strokePaint.id;
    } else {
      strokeColorArgb = strokePaint.toStrokeArgb();
    }

    final SvgLengthPercentage? sw = strokeWidth ?? context.inheritedStrokeWidth;
    final double finalStrokeWidth =
        (sw?.toDouble(context, SvgOrientation.normalized) ?? 1.0) * context.parentScale;

    double x1Val = x1.toDouble(context, SvgOrientation.horizontal);
    double y1Val = y1.toDouble(context, SvgOrientation.vertical);
    double x2Val = x2.toDouble(context, SvgOrientation.horizontal);
    double y2Val = y2.toDouble(context, SvgOrientation.vertical);

    // Apply transformation
    x1Val = (x1Val * context.parentSx) + context.parentTx;
    y1Val = (y1Val * context.parentSy) + context.parentTy;
    x2Val = (x2Val * context.parentSx) + context.parentTx;
    y2Val = (y2Val * context.parentSy) + context.parentTy;

    return Success<DrawLine>(
      DrawLine(
        x1: x1Val,
        y1: y1Val,
        x2: x2Val,
        y2: y2Val,
        strokeColorArgb: strokeColorArgb,
        strokeWidth: finalStrokeWidth,
        strokeShaderId: strokeShaderId,
        transform: transform,
      ),
    );
  }
}
