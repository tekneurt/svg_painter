import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';
import '../svg_value_extensions/svg_length_percentage_to_double.dart';
import '../svg_value_extensions/svg_percentage_to_double.dart';

/// Extension to convert [SvgCircle] to [DrawCircle].
extension SvgCircleToPainting on SvgCircle {
  /// Converts this [SvgCircle] to a [DrawCircle].
  Result<DrawCircle> toDrawCircle(SvgPaintingContext context) {
    final PaintingStyle paint = resolvePaint(
      context,
      fill: fill,
      stroke: stroke,
      strokeWidth: strokeWidth,
    );

    final double finalCx = context.transformX(cx.toPosition(context, SvgOrientation.horizontal));
    final double finalCy = context.transformY(cy.toPosition(context, SvgOrientation.vertical));
    final double finalR = context.scaleNormalized(r.toDouble(context, SvgOrientation.normalized));

    return Success<DrawCircle>(
      DrawCircle(
        cx: finalCx,
        cy: finalCy,
        radius: finalR,
        style: paint,
        transform: transform,
      ),
    );
  }
}
