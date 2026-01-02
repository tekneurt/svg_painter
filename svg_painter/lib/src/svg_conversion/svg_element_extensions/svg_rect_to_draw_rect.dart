import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';
import '../svg_transform_parser.dart';
import '../svg_value_extensions/svg_auto_to_double.dart';
import '../svg_value_extensions/svg_length_percentage_to_double.dart';

/// Extension to convert [SvgRect] to [PaintCommand]s.
extension SvgRectToPainting on SvgRect {
  /// Converts this [SvgRect] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands(SvgPaintingContext context) {
    final double wVal = width.toDoubleOrNull(context, .horizontal) ?? 0.0;
    final double hVal = height.toDoubleOrNull(context, .vertical) ?? 0.0;

    if (wVal <= 0 || hVal <= 0) {
      return const Success<List<PaintCommand>>(<PaintCommand>[]);
    }

    final (double initialRx, double initialRy) = resolveRadii(rx, ry, context);

    // Clamp radii per spec (must be non-negative and capped at half width/height)
    final double clampedRx = initialRx.clamp(0.0, wVal / 2.0);
    final double clampedRy = initialRy.clamp(0.0, hVal / 2.0);

    final PaintingStyle paint = resolvePaint(
      context,
      tagName: 'rect',
      fill: fill,
      fillOpacity: fillOpacity,
      stroke: stroke,
      strokeOpacity: strokeOpacity,
      strokeWidth: strokeWidth,
      strokeDasharray: strokeDasharray,
      pathLength: pathLength,
      strokeLinecap: strokeLinecap,
      strokeLinejoin: strokeLinejoin,
      opacity: opacity,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
      cssClass: cssClass,
      inlineStyle: inlineStyle,
    );

    // Apply transformation
    final double finalX = context.transformX(x.toPosition(context, .horizontal));
    final double finalY = context.transformY(y.toPosition(context, .vertical));
    final double finalWidth = context.scaleHorizontal(wVal);
    final double finalHeight = context.scaleVertical(hVal);
    final double finalRx = context.scaleHorizontal(clampedRx);
    final double finalRy = context.scaleVertical(clampedRy);

    return Success<List<PaintCommand>>(<PaintCommand>[
      DrawRect(
        x: finalX,
        y: finalY,
        width: finalWidth,
        height: finalHeight,
        rx: finalRx,
        ry: finalRy,
        style: paint,
        transform: SvgTransformParser.scaleTransform(transform, context.parentSx, context.parentSy),
      ),
    ]);
  }
}
