import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';
import '../svg_value_extensions/_svg_value_extensions.dart';

/// Extension to convert [SvgGradient] to a [PaintCommand].
extension SvgGradientToPainting on SvgGradient {
  /// Converts this [SvgGradient] to a [PaintCommand].
  Result<PaintCommand> toPaintCommand(SvgPaintingContext context) {
    final SvgGradient self = this;
    final String? gradId = id;
    if (gradId == null) {
      return const Failure<PaintCommand>('Gradient element must have an ID to be referenced.');
    }

    if (self is SvgLinearGradient) {
      final double finalX1 = self.x1.resolve(context, SvgOrientation.horizontal);
      final double finalY1 = self.y1.resolve(context, SvgOrientation.vertical);
      final double finalX2 = self.x2.resolve(context, SvgOrientation.horizontal);
      final double finalY2 = self.y2.resolve(context, SvgOrientation.vertical);

      return Success<PaintCommand>(
        DefineLinearGradient(
          id: gradId,
          x1: finalX1,
          y1: finalY1,
          x2: finalX2,
          y2: finalY2,
          stops: stops.toPaintingStops(context),
          transformAttributes: gradientTransformAttributes,
        ),
      );
    } else if (self is SvgRadialGradient) {
      final double finalCx = self.cx.resolve(context, SvgOrientation.horizontal);
      final double finalCy = self.cy.resolve(context, SvgOrientation.vertical);
      final double finalR = self.r.resolve(context, SvgOrientation.normalized);
      final double finalFx = self.fx.resolve(context, SvgOrientation.horizontal);
      final double finalFy = self.fy.resolve(context, SvgOrientation.vertical);
      final double finalFr = self.fr.resolve(context, SvgOrientation.normalized);

      return Success<PaintCommand>(
        DefineRadialGradient(
          id: gradId,
          cx: finalCx,
          cy: finalCy,
          radius: finalR,
          fx: finalFx,
          fy: finalFy,
          focalRadius: finalFr,
          stops: stops.toPaintingStops(context),
          transformAttributes: gradientTransformAttributes,
        ),
      );
    }

    // coverage:ignore-start
    return Failure<PaintCommand>('Unsupported gradient type: ${self.runtimeType}');
    // coverage:ignore-end
  }
}

extension on List<SvgStop> {
  List<GradientStop> toPaintingStops(SvgPaintingContext context) {
    return map((SvgStop stop) {
      final double offset = stop.offset.resolve(context, SvgOrientation.unit);
      final double opacity = stop.stopOpacity.resolve(context, SvgOrientation.unit);

      return GradientStop(offset: offset, colorArgb: stop.stopColor.toFillArgb(), opacity: opacity);
    }).toList();
  }
}
