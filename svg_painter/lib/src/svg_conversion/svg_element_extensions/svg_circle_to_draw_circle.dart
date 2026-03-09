import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';
import '../svg_value_extensions/_svg_value_extensions.dart';

/// Extension to convert [SvgCircle] to [PaintCommand]s.
extension SvgCircleToPaintCommands on SvgCircle {
  /// Converts this [SvgCircle] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands(SvgPaintingContext context) {
    if (r.resolve(context, .normalized) <= 0) {
      return const Success<List<PaintCommand>>(<PaintCommand>[]);
    }

    final PaintingStyle paint = resolvePaint(
      context,
      tagName: 'circle',
      id: id,
      pathLength: pathLength,
      fillAttributes: fillAttributes,
      strokeAttributes: strokeAttributes,
      opacity: opacity,
      cssClass: cssClass,
      inlineStyle: inlineStyle,
      transformAttributes: transformAttributes,
    );

    final double finalCx = cx.toPosition(context, .horizontal);
    final double finalCy = cy.toPosition(context, .vertical);
    final double finalR = r.resolve(context, .normalized);

    return Success<List<PaintCommand>>(<PaintCommand>[
      DrawCircle(cx: finalCx, cy: finalCy, radius: finalR, style: paint, id: id),
    ]);
  }
}
