import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';
import '../svg_transform_parser.dart';
import '../svg_value_extensions/_svg_value_extensions.dart';

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
      id: id,
      fill: fill,
      stroke: stroke,
      font: font,
      opacity: opacity,
      cssClass: cssClass,
      inlineStyle: inlineStyle,
    );

    final double finalX = context.transformX(x.resolve(context, .horizontal));
    final double finalY = context.transformY(y.resolve(context, .vertical));

    return Success<List<PaintCommand>>(<PaintCommand>[
      DrawText(
        x: finalX,
        y: finalY,
        text: text,
        style: paint,
        id: id,
        transform: SvgTransformParser.scaleTransform(transform, context.parentSx, context.parentSy),
      ),
    ]);
  }
}
