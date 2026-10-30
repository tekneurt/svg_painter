part of '../paint_command.dart';

/// A command to define an SVG filter effect.
@immutable
final class DefineFilter extends DefineCommand {
  const DefineFilter({
    required super.id,
    required this.primitives,
    this.x,
    this.y,
    this.width,
    this.height,
  });

  /// The list of filter primitives that make up this filter.
  final List<SvgFilterPrimitive> primitives;

  /// The x-axis coordinate of the filter region.
  final SvgLengthPercentageAuto? x;

  /// The y-axis coordinate of the filter region.
  final SvgLengthPercentageAuto? y;

  /// The width of the filter region.
  final SvgLengthPercentageAuto? width;

  /// The height of the filter region.
  final SvgLengthPercentageAuto? height;

  @override
  String toString() => 'DefineFilter(id: $id, primitives: ${primitives.length})';
}
