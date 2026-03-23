// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradient_transform_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class GradientTransformPainterWidget extends StatelessWidget {
  const GradientTransformPainterWidget({
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
      size: Size(width ?? 420.0, height ?? 200.0),
      painter: _$GradientTransformPainter(fit: fit),
    );
  }
}

class _$GradientTransformPainter extends CustomPainter {
  const _$GradientTransformPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(420.0, 200.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(420.0, 200.0),
      size,
    );
    final Size sourceSize = fittedSizes.source;
    final Rect destRect = Alignment.center.inscribe(
      fittedSizes.destination,
      Offset.zero & size,
    );
    final Rect viewBoxRect = Rect.fromLTWH(0, 0, 420.0, 200.0);

    canvas.save();
    canvas.translate(destRect.left, destRect.top);
    canvas.scale(
      destRect.width / sourceSize.width,
      destRect.height / sourceSize.height,
    );

    final Gradient _grad_gradient1 = RadialGradient(
      center: Alignment(-0.5238095238095238, 0.0),
      radius: 0.3040089501552408,
      focal: Alignment(-0.5238095238095238, 0.0),
      focalRadius: 0.0,
      colors: <Color>[
        const Color(0xFF00008B),
        const Color(0xFF87CEEB),
        const Color(0xFF00008B),
      ],
      stops: <double>[0.0, 0.5, 1.0],
      tileMode: TileMode.clamp,
    );
    final Gradient _grad_gradient2 = RadialGradient(
      center: Alignment(-0.5238095238095238, 0.0),
      radius: 0.3040089501552408,
      focal: Alignment(-0.5238095238095238, 0.0),
      focalRadius: 0.0,
      colors: <Color>[
        const Color(0xFF00008B),
        const Color(0xFF87CEEB),
        const Color(0xFF00008B),
      ],
      stops: <double>[0.0, 0.5, 1.0],
      tileMode: TileMode.clamp,
      transform: _SvgGradientTransform_GradientTransformPainter(
        matrix: <double>[
          1.0,
          0.0,
          0.0,
          0.0,
          0.36397023426620234,
          1.0,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          185.0,
          0.0,
          0.0,
          1.0,
        ],
      ),
    );
    {
      final Paint paint = Paint();
      paint.shader = _grad_gradient1.createShader(viewBoxRect);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 200.0, 200.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_gradient2.createShader(viewBoxRect);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(220.0, 0.0, 200.0, 200.0), paint);
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
  bool shouldRepaint(covariant _$GradientTransformPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}

/// A private helper class to apply arbitrary transformations to SVG gradients.
class _SvgGradientTransform_GradientTransformPainter extends GradientTransform {
  const _SvgGradientTransform_GradientTransformPainter({
    this.matrix,
    this.isElliptical = false,
    this.centerX = 0.5,
    this.centerY = 0.5,
  });

  /// The 4x4 matrix storage.
  final List<double>? matrix;

  /// Whether to correct the aspect ratio for elliptical gradients.
  final bool isElliptical;

  /// The normalized center X coordinate (0..1) for aspect ratio correction.
  final double centerX;

  /// The normalized center Y coordinate (0..1) for aspect ratio correction.
  final double centerY;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    Matrix4? m;
    if (matrix != null) {
      m = Matrix4.fromList(matrix!);
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
        return scale..multiply(m);
      }
      return scale;
    }
    return m;
  }
}
