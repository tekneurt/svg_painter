import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';

/// Extension to convert [SvgPath] to [DrawPath].
extension SvgPathToPainting on SvgPath {
  /// Converts this [SvgPath] to a [DrawPath].
  Result<DrawPath> toDrawPath(SvgPaintingContext context) {
    final List<PathOperation> operations = PathDataParser.parse(d, context);

    final PaintingStyle style = resolvePaint(
      context,
      fill: fill,
      stroke: stroke,
      strokeWidth: strokeWidth,
    );

    return Success<DrawPath>(DrawPath(operations: operations, style: style, transform: transform));
  }
}
