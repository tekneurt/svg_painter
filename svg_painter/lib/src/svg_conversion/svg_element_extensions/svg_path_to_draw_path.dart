import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';
import '../svg_transform_parser.dart';

/// Extension to convert [SvgPath] to [PaintCommand]s.
extension SvgPathToPaintCommands on SvgPath {
  /// Converts this [SvgPath] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands(SvgPaintingContext context) {
    if (d.trim().isEmpty) {
      return const Success<List<PaintCommand>>(<PaintCommand>[]);
    }

    final Result<List<PathOperation>> operationsResult = PathDataParser.parse(d, context);

    final PaintingStyle paint = resolvePaint(
      context,
      tagName: 'path',
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

    return operationsResult.map(
      (List<PathOperation> operations) => <PaintCommand>[
        DrawPath(
          operations: operations,
          style: paint,
          transform: SvgTransformParser.scaleTransform(
            transform,
            context.parentSx,
            context.parentSy,
          ),
        ),
      ],
    );
  }
}
