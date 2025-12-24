import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';

/// Extension to convert [SvgPolygon] to [DrawPolygon].
extension SvgPolygonToPainting on SvgPolygon {
  /// Converts this [SvgPolygon] to a [DrawPolygon].
  Result<DrawPolygon> toDrawPolygon(SvgPaintingContext context) {
    // Resolve points relative to viewBox
    final List<double> resolvedPoints = <double>[];
    for (int i = 0; i < points.points.length; i += 2) {
      if (i + 1 >= points.points.length) {
        break;
      }
      final double x = points.points[i];
      final double y = points.points[i + 1];

      // Points are transformed through the context.
      resolvedPoints.add(context.transformX(x));
      resolvedPoints.add(context.transformY(y));
    }

    final PaintingStyle paint = resolvePaint(
      context,
      fill: fill,
      stroke: stroke,
      strokeWidth: strokeWidth,
    );

    return Success<DrawPolygon>(
      DrawPolygon(
        points: resolvedPoints,
        style: paint,
        transform: transform,
      ),
    );
  }
}
