import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';
import '../svg_value_extensions/svg_length_percentage_to_double.dart';
import '../svg_value_extensions/svg_percentage_to_double.dart';

/// Extension to convert [SvgLine] to [PaintCommand]s.
extension SvgLineToPainting on SvgLine {
  /// Converts this [SvgLine] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands(SvgPaintingContext context) {
    final PaintingStyle paint = resolvePaint(
      context,
      fill: fill,
      stroke: stroke,
      strokeWidth: strokeWidth,
      strokeLinecap: strokeLinecap,
      strokeLinejoin: strokeLinejoin,
      opacity: opacity,
    );

    final double finalX1 = context.transformX(x1.toDouble(context, SvgOrientation.horizontal));
    final double finalY1 = context.transformY(y1.toDouble(context, SvgOrientation.vertical));
    final double finalX2 = context.transformX(x2.toDouble(context, SvgOrientation.horizontal));
    final double finalY2 = context.transformY(y2.toDouble(context, SvgOrientation.vertical));

    return Success<List<PaintCommand>>(<PaintCommand>[
      DrawLine(
        x1: finalX1,
        y1: finalY1,
        x2: finalX2,
        y2: finalY2,
        style: paint,
        transform: transform,
      ),
    ]);
  }
}
