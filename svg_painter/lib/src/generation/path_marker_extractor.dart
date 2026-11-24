import 'dart:math' as math;

import '../painting_model/_painting_model.dart';

/// Represents a vertex along a shape where a marker should be placed.
class MarkerVertex {
  const MarkerVertex({
    required this.x,
    required this.y,
    required this.angle,
    required this.isStart,
    required this.isEnd,
  });

  /// The x-coordinate of the vertex in user space.
  final double x;

  /// The y-coordinate of the vertex in user space.
  final double y;

  /// The orientation angle in radians.
  final double angle;

  /// Whether this is the starting vertex of the shape/subpath.
  final bool isStart;

  /// Whether this is the ending vertex of the shape/subpath.
  final bool isEnd;

  @override
  String toString() => 'MarkerVertex(($x, $y), angle: $angle, isStart: $isStart, isEnd: $isEnd)';
}

/// Helper to extract marker placement vertices and angles from shapes and path operations.
class PathMarkerExtractor {
  const PathMarkerExtractor._();

  /// Extracts vertices and orientation angles for a straight line.
  static List<MarkerVertex> extractFromLine(
    double x1,
    double y1,
    double x2,
    double y2,
  ) {
    final double angle = math.atan2(y2 - y1, x2 - x1);
    return <MarkerVertex>[
      MarkerVertex(x: x1, y: y1, angle: angle, isStart: true, isEnd: false),
      MarkerVertex(x: x2, y: y2, angle: angle, isStart: false, isEnd: true),
    ];
  }

  /// Extracts vertices and orientation angles for a list of point coordinates (polyline/polygon).
  static List<MarkerVertex> extractFromPoints(
    List<double> points, {
    bool isClosed = false,
  }) {
    if (points.length < 4) {
      return const <MarkerVertex>[];
    }

    final int count = points.length ~/ 2;
    final vertices = <MarkerVertex>[];

    // Compute segment angles
    final segmentAngles = <double>[];
    for (var i = 0; i < count - 1; i++) {
      final double dx = points[2 * (i + 1)] - points[2 * i];
      final double dy = points[2 * (i + 1) + 1] - points[2 * i + 1];
      segmentAngles.add(math.atan2(dy, dx));
    }
    if (isClosed && count > 2) {
      final double dx = points[0] - points[2 * (count - 1)];
      final double dy = points[1] - points[2 * (count - 1) + 1];
      segmentAngles.add(math.atan2(dy, dx));
    }

    for (var i = 0; i < count; i++) {
      final double vx = points[2 * i];
      final double vy = points[2 * i + 1];

      if (i == 0) {
        if (isClosed && segmentAngles.length == count) {
          final double incoming = segmentAngles.last;
          final double outgoing = segmentAngles.first;
          final double angle = _computeBisector(incoming, outgoing);
          vertices.add(MarkerVertex(x: vx, y: vy, angle: angle, isStart: true, isEnd: false));
        } else {
          final double angle = segmentAngles.first;
          vertices.add(MarkerVertex(x: vx, y: vy, angle: angle, isStart: true, isEnd: false));
        }
      } else if (i == count - 1) {
        if (isClosed && segmentAngles.length == count) {
          final double incoming = segmentAngles[i - 1];
          final double outgoing = segmentAngles.last;
          final double angle = _computeBisector(incoming, outgoing);
          vertices.add(MarkerVertex(x: vx, y: vy, angle: angle, isStart: false, isEnd: true));
        } else {
          final double angle = segmentAngles.last;
          vertices.add(MarkerVertex(x: vx, y: vy, angle: angle, isStart: false, isEnd: true));
        }
      } else {
        final double incoming = segmentAngles[i - 1];
        final double outgoing = segmentAngles[i];
        final double angle = _computeBisector(incoming, outgoing);
        vertices.add(MarkerVertex(x: vx, y: vy, angle: angle, isStart: false, isEnd: false));
      }
    }

    return vertices;
  }

  /// Extracts vertices and orientation angles from a list of [PathOperation]s.
  static List<MarkerVertex> extractFromOperations(List<PathOperation> operations) {
    if (operations.isEmpty) {
      return const <MarkerVertex>[];
    }

    // Deconstruct operations into segments: each segment has start point, end point,
    // incoming tangent vector at end, and outgoing tangent vector at start.
    final points = <_PathSegmentPoint>[];
    var currentX = 0.0;
    var currentY = 0.0;
    var startX = 0.0;
    var startY = 0.0;

    for (final op in operations) {
      switch (op) {
        case MoveTo(:final double x, :final double y):
          currentX = x;
          currentY = y;
          startX = x;
          startY = y;
          points.add(_PathSegmentPoint(x: x, y: y, isMoveTo: true));

        case LineTo(:final double x, :final double y):
          final double dx = x - currentX;
          final double dy = y - currentY;
          final double angle = math.atan2(dy, dx);
          points.add(
            _PathSegmentPoint(
              x: x,
              y: y,
              incomingAngle: angle,
              outgoingAngleBefore: angle,
            ),
          );
          currentX = x;
          currentY = y;

        case CubicTo(
          :final double x1,
          :final double y1,
          :final double x2,
          :final double y2,
          :final double x3,
          :final double y3,
        ):
          // Outgoing tangent from current point
          final double outDx = (x1 != currentX || y1 != currentY)
              ? (x1 - currentX)
              : (x2 != currentX || y2 != currentY ? (x2 - currentX) : (x3 - currentX));
          final double outDy = (x1 != currentX || y1 != currentY)
              ? (y1 - currentY)
              : (x2 != currentX || y2 != currentY ? (y2 - currentY) : (y3 - currentY));
          final double outAngle = math.atan2(outDy, outDx);

          // Incoming tangent at endpoint
          final double inDx = (x3 != x2 || y3 != y2)
              ? (x3 - x2)
              : (x3 != x1 || y3 != y1 ? (x3 - x1) : (x3 - currentX));
          final double inDy = (x3 != x2 || y3 != y2)
              ? (y3 - y2)
              : (x3 != x1 || y3 != y1 ? (y3 - y1) : (y3 - currentY));
          final double inAngle = math.atan2(inDy, inDx);

          points.add(
            _PathSegmentPoint(
              x: x3,
              y: y3,
              incomingAngle: inAngle,
              outgoingAngleBefore: outAngle,
            ),
          );
          currentX = x3;
          currentY = y3;

        case QuadraticTo(
          :final double x1,
          :final double y1,
          :final double x2,
          :final double y2,
        ):
          final double outDx = (x1 != currentX || y1 != currentY)
              ? (x1 - currentX)
              : (x2 - currentX);
          final double outDy = (x1 != currentX || y1 != currentY)
              ? (y1 - currentY)
              : (y2 - currentY);
          final double outAngle = math.atan2(outDy, outDx);

          final double inDx = (x2 != x1 || y2 != y1) ? (x2 - x1) : (x2 - currentX);
          final double inDy = (x2 != x1 || y2 != y1) ? (y2 - y1) : (y2 - currentY);
          final double inAngle = math.atan2(inDy, inDx);

          points.add(
            _PathSegmentPoint(
              x: x2,
              y: y2,
              incomingAngle: inAngle,
              outgoingAngleBefore: outAngle,
            ),
          );
          currentX = x2;
          currentY = y2;

        case ArcTo(:final double x, :final double y):
          final double dx = x - currentX;
          final double dy = y - currentY;
          final double angle = math.atan2(dy, dx);
          points.add(
            _PathSegmentPoint(
              x: x,
              y: y,
              incomingAngle: angle,
              outgoingAngleBefore: angle,
            ),
          );
          currentX = x;
          currentY = y;

        case ClosePath():
          if (currentX != startX || currentY != startY) {
            final double dx = startX - currentX;
            final double dy = startY - currentY;
            final double angle = math.atan2(dy, dx);
            points.add(
              _PathSegmentPoint(
                x: startX,
                y: startY,
                incomingAngle: angle,
                outgoingAngleBefore: angle,
                isClose: true,
              ),
            );
            currentX = startX;
            currentY = startY;
          }
      }
    }

    if (points.length < 2) {
      return const <MarkerVertex>[];
    }

    final vertices = <MarkerVertex>[];
    final int count = points.length;

    for (var i = 0; i < count; i++) {
      final _PathSegmentPoint p = points[i];
      final isFirst = i == 0;
      final isLast = i == count - 1;

      if (isFirst) {
        // Start vertex of first subpath
        final double nextOutAngle = (i + 1 < count)
            ? (points[i + 1].outgoingAngleBefore ?? 0.0)
            : 0.0;
        vertices.add(
          MarkerVertex(x: p.x, y: p.y, angle: nextOutAngle, isStart: true, isEnd: false),
        );
      } else if (isLast) {
        // End vertex of last subpath
        final double inAngle = p.incomingAngle ?? 0.0;
        vertices.add(MarkerVertex(x: p.x, y: p.y, angle: inAngle, isStart: false, isEnd: true));
      } else {
        // Intermediate vertex
        final double incoming = p.incomingAngle ?? 0.0;
        final double outgoing = (i + 1 < count)
            ? (points[i + 1].outgoingAngleBefore ?? 0.0)
            : incoming;
        final double angle = _computeBisector(incoming, outgoing);
        vertices.add(MarkerVertex(x: p.x, y: p.y, angle: angle, isStart: false, isEnd: false));
      }
    }

    return vertices;
  }

  static double _computeBisector(double incomingAngle, double outgoingAngle) {
    final double sinSum = math.sin(incomingAngle) + math.sin(outgoingAngle);
    final double cosSum = math.cos(incomingAngle) + math.cos(outgoingAngle);
    if (sinSum.abs() < 1e-9 && cosSum.abs() < 1e-9) {
      // Opposite directions
      return incomingAngle + math.pi / 2.0;
    }
    return math.atan2(sinSum, cosSum);
  }
}

class _PathSegmentPoint {
  const _PathSegmentPoint({
    required this.x,
    required this.y,
    this.incomingAngle,
    this.outgoingAngleBefore,
    this.isMoveTo = false,
    this.isClose = false,
  });

  final double x;
  final double y;
  final double? incomingAngle;
  final double? outgoingAngleBefore;
  final bool isMoveTo;
  final bool isClose;
}
