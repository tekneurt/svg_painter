part of '../paint_command.dart';

/// Command to draw a path.
final class DrawPath extends DrawCommand {
  const DrawPath({required this.operations, required this.style, super.id});

  /// The operations that define the path.
  final List<PathOperation> operations;

  /// The visual style of the path.
  @override
  final PaintingStyle style;

  @override
  String toString() => 'DrawPath(ops: ${operations.length}, style: $style, id: $id)';
}

/// Base class for path operations.
sealed class PathOperation {
  const PathOperation();
}

/// Move to a specific point (M/m).
final class MoveTo extends PathOperation {
  const MoveTo(this.x, this.y);
  final double x;
  final double y;

  @override
  String toString() => 'MoveTo($x, $y)';
}

/// Line to a specific point (L/l, H/h, V/v).
final class LineTo extends PathOperation {
  const LineTo(this.x, this.y);
  final double x;
  final double y;

  @override
  String toString() => 'LineTo($x, $y)';
}

/// Cubic bezier curve (C/c, S/s).
final class CubicTo extends PathOperation {
  const CubicTo(this.x1, this.y1, this.x2, this.y2, this.x3, this.y3);
  final double x1;
  final double y1;
  final double x2;
  final double y2;
  final double x3;
  final double y3;

  @override
  String toString() => 'CubicTo(($x1, $y1), ($x2, $y2), ($x3, $y3))';
}

/// Quadratic bezier curve (Q/q, T/t).
final class QuadraticTo extends PathOperation {
  const QuadraticTo(this.x1, this.y1, this.x2, this.y2);
  final double x1;
  final double y1;
  final double x2;
  final double y2;

  @override
  String toString() => 'QuadraticTo(($x1, $y1), ($x2, $y2))';
}

/// Arc to (A/a).
final class ArcTo extends PathOperation {
  const ArcTo(
    this.rx,
    this.ry,
    this.xAxisRotation,
    this.largeArcFlag,
    this.sweepFlag,
    this.x,
    this.y,
  );
  final double rx;
  final double ry;
  final double xAxisRotation;
  final bool largeArcFlag;
  final bool sweepFlag;
  final double x;
  final double y;

  @override
  String toString() =>
      'ArcTo(rx: $rx, ry: $ry, rot: $xAxisRotation, large: $largeArcFlag, sweep: $sweepFlag, to: ($x, $y))';
}

/// Close path (Z/z).
final class ClosePath extends PathOperation {
  const ClosePath();

  @override
  String toString() => 'ClosePath()';
}
