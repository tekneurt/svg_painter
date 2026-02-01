import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';
import '../svg_transform_parser.dart';
import '../svg_value_extensions/svg_length_percentage_to_double.dart';
import '../svg_value_extensions/svg_percentage_to_double.dart';

/// Extension to convert [SvgLine] to [PaintCommand]s.
extension SvgLineToPaintCommands on SvgLine {
  /// Converts this [SvgLine] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands(SvgPaintingContext context) {
    final PaintingStyle paint = resolvePaint(
      context,
      tagName: 'line',
      id: id,
      fill: fill,
      fillOpacity: fillOpacity,
      stroke: stroke,
      pathLength: pathLength,
      opacity: opacity,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
      cssClass: cssClass,
      inlineStyle: inlineStyle,
    );

    final double finalX1 = context.transformX(x1.resolve(context, SvgOrientation.horizontal));
    final double finalY1 = context.transformY(y1.resolve(context, SvgOrientation.vertical));
    final double finalX2 = context.transformX(x2.resolve(context, SvgOrientation.horizontal));
    final double finalY2 = context.transformY(y2.resolve(context, SvgOrientation.vertical));

    return Success<List<PaintCommand>>(<PaintCommand>[
      DrawLine(
        x1: finalX1,
        y1: finalY1,
        x2: finalX2,
        y2: finalY2,
        style: paint,
        id: id,
        transform: SvgTransformParser.scaleTransform(transform, context.parentSx, context.parentSy),
      ),
    ]);
  }
}
