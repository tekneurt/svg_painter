// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offset_gradient_stop_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class OffsetGradientStopPainterWidget extends StatelessWidget {
  const OffsetGradientStopPainterWidget({
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
      size: Size(width ?? 20.0, height ?? 10.0),
      painter: _$OffsetGradientStopPainter(fit: fit),
    );
  }
}

class _$OffsetGradientStopPainter extends CustomPainter {
  const _$OffsetGradientStopPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(20.0, 10.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(20.0, 10.0),
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

    final Gradient _grad_linear_gradient = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: <Color>[Colors.black, const Color(0xFF808080)],
      stops: <double>[0.06, 0.7],
      tileMode: TileMode.clamp,
    );
    final Gradient _grad_radial_gradient = RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.5,
      focal: Alignment(0.0, 0.0),
      focalRadius: 0.0,
      colors: <Color>[const Color(0xFFFFD700), const Color(0xFF808080)],
      stops: <double>[0.0, 0.95],
      tileMode: TileMode.clamp,
    );
    {
      final Paint paint = Paint();
      paint.shader = _grad_linear_gradient.createShader(
        Rect.fromCircle(center: const Offset(5.0, 5.0), radius: 4.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(5.0, 5.0), 4.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_radial_gradient.createShader(
        Rect.fromCircle(center: const Offset(15.0, 5.0), radius: 4.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(15.0, 5.0), 4.0, paint);
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
  bool shouldRepaint(covariant _$OffsetGradientStopPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
