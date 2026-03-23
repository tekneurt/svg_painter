import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';

/// Extension to convert [SvgPath] to [PaintCommand]s.
extension SvgPathToPaintCommands on SvgPath {
  /// Converts this [SvgPath] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands(SvgPaintingContext context) {
    if (d.isEmpty) {
      return const Success<List<PaintCommand>>(<PaintCommand>[]);
    }

    final PaintingStyle paint = resolvePaint(
      context,
      tagName: 'path',
      coreAttributes: coreAttributes,
      presentationAttributes: presentationAttributes,
      geometryAttributes: geometryAttributes,
    );

    return PathDataParser.parse(d, context).map((List<PathOperation> ops) {
      return <PaintCommand>[
        DrawPath(operations: ops, style: paint, id: id),
      ];
    });
  }
}
