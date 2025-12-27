import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';
import '../svg_value_extensions/svg_length_percentage_to_double.dart';
import '../svg_value_extensions/svg_percentage_to_double.dart';
import '../svg_transform_parser.dart';

/// Extension to convert [SvgCircle] to [PaintCommand]s.
extension SvgCircleToPainting on SvgCircle {
  /// Converts this [SvgCircle] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands(SvgPaintingContext context) {
    if (r.toDouble(context, SvgOrientation.normalized) <= 0) {
      return const Success<List<PaintCommand>>(<PaintCommand>[]);
    }

    final PaintingStyle paint = resolvePaint(
      context,
      fill: fill,
      stroke: stroke,
      strokeWidth: strokeWidth,
      strokeLinecap: strokeLinecap,
      strokeLinejoin: strokeLinejoin,
      opacity: opacity,
      cssClass: cssClass,
      inlineStyle: inlineStyle,
    );

    final double finalCx = context.transformX(cx.toPosition(context, SvgOrientation.horizontal));
    final double finalCy = context.transformY(cy.toPosition(context, SvgOrientation.vertical));
    final double finalR = context.scaleNormalized(r.toDouble(context, SvgOrientation.normalized));

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
