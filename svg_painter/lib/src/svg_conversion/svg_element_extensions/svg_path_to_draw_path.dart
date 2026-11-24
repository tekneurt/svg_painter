import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/_converters.dart';

/// Extension to convert [SvgPath] to [PaintCommand]s.
extension SvgPathToPaintCommands on SvgPath {
  /// Converts this [SvgPath] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands(SvgPaintingContext context) {
    if (d.isEmpty) {
      return const Success<List<PaintCommand>>(<PaintCommand>[]);
    }

    final PaintingStyle paint = resolvePaint(
      context,
      tagName: 'path',
      coreAttributes: coreAttributes,
      presentationAttributes: presentationAttributes,
      geometryAttributes: geometryAttributes,
    );

    return PathDataParser.parse(d, context).fold(
      (Failure<List<PathOperation>> failure) {
        return const Success<List<PaintCommand>>(<PaintCommand>[]);
      },
      (List<PathOperation> ops) {
        final PaintingStrokeStyle? stroke = paint.stroke;
        final PaintingStyle effectivePaint;
        if (_hasZeroBoundingBox(ops) &&
            stroke?.shaderUnits == PaintingGradientUnits.objectBoundingBox) {
          if (stroke?.colorArgb != null) {
            effectivePaint = PaintingStyle(
              fill: paint.fill,
              stroke: PaintingStrokeStyle(
                colorArgb: stroke!.colorArgb,
                width: stroke.width,
                pathLength: stroke.pathLength,
                opacity: stroke.opacity,
                cap: stroke.cap,
                join: stroke.join,
                miterLimit: stroke.miterLimit,
                dashArray: stroke.dashArray,
                dashOffset: stroke.dashOffset,
                isExplicit: stroke.isExplicit,
                isCurrentColor: stroke.isCurrentColor,
                isContextFill: stroke.isContextFill,
                isContextStroke: stroke.isContextStroke,
              ),
              text: paint.text,
              groupOpacity: paint.groupOpacity,
              transformAttributes: paint.transformAttributes,
              clipRect: paint.clipRect,
              maskId: paint.maskId,
              clipPathId: paint.clipPathId,
              filterId: paint.filterId,
              markerStartId: paint.markerStartId,
              markerMidId: paint.markerMidId,
              markerEndId: paint.markerEndId,
              paintOrder: paint.paintOrder,
              vectorEffect: paint.vectorEffect,
              strokeWidth: paint.strokeWidth,
            );
          } else {
            // SVG 1.1 §7.11 & §13.2.2: Zero-dimension bounding box without fallback must not be painted.
            return const Success<List<PaintCommand>>(<PaintCommand>[]);
          }
        } else {
          effectivePaint = paint;
        }

        return Success<List<PaintCommand>>(<PaintCommand>[
          DrawPath(operations: ops, style: effectivePaint, id: id),
        ]);
      },
    );
  }
}

bool _hasZeroBoundingBox(List<PathOperation> ops) {
  if (ops.isEmpty) {
    return true;
  }
  double? minX;
  double? maxX;
  double? minY;
  double? maxY;

  void updateX(double x) {
    if (minX == null || x < minX!) {
      minX = x;
    }
    if (maxX == null || x > maxX!) {
      maxX = x;
    }
  }

  void updateY(double y) {
    if (minY == null || y < minY!) {
      minY = y;
    }
    if (maxY == null || y > maxY!) {
      maxY = y;
    }
  }

  for (final op in ops) {
    switch (op) {
      case MoveTo(:final double x, :final double y):
      case LineTo(:final double x, :final double y):
        updateX(x);
        updateY(y);
      case CubicTo(
        :final double x1,
        :final double y1,
        :final double x2,
        :final double y2,
        :final double x3,
        :final double y3,
      ):
        updateX(x1);
        updateX(x2);
        updateX(x3);
        updateY(y1);
        updateY(y2);
        updateY(y3);
      case QuadraticTo(:final double x1, :final double y1, :final double x2, :final double y2):
        updateX(x1);
        updateX(x2);
        updateY(y1);
        updateY(y2);
      case ArcTo(:final double rx, :final double ry, :final double x, :final double y):
        if (rx > 0 && ry > 0) {
          return false;
        }
        updateX(x);
        updateY(y);
      case ClosePath():
        break;
    }
  }

  if (minX == null || minY == null || maxX == null || maxY == null) {
    return true;
  }
  return minX == maxX || minY == maxY;
}
