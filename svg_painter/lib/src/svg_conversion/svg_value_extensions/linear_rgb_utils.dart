import 'dart:math' as math;

import '../../painting_model/paint_command.dart';

/// Converts an sRGB channel value [c] in range [0.0, 1.0] to linear RGB.
///
/// Follows the standard IEC 61966-2-1 and SVG 1.1 §11.7.4 conversion formula.
double sRgbToLinear(double c) {
  if (c <= 0.04045) {
    return c / 12.92;
  } else {
    return math.pow((c + 0.055) / 1.055, 2.4).toDouble();
  }
}

/// Converts a linear RGB channel value [c] in range [0.0, 1.0] to sRGB.
///
/// Follows the standard IEC 61966-2-1 and SVG 1.1 §11.7.4 conversion formula.
double linearToSRgb(double c) {
  final double clamped = c.clamp(0.0, 1.0);
  if (clamped <= 0.0031308) {
    return (12.92 * clamped).clamp(0.0, 1.0);
  } else {
    return (1.055 * math.pow(clamped, 1.0 / 2.4) - 0.055).clamp(0.0, 1.0);
  }
}

/// Resamples gradient stops by interpolating colors in the linear RGB color space.
///
/// In linear RGB interpolation, color channels are converted from sRGB to linear
/// photometric space, interpolated linearly, and then mapped back to sRGB.
/// This matches the SVG 1.1 `color-interpolation="linearRGB"` specification.
List<GradientStop> interpolateLinearRgbStops(
  List<GradientStop> stops, {
  int stepsPerSegment = 16,
}) {
  if (stops.length < 2) {
    return stops;
  }

  final result = <GradientStop>[stops.first];

  for (var j = 0; j < stops.length - 1; j++) {
    final GradientStop start = stops[j];
    final GradientStop end = stops[j + 1];

    if (end.offset <= start.offset) {
      result.add(end);
      continue;
    }

    final double startR = ((start.colorArgb >> 16) & 0xFF) / 255.0;
    final double startG = ((start.colorArgb >> 8) & 0xFF) / 255.0;
    final double startB = (start.colorArgb & 0xFF) / 255.0;

    final double endR = ((end.colorArgb >> 16) & 0xFF) / 255.0;
    final double endG = ((end.colorArgb >> 8) & 0xFF) / 255.0;
    final double endB = (end.colorArgb & 0xFF) / 255.0;

    final double startRlin = sRgbToLinear(startR);
    final double startGlin = sRgbToLinear(startG);
    final double startBlin = sRgbToLinear(startB);

    final double endRlin = sRgbToLinear(endR);
    final double endGlin = sRgbToLinear(endG);
    final double endBlin = sRgbToLinear(endB);

    for (var step = 1; step <= stepsPerSegment; step++) {
      if (step == stepsPerSegment) {
        result.add(end);
      } else {
        final double t = step / stepsPerSegment;
        final double offset = start.offset + t * (end.offset - start.offset);

        final double rLin = (1.0 - t) * startRlin + t * endRlin;
        final double gLin = (1.0 - t) * startGlin + t * endGlin;
        final double bLin = (1.0 - t) * startBlin + t * endBlin;
        final double opacity = (1.0 - t) * start.opacity + t * end.opacity;

        final int rSrgb = (linearToSRgb(rLin) * 255.0).round().clamp(0, 255);
        final int gSrgb = (linearToSRgb(gLin) * 255.0).round().clamp(0, 255);
        final int bSrgb = (linearToSRgb(bLin) * 255.0).round().clamp(0, 255);

        final int colorArgb = 0xFF000000 | (rSrgb << 16) | (gSrgb << 8) | bSrgb;

        result.add(
          GradientStop(
            offset: offset,
            colorArgb: colorArgb,
            opacity: opacity,
          ),
        );
      }
    }
  }

  return result;
}
