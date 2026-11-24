part of '../paint_command.dart';

/// A command to define a reusable marker.
@immutable
final class DefineMarker extends DefineCommand {
  const DefineMarker({
    required super.id,
    required this.commands,
    this.refX = 0.0,
    this.refY = 0.0,
    this.markerWidth = 3.0,
    this.markerHeight = 3.0,
    this.markerUnits = SvgMarkerUnits.strokeWidth,
    this.orient = SvgMarkerOrient.zero,
    this.viewBox,
    this.preserveAspectRatio,
    this.overflow = SvgOverflow.hidden,
  });

  /// The commands that make up the marker content.
  final List<PaintCommand> commands;

  /// The x-axis coordinate of reference point for the marker.
  final double refX;

  /// The y-axis coordinate of reference point for the marker.
  final double refY;

  /// The marker width in user units or strokeWidth units.
  final double markerWidth;

  /// The marker height in user units or strokeWidth units.
  final double markerHeight;

  /// The coordinate system for attributes markerWidth and markerHeight.
  final SvgMarkerUnits markerUnits;

  /// The orientation of the marker relative to the shape it is attached to.
  final SvgMarkerOrient orient;

  /// The viewBox defining the coordinate system for the marker's children.
  final SvgViewBox? viewBox;

  /// The preserveAspectRatio defining how the viewBox is mapped to the marker viewport.
  final SvgPreserveAspectRatio? preserveAspectRatio;

  /// Whether marker content is clipped to its viewport box.
  final SvgOverflow overflow;

  @override
  String toString() => 'DefineMarker(id: $id, commands: ${commands.length})';
}
