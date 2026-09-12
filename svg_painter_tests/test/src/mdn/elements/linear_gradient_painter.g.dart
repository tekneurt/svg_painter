// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linear_gradient_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class LinearGradient1PainterWidget extends StatelessWidget {
  const LinearGradient1PainterWidget({
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
      size: Size(width ?? 10.0, height ?? 10.0),
      painter: _$LinearGradient1Painter(fit: fit),
    );
  }
}

class _$LinearGradient1Painter extends CustomPainter {
  const _$LinearGradient1Painter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(10.0, 10.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(10.0, 10.0),
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

    final Gradient _grad_myGradient = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: <Color>[const Color(0xFFFFD700), const Color(0xFFFF0000)],
      stops: <double>[0.05, 0.95],
      tileMode: TileMode.clamp,
      transform: _SvgGradientTransform_LinearGradient1Painter(
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
      ),
    );
    {
      final Paint paint = Paint();
      paint.shader = _grad_myGradient.createShader(
        Rect.fromCircle(center: const Offset(5.0, 5.0), radius: 4.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(5.0, 5.0), 4.0, paint);
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
  bool shouldRepaint(covariant _$LinearGradient1Painter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}

/// A private helper class to apply arbitrary transformations to SVG gradients.
class _SvgGradientTransform_LinearGradient1Painter extends GradientTransform {
  const _SvgGradientTransform_LinearGradient1Painter({
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

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class LinearGradient2PainterWidget extends StatelessWidget {
  const LinearGradient2PainterWidget({
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
      size: Size(width ?? 500.0, height ?? 500.0),
      painter: _$LinearGradient2Painter(fit: fit),
    );
  }
}

class _$LinearGradient2Painter extends CustomPainter {
  const _$LinearGradient2Painter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(500.0, 500.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(500.0, 500.0),
      size,
    );
    final Size sourceSize = fittedSizes.source;
    final Rect destRect = Alignment.center.inscribe(
      fittedSizes.destination,
      Offset.zero & size,
    );
    final Rect viewBoxRect = Rect.fromLTWH(0, 0, 500.0, 500.0);

    canvas.save();
    canvas.translate(destRect.left, destRect.top);
    canvas.scale(
      destRect.width / sourceSize.width,
      destRect.height / sourceSize.height,
    );

    final Gradient _grad_grad = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(-0.92, -0.92),
      colors: <Color>[const Color(0xFFFF0000), const Color(0xFFFFD700)],
      stops: <double>[0.5, 0.5],
      tileMode: TileMode.repeated,
    );
    {
      final Paint paint = Paint();
      paint.shader = _grad_grad.createShader(viewBoxRect);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 500.0, 125.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_grad.createShader(viewBoxRect);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 150.0, 500.0, 325.0), paint);
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
  bool shouldRepaint(covariant _$LinearGradient2Painter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
