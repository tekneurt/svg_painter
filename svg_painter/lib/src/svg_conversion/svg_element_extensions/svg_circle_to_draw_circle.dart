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
    return Success<DrawCircle>(
      DrawCircle(
        cx: cx.toDouble(context, SvgOrientation.horizontal),
        cy: cy.toDouble(context, SvgOrientation.vertical),
        radius: r.toDouble(context, SvgOrientation.normalized),
        fillColorArgb: fill.toFillArgb(),
        strokeColorArgb: stroke.toStrokeArgb(),
        strokeWidth:
            strokeWidth?.toDouble(context, SvgOrientation.normalized) ?? 1.0,
      ),
    );
  }
}
