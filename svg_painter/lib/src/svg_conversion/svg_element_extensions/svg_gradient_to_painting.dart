import 'dart:math' as math;

import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../../xml_conversion/string_extensions/to_svg_color.dart';
import '../../xml_conversion/string_extensions/to_svg_length_percentage.dart';
import '../converters/svg_paint_resolver.dart';
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

    final chain = <SvgGradient>[self];
    final visited = <String>{gradId};

    String? currentHref = href;
    while (currentHref != null && currentHref.isNotEmpty) {
      final String targetId = currentHref.startsWith('#')
          ? currentHref.substring(1)
          : currentHref;
      if (visited.contains(targetId)) {
        break;
      }
      visited.add(targetId);
      final SvgElement? target = context.definitions[targetId];
      if (target is SvgGradient) {
        chain.add(target);
        currentHref = target.href;
      } else {
        break;
      }
    }

    SvgGradientUnits resolvedUnits = SvgGradientUnits.objectBoundingBox;
    for (final grad in chain) {
      final SvgGradientUnits? u = grad.gradientUnits;
      if (u != null) {
        resolvedUnits = u;
        break;
      }
    }

    SvgSpreadMethod resolvedSpread = SvgSpreadMethod.pad;
    for (final grad in chain) {
      final SvgSpreadMethod? s = grad.spreadMethod;
      if (s != null) {
        resolvedSpread = s;
        break;
      }
    }

    SvgTransformAttributes? resolvedTransform;
    for (final grad in chain) {
      final SvgTransformAttributes? t = grad.gradientTransformAttributes;
      if (t != null) {
        resolvedTransform = t;
        break;
      }
    }

    var resolvedStops = const <SvgStop>[];
    SvgColor? stopsColor;
    for (final grad in chain) {
      if (grad.stops.isNotEmpty) {
        resolvedStops = grad.stops;
        stopsColor = grad.color ?? self.color;
        break;
      }
    }

    final PaintingGradientUnits paintingUnits = switch (resolvedUnits) {
      SvgGradientUnits.objectBoundingBox => PaintingGradientUnits.objectBoundingBox,
      SvgGradientUnits.userSpaceOnUse => PaintingGradientUnits.userSpaceOnUse,
    };

    final PaintingSpreadMethod paintingSpread = switch (resolvedSpread) {
      SvgSpreadMethod.pad => PaintingSpreadMethod.pad,
      SvgSpreadMethod.reflect => PaintingSpreadMethod.reflect,
      SvgSpreadMethod.repeat => PaintingSpreadMethod.repeat,
    };

    final isUserUnits = resolvedUnits == SvgGradientUnits.userSpaceOnUse;
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
      SvgLengthPercentage? x1;
      SvgLengthPercentage? y1;
      SvgLengthPercentage? x2;
      SvgLengthPercentage? y2;

      for (final grad in chain) {
        if (grad is SvgLinearGradient) {
          x1 ??= grad.x1;
          y1 ??= grad.y1;
          x2 ??= grad.x2;
          y2 ??= grad.y2;
        }
      }

      final SvgLengthPercentage finalX1 = x1 ?? const SvgPercentage(0);
      final SvgLengthPercentage finalY1 = y1 ?? const SvgPercentage(0);
      final SvgLengthPercentage finalX2 = x2 ?? const SvgPercentage(100);
      final SvgLengthPercentage finalY2 = y2 ?? const SvgPercentage(0);

      double resolvedX1 = resolveCoord(finalX1, xOrient);
      double resolvedY1 = resolveCoord(finalY1, yOrient);
      double resolvedX2 = resolveCoord(finalX2, xOrient);
      double resolvedY2 = resolveCoord(finalY2, yOrient);

      if (isUserUnits) {
        // Normalize absolute user units to 0..1 relative to viewBox.
        resolvedX1 /= context.viewBoxWidth;
        resolvedY1 /= context.viewBoxHeight;
        resolvedX2 /= context.viewBoxWidth;
        resolvedY2 /= context.viewBoxHeight;
      }

      return Success<PaintCommand>(
        DefineLinearGradient(
          id: gradId,
          x1: resolvedX1,
          y1: resolvedY1,
          x2: resolvedX2,
          y2: resolvedY2,
          stops: resolvedStops.toPaintingStops(context, gradientColor: stopsColor),
          transformAttributes: resolvedTransform,
          units: paintingUnits,
          spreadMethod: paintingSpread,
        ),
      );
    } else if (self is SvgRadialGradient) {
      SvgLengthPercentage? cx;
      SvgLengthPercentage? cy;
      SvgLengthPercentage? r;
      SvgLengthPercentage? fx;
      SvgLengthPercentage? fy;
      SvgLengthPercentage? fr;

      for (final grad in chain) {
        if (grad is SvgRadialGradient) {
          cx ??= grad.cx;
          cy ??= grad.cy;
          r ??= grad.r;
          fx ??= grad.fx;
          fy ??= grad.fy;
          fr ??= grad.fr;
        }
      }

      final SvgLengthPercentage finalCx = cx ?? const SvgPercentage(50);
      final SvgLengthPercentage finalCy = cy ?? const SvgPercentage(50);
      final SvgLengthPercentage finalR = r ?? const SvgPercentage(50);
      final SvgLengthPercentage finalFx = fx ?? finalCx;
      final SvgLengthPercentage finalFy = fy ?? finalCy;
      final SvgLengthPercentage finalFr = fr ?? const SvgPercentage(0);

      double resolvedCx = resolveCoord(finalCx, xOrient);
      double resolvedCy = resolveCoord(finalCy, yOrient);
      double resolvedR = resolveCoord(finalR, rOrient);
      double resolvedFx = resolveCoord(finalFx, xOrient);
      double resolvedFy = resolveCoord(finalFy, yOrient);
      double resolvedFr = resolveCoord(finalFr, rOrient);

      if (isUserUnits) {
        // Normalize absolute user units to 0..1 relative to viewBox.
        resolvedCx /= context.viewBoxWidth;
        resolvedCy /= context.viewBoxHeight;
        final double shortestSide = math.min(context.viewBoxWidth, context.viewBoxHeight);
        resolvedR /= shortestSide;
        resolvedFx /= context.viewBoxWidth;
        resolvedFy /= context.viewBoxHeight;
        resolvedFr /= shortestSide;
      }

      return Success<PaintCommand>(
        DefineRadialGradient(
          id: gradId,
          cx: resolvedCx,
          cy: resolvedCy,
          radius: resolvedR,
          fx: resolvedFx,
          fy: resolvedFy,
          focalRadius: resolvedFr,
          stops: resolvedStops.toPaintingStops(context, gradientColor: stopsColor),
          transformAttributes: resolvedTransform,
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
  List<GradientStop> toPaintingStops(
    SvgPaintingContext context, {
    SvgColor? gradientColor,
  }) {
    return map((SvgStop stop) {
      final Map<String, String> resolvedRules = resolveCssRules(
        context,
        'stop',
        stop.coreAttributes,
      );

      final SvgColor? cssStopColor = resolvedRules['stop-color']?.toSvgColor();
      final SvgLengthPercentage? cssStopOpacity =
          resolvedRules['stop-opacity']?.toSvgLengthPercentage();
      final SvgColor? cssColor = resolvedRules['color']?.toSvgColor();

      final SvgColor resolvedStopColor =
          cssStopColor ?? stop.stopColor ?? const SvgNamedColor(SvgColorName.black);
      final SvgLengthPercentage resolvedStopOpacity =
          cssStopOpacity ?? stop.stopOpacity ?? const SvgLength(1.0);

      final double offset = stop.offset.resolve(context, SvgOrientation.unit);
      final double opacity = resolvedStopOpacity.resolveOpacity(context);

      final SvgColor effectiveColor = switch (resolvedStopColor) {
        final SvgCurrentColor _ =>
          cssColor ??
              stop.color ??
              gradientColor ??
              context.inheritedAttributes.color ??
              const SvgNamedColor(SvgColorName.black),
        final SvgColor c => c,
      };

      return GradientStop(
        offset: offset,
        colorArgb: effectiveColor.toFillArgb(),
        opacity: opacity,
      );
    }).toList();
  }
}
