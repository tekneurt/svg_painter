import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';
import '../svg_value_extensions/_svg_value_extensions.dart';

/// Extension to convert [SvgCircle] to [PaintCommand]s.
extension SvgCircleToPaintCommands on SvgCircle {
  /// Converts this [SvgCircle] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands(SvgPaintingContext context) {
    final double radius = r.resolve(context, .normalized);
    if (radius <= 0) {
      return const Success<List<PaintCommand>>(<PaintCommand>[]);
    }

    final PaintingStyle paint = resolvePaint(
      context,
      tagName: 'circle',
      coreAttributes: coreAttributes,
      presentationAttributes: presentationAttributes,
      geometryAttributes: geometryAttributes,
    );

    // Use local coordinates (generator handles transforms)
    final double finalCx = cx.toPosition(context, .horizontal);
    final double finalCy = cy.toPosition(context, .vertical);
    final finalR = radius;

    return Success<List<PaintCommand>>(<PaintCommand>[
      DrawCircle(cx: finalCx, cy: finalCy, radius: finalR, style: paint, id: id),
    ]);
  }
}
