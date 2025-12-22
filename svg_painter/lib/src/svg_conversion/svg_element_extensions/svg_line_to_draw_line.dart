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

    final SvgColor? strokePaint = stroke;
    if (strokePaint is SvgPaintReference) {
      strokeShaderId = strokePaint.id;
    } else {
      // For lines, initial value of stroke is 'none' (transparent)
      // but if specified it defaults to black? No, MDN says 'none'.
      // SvgColorToInt.toStrokeArgb handles this.
      strokeColorArgb = strokePaint.toStrokeArgb();
    }

    return Success<DrawLine>(
      DrawLine(
        x1: x1.toPosition(context, SvgOrientation.horizontal),
        y1: y1.toPosition(context, SvgOrientation.vertical),
        x2: x2.toPosition(context, SvgOrientation.horizontal),
        y2: y2.toPosition(context, SvgOrientation.vertical),
        strokeColorArgb: strokeColorArgb,
        strokeWidth: strokeWidth?.toDouble(context, SvgOrientation.normalized) ?? 1.0,
        strokeShaderId: strokeShaderId,
      ),
    );
  }
}
