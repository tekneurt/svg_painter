import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';

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
      id: id,
      pathLength: pathLength,
      fillAttributes: fillAttributes,
      strokeAttributes: strokeAttributes,
      opacity: opacity,
      cssClass: cssClass,
      inlineStyle: inlineStyle,
      transformAttributes: transformAttributes,
    );

    return operationsResult.map(
      (List<PathOperation> operations) => <PaintCommand>[
        DrawPath(operations: operations, style: paint, id: id),
      ],
    );
  }
}
