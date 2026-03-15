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
      double finalX1 = self.x1.resolve(context, SvgOrientation.unit);
      double finalY1 = self.y1.resolve(context, SvgOrientation.unit);
      double finalX2 = self.x2.resolve(context, SvgOrientation.unit);
      double finalY2 = self.y2.resolve(context, SvgOrientation.unit);

      // Simple Bake for rotate(90): horizontal becomes vertical
      final SvgTransformAttributes? trans = gradientTransformAttributes;
      if (trans != null &&
          trans.operations.length == 1 &&
          trans.operations.first is SvgRotate) {
        final SvgRotate rotate = trans.operations.first as SvgRotate;
        if (rotate.angle == 90 || rotate.angle == -270) {
          // rotate(90) about (0,0) maps (x,y) -> (-y, x)
          // For a standard 0,0 -> 1,0 horizontal gradient, this becomes 0,0 -> 0,1
          final double oldX1 = finalX1;
          final double oldX2 = finalX2;
          final double oldY1 = finalY1;
          final double oldY2 = finalY2;

          finalX1 = -oldY1;
          finalY1 = oldX1;
          finalX2 = -oldY2;
          finalY2 = oldX2;

          // Adjust back to 0..1 range if it was a simple horizontal-to-vertical flip
          if (finalX1 < 0 || finalX2 < 0) {
            finalX1 += 1.0;
            finalX2 += 1.0;
          }
        }
      }

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
      final double finalCx = self.cx.resolve(context, SvgOrientation.unit);
      final double finalCy = self.cy.resolve(context, SvgOrientation.unit);
      final double finalR = self.r.resolve(context, SvgOrientation.unit);
      final double finalFx = self.fx.resolve(context, SvgOrientation.unit);
      final double finalFy = self.fy.resolve(context, SvgOrientation.unit);
      final double finalFr = self.fr.resolve(context, SvgOrientation.unit);

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
