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
    this.miterLimit,
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

  /// The limit on the ratio of the miter length to the stroke-width (mapped from `stroke-miterlimit` attribute).
  final SvgNumber? miterLimit;

  @override
  String toString() {
    final parts = <String>[
      if (color != null) 'color: $color',
      if (opacity != null) 'opacity: $opacity',
      if (width != null) 'width: $width',
      if (dashArray != null) 'dashArray: $dashArray',
      if (linecap != null) 'linecap: $linecap',
      if (linejoin != null) 'linejoin: $linejoin',
      if (miterLimit != null) 'miterLimit: $miterLimit',
    ];
    return 'SvgStrokeAttributes(${parts.join(', ')})';
  }
}
