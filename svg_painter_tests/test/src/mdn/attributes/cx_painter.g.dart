// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cx_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

class _$CxPainter extends CustomPainter {
  const _$CxPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(300.0, 100.0),
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
    // Clip to the viewBox (source size)
    canvas.clipRect(Rect.fromLTWH(0, 0, 300.0, 100.0));

    final Gradient _grad_myGradient = RadialGradient(
      center: Alignment(-0.5, 0.0),
      radius: 0.5,
      colors: [Color(0xFFFFFFFF), Color(0xFF000000)],
      stops: [0.0, 1.0],
    );
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF000000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(50.0, 50.0), 45.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF000000);
      paint.style = PaintingStyle.fill;
      canvas.drawOval(
        Rect.fromCenter(
          center: const Offset(150.0, 50.0),
          width: 90.0,
          height: 50.0,
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_myGradient.createShader(
        Rect.fromLTWH(205.0, 5.0, 90.0, 90.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(205.0, 5.0, 90.0, 90.0), paint);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$CxPainter oldDelegate) {
    return fit != oldDelegate.fit;
  }
}
