part of '../svg_value.dart';

/// Represents the viewBox attribute of an `<svg>` element.
@immutable
final class SvgViewBox extends SvgValue {
  const SvgViewBox(this.minX, this.minY, this.width, this.height);

  final double minX;
  final double minY;
  final double width;
  final double height;

  @override
  String toString() => 'SvgViewBox($minX, $minY, $width, $height)';
}
