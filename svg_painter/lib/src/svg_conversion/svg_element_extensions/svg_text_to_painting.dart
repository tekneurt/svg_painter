import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';
import '../svg_transform_parser.dart';
import '../svg_value_extensions/svg_length_percentage_to_double.dart';
import '../svg_value_extensions/svg_percentage_to_double.dart';

/// Extension to convert [SvgText] to [PaintCommand]s.
extension SvgTextToPaintCommands on SvgText {
  /// Converts this [SvgText] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands(SvgPaintingContext context) {
    if (text.isEmpty) {
      return const Success<List<PaintCommand>>(<PaintCommand>[]);
    }

    final PaintingStyle paint = resolvePaint(
      context,
      tagName: 'text',
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

    final double finalX = context.transformX(x.resolve(context, SvgOrientation.horizontal));
    final double finalY = context.transformY(y.resolve(context, SvgOrientation.vertical));

    return Success<List<PaintCommand>>(<PaintCommand>[
      DrawText(
        x: finalX,
        y: finalY,
        text: text,
        style: paint,
        transform: SvgTransformParser.scaleTransform(transform, context.parentSx, context.parentSy),
      ),
    ]);
  }
}
