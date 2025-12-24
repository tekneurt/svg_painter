import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';
import '../svg_value_extensions/svg_auto_to_double.dart';
import '../svg_value_extensions/svg_length_percentage_to_double.dart';
import '../svg_value_extensions/svg_percentage_to_double.dart';

/// Extension to convert [SvgRect] to [DrawRect].
extension SvgRectToPainting on SvgRect {
  /// Converts this [SvgRect] to a [DrawRect].
  Result<DrawRect> toDrawRect(SvgPaintingContext context) {
    final (double initialRx, double initialRy) = resolveRadii(rx, ry, context);

    final double wVal = width.toDoubleOrNull(context, SvgOrientation.horizontal) ?? 0.0;
    final double hVal = height.toDoubleOrNull(context, SvgOrientation.vertical) ?? 0.0;

    // Clamp radii per spec (must be non-negative and capped at half width/height)
    final double clampedRx = initialRx.clamp(0.0, wVal / 2.0);
    final double clampedRy = initialRy.clamp(0.0, hVal / 2.0);

    final PaintingStyle paint = resolvePaint(
      context,
      fill: fill,
      stroke: stroke,
      strokeWidth: strokeWidth,
    );

    // Apply transformation
    final double finalX = context.transformX(x.toPosition(context, SvgOrientation.horizontal));
    final double finalY = context.transformY(y.toPosition(context, SvgOrientation.vertical));
    final double finalWidth = context.scaleHorizontal(wVal);
    final double finalHeight = context.scaleVertical(hVal);
    final double finalRx = context.scaleHorizontal(clampedRx);
    final double finalRy = context.scaleVertical(clampedRy);

    return Success<DrawRect>(
      DrawRect(
        x: finalX,
        y: finalY,
        width: finalWidth,
        height: finalHeight,
        rx: finalRx,
        ry: finalRy,
        style: paint,
        transform: transform,
      ),
    );
  }
}
