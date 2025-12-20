part of '../svg_element.dart';

/// Represents a <circle> element in SVG.
@immutable
final class SvgCircle extends SvgElement {
  const SvgCircle({
    required this.cx,
    required this.cy,
    required this.r,
  });

  /// The x-coordinate of the center of the circle.
  final SvgLengthPercentage cx;

  /// The y-coordinate of the center of the circle.
  final SvgLengthPercentage cy;

  /// The radius of the circle.
  final SvgLengthPercentage r;
}
