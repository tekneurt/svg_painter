// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linear_gradient_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class LinearGradientPainterWidget extends StatelessWidget {
  const LinearGradientPainterWidget({
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
      size: Size(width ?? 100.0, height ?? 100.0),
      painter: _$LinearGradientPainter(fit: fit),
    );
  }
}

class _$LinearGradientPainter extends CustomPainter {
  const _$LinearGradientPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(100.0, 100.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(100.0, 100.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 100.0, 100.0));

    final Gradient _grad_myGradient = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(-1.0, 1.0),
      colors: <Color>[const Color(0xFFFFD700), const Color(0xFFFF0000)],
      stops: <double>[0.05, 0.95],
    );
    {
      final Paint paint = Paint();
      paint.shader = _grad_myGradient.createShader(
        Rect.fromCircle(center: const Offset(50.0, 50.0), radius: 50.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(50.0, 50.0), 50.0, paint);
    }
    canvas.restore();
  }

  void _applyOverride(Paint paint, Object? override) {
    if (override == null) return;
    if (override is Color) {
      paint.color = override;
      paint.shader = null;
    } else if (override is Shader) {
      paint.shader = override;
    }
  }

  @override
  bool shouldRepaint(covariant _$LinearGradientPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    }

    return true;
  }
}
