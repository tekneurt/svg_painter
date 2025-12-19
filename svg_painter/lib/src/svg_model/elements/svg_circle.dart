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
  final double cx;

  /// The y-coordinate of the center of the circle.
  final double cy;

  /// The radius of the circle.
  final double r;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SvgCircle &&
          runtimeType == other.runtimeType &&
          cx == other.cx &&
          cy == other.cy &&
          r == other.r);

  @override
  int get hashCode => Object.hash(cx, cy, r);

  @override
  String toString() => 'SvgCircle(cx: $cx, cy: $cy, r: $r)';
}
