import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';
import '../svg_value_extensions/_svg_value_extensions.dart';

/// Extension to convert [SvgEllipse] to [PaintCommand]s.
extension SvgEllipseToPaintCommands on SvgEllipse {
  /// Converts this [SvgEllipse] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands(SvgPaintingContext context) {
    final (double initialRx, double initialRy) = resolveRadii(rx, ry, context);

    if (initialRx <= 0 || initialRy <= 0) {
      return const Success<List<PaintCommand>>(<PaintCommand>[]);
    }

    final PaintingStyle paint = resolvePaint(
      context,
      tagName: 'ellipse',
      id: id,
      pathLength: pathLength,
      fillAttributes: fillAttributes,
      strokeAttributes: strokeAttributes,
      opacity: opacity,
      cssClass: cssClass,
      inlineStyle: inlineStyle,
      transformAttributes: context.transformAttributes(transformAttributes),
    );

    // Apply transformation
    final double finalCx = context.transformX(cx.toPosition(context, .horizontal));
    final double finalCy = context.transformY(cy.toPosition(context, .vertical));
    final double finalRx = context.scaleHorizontal(initialRx);
    final double finalRy = context.scaleVertical(initialRy);

    return Success<List<PaintCommand>>(<PaintCommand>[
      DrawOval(
        cx: finalCx,
        cy: finalCy,
        rx: finalRx,
        ry: finalRy,
        style: paint,
        id: id,
      ),
    ]);
  }
}
