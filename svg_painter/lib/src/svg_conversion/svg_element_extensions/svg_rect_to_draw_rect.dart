import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';
import '../svg_value_extensions/_svg_value_extensions.dart';

/// Extension to convert [SvgRect] to [PaintCommand]s.
extension SvgRectToPaintCommands on SvgRect {
  /// Converts this [SvgRect] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands(SvgPaintingContext context) {
    final double wVal = width.resolveOrNull(context, .horizontal) ?? 0.0;
    final double hVal = height.resolveOrNull(context, .vertical) ?? 0.0;

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
      id: id,
      pathLength: pathLength,
      fillAttributes: fillAttributes,
      strokeAttributes: strokeAttributes,
      opacity: opacity,
      cssClass: cssClass,
      inlineStyle: inlineStyle,
      transformAttributes: transformAttributes,
    );

    // Use local coordinates (generator handles transforms)
    final double finalX = x.toPosition(context, .horizontal);
    final double finalY = y.toPosition(context, .vertical);
    final double finalWidth = wVal;
    final double finalHeight = hVal;
    final double finalRx = clampedRx;
    final double finalRy = clampedRy;

    return Success<List<PaintCommand>>(<PaintCommand>[
      DrawRect(
        x: finalX,
        y: finalY,
        width: finalWidth,
        height: finalHeight,
        rx: finalRx,
        ry: finalRy,
        style: paint,
        id: id,
      ),
    ]);
  }
}
