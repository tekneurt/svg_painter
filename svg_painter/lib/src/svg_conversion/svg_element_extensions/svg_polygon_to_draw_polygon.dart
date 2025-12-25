import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';

/// Extension to convert [SvgPolygon] to [PaintCommand]s.
extension SvgPolygonToPainting on SvgPolygon {
  /// Converts this [SvgPolygon] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands(SvgPaintingContext context) {
    if (points.points.length < 4) {
      return const Success<List<PaintCommand>>(<PaintCommand>[]);
    }

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
      strokeLinecap: strokeLinecap,
      strokeLinejoin: strokeLinejoin,
      opacity: opacity,
    );

    return Success<List<PaintCommand>>(<PaintCommand>[
      DrawPolygon(
        points: resolvedPoints,
        style: paint,
        transform: transform,
      ),
    ]);
  }
}
