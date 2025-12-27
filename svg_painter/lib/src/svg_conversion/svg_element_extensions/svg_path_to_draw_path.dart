import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';
import '../svg_transform_parser.dart';

/// Extension to convert [SvgPath] to [PaintCommand]s.
extension SvgPathToPainting on SvgPath {
  /// Converts this [SvgPath] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands(SvgPaintingContext context) {
    if (d.trim().isEmpty) {
      return const Success<List<PaintCommand>>(<PaintCommand>[]);
    }

    final List<PathOperation> operations = PathDataParser.parse(d, context);

    final PaintingStyle style = resolvePaint(
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

    return Success<List<PaintCommand>>(<PaintCommand>[
      DrawPath(
        operations: operations,
        style: style,
        transform: SvgTransformParser.scaleTransform(transform, context.parentSx, context.parentSy),
      ),
    ]);
  }
}
