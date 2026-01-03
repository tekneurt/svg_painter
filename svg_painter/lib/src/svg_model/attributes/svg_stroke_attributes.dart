import 'package:meta/meta.dart';

import '../svg_value.dart';

/// Represents the grouped stroke attributes of an SVG element.
@immutable
class SvgStrokeAttributes {
  const SvgStrokeAttributes({
    this.color,
    this.opacity,
    this.width,
    this.dashArray,
    this.linecap,
    this.linejoin,
  });

  /// The stroke color (mapped from `stroke` attribute).
  final SvgColor? color;

  /// The opacity of the stroke (mapped from `stroke-opacity` attribute).
  final SvgLengthPercentage? opacity;

  /// The width of the stroke (mapped from `stroke-width` attribute).
  final SvgLengthPercentage? width;

  /// The dash pattern for the stroke (mapped from `stroke-dasharray` attribute).
  final SvgPointList? dashArray;

  /// The shape to be used at the end of open subpaths (mapped from `stroke-linecap` attribute).
  final SvgStrokeLinecap? linecap;

  /// The shape to be used at the corners of paths (mapped from `stroke-linejoin` attribute).
  final SvgStrokeLinejoin? linejoin;

  @override
  String toString() {
    return 'SvgStrokeAttributes(color: $color, opacity: $opacity, width: $width, dashArray: $dashArray, linecap: $linecap, linejoin: $linejoin)';
  }
}
