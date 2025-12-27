import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';
import '../svg_transform_parser.dart';

/// Extension to convert [SvgPolyline] to [PaintCommand]s.
extension SvgPolylineToPainting on SvgPolyline {
  /// Converts this [SvgPolyline] to a list of [PaintCommand]s.
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

      // Apply transform directly to points
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
      cssClass: cssClass,
      inlineStyle: inlineStyle,
    );

    return Success<List<PaintCommand>>(<PaintCommand>[
      DrawPolyline(
        points: resolvedPoints,
        style: paint,
        transform: SvgTransformParser.scaleTransform(transform, context.parentSx, context.parentSy),
      ),
    ]);
  }
}
