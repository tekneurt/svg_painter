import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';
import '../svg_value_extensions/_svg_value_extensions.dart';

/// Extension to convert [SvgGradient] to a [PaintCommand].
extension SvgGradientToPainting on SvgGradient {
  /// Converts this [SvgGradient] to a [PaintCommand].
  Result<PaintCommand> toPaintCommand(SvgPaintingContext context) {
    final self = this;
    final String? gradId = id;
    if (gradId == null) {
      return const Failure<PaintCommand>('Gradient element must have an ID to be referenced.');
    }

    final PaintingGradientUnits paintingUnits = switch (gradientUnits) {
      SvgGradientUnits.objectBoundingBox => PaintingGradientUnits.objectBoundingBox,
      SvgGradientUnits.userSpaceOnUse => PaintingGradientUnits.userSpaceOnUse,
    };

    final PaintingSpreadMethod paintingSpread = switch (spreadMethod) {
      SvgSpreadMethod.pad => PaintingSpreadMethod.pad,
      SvgSpreadMethod.reflect => PaintingSpreadMethod.reflect,
      SvgSpreadMethod.repeat => PaintingSpreadMethod.repeat,
    };

    final isUserUnits = gradientUnits == SvgGradientUnits.userSpaceOnUse;
    final SvgOrientation xOrient = isUserUnits ? .horizontal : .unit;
    final SvgOrientation yOrient = isUserUnits ? .vertical : .unit;
    final SvgOrientation rOrient = isUserUnits ? .normalized : .unit;

    double resolveCoord(SvgLengthPercentage lp, SvgOrientation orient) {
      if (isUserUnits) {
        return lp.resolve(context, orient);
      } else {
        if (lp is SvgLength) {
          if (lp.unit == SvgLengthUnit.none || lp.unit == SvgLengthUnit.px) {
            return lp.value;
          } else {
            return lp.toDouble(context);
          }
        } else {
          return lp.resolve(context, orient);
        }
      }
    }

    if (self is SvgLinearGradient) {
      double x1 = resolveCoord(self.x1, xOrient);
      double y1 = resolveCoord(self.y1, yOrient);
      double x2 = resolveCoord(self.x2, xOrient);
      double y2 = resolveCoord(self.y2, yOrient);

      if (isUserUnits) {
        // Normalize absolute user units to 0..1 relative to viewBox.
        x1 /= context.viewBoxWidth;
        y1 /= context.viewBoxHeight;
        x2 /= context.viewBoxWidth;
        y2 /= context.viewBoxHeight;
      }

      return Success<PaintCommand>(
        DefineLinearGradient(
          id: gradId,
          x1: x1,
          y1: y1,
          x2: x2,
          y2: y2,
          stops: stops.toPaintingStops(context),
          transformAttributes: gradientTransformAttributes,
          units: paintingUnits,
          spreadMethod: paintingSpread,
        ),
      );
    } else if (self is SvgRadialGradient) {
      double cx = resolveCoord(self.cx, xOrient);
      double cy = resolveCoord(self.cy, yOrient);
      double r = resolveCoord(self.r, rOrient);
      double fx = resolveCoord(self.fx, xOrient);
      double fy = resolveCoord(self.fy, yOrient);
      double fr = resolveCoord(self.fr, rOrient);

      if (isUserUnits) {
        // Normalize absolute user units to 0..1 relative to viewBox.
        cx /= context.viewBoxWidth;
        cy /= context.viewBoxHeight;
        // Radius resolution for radial gradients relative to a non-square viewBox is complex.
        // For now we use the normalized diagonal factor which matches our radial resolution logic.
        final double diag = context.viewBoxNormalizedDiagonal;
        r /= diag;
        fx /= context.viewBoxWidth;
        fy /= context.viewBoxHeight;
        fr /= diag;
      }

      return Success<PaintCommand>(
        DefineRadialGradient(
          id: gradId,
          cx: cx,
          cy: cy,
          radius: r,
          fx: fx,
          fy: fy,
          focalRadius: fr,
          stops: stops.toPaintingStops(context),
          transformAttributes: gradientTransformAttributes,
          units: paintingUnits,
          spreadMethod: paintingSpread,
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
