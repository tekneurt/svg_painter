import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';
import '../svg_value_extensions/svg_auto_to_double.dart';
import '../svg_value_extensions/svg_color_to_int.dart';
import '../svg_value_extensions/svg_length_percentage_to_double.dart';
import '../svg_value_extensions/svg_percentage_to_double.dart';

/// Extension to convert [SvgEllipse] to [DrawOval].
extension SvgEllipseToPainting on SvgEllipse {
  /// Converts this [SvgEllipse] to a [DrawOval].
  Result<DrawOval> toDrawOval(SvgPaintingContext context) {
    final double? resolvedRx = rx.toDoubleOrNull(context, SvgOrientation.horizontal);
    final double? resolvedRy = ry.toDoubleOrNull(context, SvgOrientation.vertical);

    final double finalRx;
    final double finalRy;

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

    return Success<DrawOval>(
      DrawOval(
        cx: cx.toDouble(context, SvgOrientation.horizontal),
        cy: cy.toDouble(context, SvgOrientation.vertical),
        rx: finalRx,
        ry: finalRy,
        fillColorArgb: fill.toFillArgb(),
        strokeColorArgb: stroke.toStrokeArgb(),
        strokeWidth:
            strokeWidth?.toDouble(context, SvgOrientation.normalized) ?? 1.0,
      ),
    );
  }
}
