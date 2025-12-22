part of '../svg_value.dart';

/// Represents a list of points for polyline and polygon elements.
@immutable
final class SvgPointList extends SvgValue with SvgBaseValue {
  const SvgPointList(this.points);

  /// The list of x,y coordinate pairs.
  final List<double> points;

  @override
  String toString() => 'SvgPointList($points)';
}
