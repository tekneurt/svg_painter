// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradient_transform_bbox_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, unused_local_variable, deprecated_member_use_from_same_package

class GradientTransformBboxPainterWidget extends StatelessWidget {
  const GradientTransformBboxPainterWidget({
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
  });

  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width ?? 200.0, height ?? 200.0),
      painter: _$GradientTransformBboxPainter(fit: fit),
    );
  }
}

class _$GradientTransformBboxPainter extends CustomPainter {
  const _$GradientTransformBboxPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(200.0, 200.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(200.0, 200.0),
      size,
    );
    final Size sourceSize = fittedSizes.source;
    final Rect destRect = Alignment.center.inscribe(
      fittedSizes.destination,
      Offset.zero & size,
    );

    canvas.save();
    canvas.translate(destRect.left, destRect.top);
    canvas.scale(
      destRect.width / sourceSize.width,
      destRect.height / sourceSize.height,
    );

    final Gradient _grad_rotGrad = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: <Color>[const Color(0xFFFF0000), const Color(0xFF0000FF)],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp,
      transform: _SvgGradientTransform_GradientTransformBboxPainter(
        matrix: <double>[
          6.123233995736766e-17,
          1.0,
          0.0,
          0.0,
          -1.0,
          6.123233995736766e-17,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
        ],
        isObjectBoundingBox: true,
      ),
    );
    {
      final Paint paint = Paint();
      paint.shader = _grad_rotGrad.createShader(
        Rect.fromLTWH(50.0, 50.0, 100.0, 100.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(50.0, 50.0, 100.0, 100.0), paint);
    }
    canvas.restore();
  }

  void _applyOverride(Paint paint, Object? override) {
    switch (override) {
      case final Color color:
        paint.color = color;
        paint.shader = null;

      case final Shader shader:
        paint.shader = shader;

      case null || _:
        break;
    }
  }

  @override
  bool shouldRepaint(covariant _$GradientTransformBboxPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}

/// A private helper class to apply arbitrary transformations to SVG gradients.
class _SvgGradientTransform_GradientTransformBboxPainter
    extends GradientTransform {
  const _SvgGradientTransform_GradientTransformBboxPainter({
    this.matrix,
    this.isObjectBoundingBox = false,
    this.isElliptical = false,
    this.centerX = 0.5,
    this.centerY = 0.5,
    this.isLinearBoundingBox = false,
    this.x1 = 0.0,
    this.y1 = 0.0,
    this.x2 = 1.0,
    this.y2 = 0.0,
  });

  /// The 4x4 matrix storage.
  final List<double>? matrix;

  /// Whether the gradient uses objectBoundingBox units.
  final bool isObjectBoundingBox;

  /// Whether to correct the aspect ratio for elliptical gradients.
  final bool isElliptical;

  /// The normalized center X coordinate (0..1) for aspect ratio correction.
  final double centerX;

  /// The normalized center Y coordinate (0..1) for aspect ratio correction.
  final double centerY;

  /// Whether to correct the skew/aspect ratio for linear bounding box gradients.
  final bool isLinearBoundingBox;

  /// Normalized start X coordinate (0..1).
  final double x1;

  /// Normalized start Y coordinate (0..1).
  final double y1;

  /// Normalized end X coordinate (0..1).
  final double x2;

  /// Normalized end Y coordinate (0..1).
  final double y2;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    Matrix4? m;
    final matrixList = matrix;
    if (matrixList != null) {
      m = Matrix4.fromList(matrixList);
      if (isObjectBoundingBox && bounds.width > 0 && bounds.height > 0) {
        final Matrix4 toCanvas = Matrix4.identity()
          ..translateByDouble(bounds.left, bounds.top, 0.0, 1.0)
          ..scaleByDouble(bounds.width, bounds.height, 1.0, 1.0);
        final Matrix4 fromCanvas = Matrix4.identity()
          ..scaleByDouble(1.0 / bounds.width, 1.0 / bounds.height, 1.0, 1.0)
          ..translateByDouble(-bounds.left, -bounds.top, 0.0, 1.0);
        m = toCanvas
          ..multiply(m)
          ..multiply(fromCanvas);
      }
    }

    if (isLinearBoundingBox && bounds.width != bounds.height) {
      final double dx = x2 - x1;
      final double dy = y2 - y1;
      if (dx != 0.0 && dy != 0.0) {
        final double w = bounds.width;
        final double h = bounds.height;
        final double denom = (dx * dx * w * w) + (dy * dy * h * h);
        if (denom > 0.0) {
          final double numUnit = (dx * dx) + (dy * dy);
          final double sx = (numUnit * w * w) / denom;
          final double sy = (numUnit * h * h) / denom;
          final double p1x = bounds.left + (x1 * w);
          final double p1y = bounds.top + (y1 * h);
          final Matrix4 skewScale = Matrix4.identity()
            ..translateByDouble(p1x, p1y, 0.0, 1.0)
            ..scaleByDouble(sx, sy, 1.0, 1.0)
            ..translateByDouble(-p1x, -p1y, 0.0, 1.0);
          if (m != null) {
            m = skewScale..multiply(m);
          } else {
            m = skewScale;
          }
        }
      }
    }

    if (isElliptical && bounds.width != bounds.height) {
      final double shortest = bounds.width < bounds.height
          ? bounds.width
          : bounds.height;
      final double sx = bounds.width / shortest;
      final double sy = bounds.height / shortest;
      final double px = bounds.left + (centerX * bounds.width);
      final double py = bounds.top + (centerY * bounds.height);

      final Matrix4 scale = Matrix4.identity()
        ..translateByDouble(px, py, 0.0, 1.0)
        ..scaleByDouble(sx, sy, 1.0, 1.0)
        ..translateByDouble(-px, -py, 0.0, 1.0);

      if (m != null) {
        m = scale..multiply(m);
      } else {
        m = scale;
      }
    }
    return m;
  }
}
