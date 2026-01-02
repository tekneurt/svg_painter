import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';
import '../svg_transform_parser.dart';
import '../svg_value_extensions/svg_length_percentage_to_double.dart';

/// Extension to convert [SvgCircle] to [PaintCommand]s.
extension SvgCircleToPainting on SvgCircle {
  /// Converts this [SvgCircle] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands(SvgPaintingContext context) {
    if (r.toDouble(context, .normalized) <= 0) {
      return const Success<List<PaintCommand>>(<PaintCommand>[]);
    }

    final PaintingStyle paint = resolvePaint(
      context,
      tagName: 'circle',
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

    final double finalCx = context.transformX(cx.toPosition(context, .horizontal));
    final double finalCy = context.transformY(cy.toPosition(context, .vertical));
    final double finalR = context.scaleNormalized(r.toDouble(context, .normalized));

    return Success<List<PaintCommand>>(<PaintCommand>[
      DrawCircle(
        cx: finalCx,
        cy: finalCy,
        radius: finalR,
        style: paint,
        transform: SvgTransformParser.scaleTransform(transform, context.parentSx, context.parentSy),
      ),
    ]);
  }
}
