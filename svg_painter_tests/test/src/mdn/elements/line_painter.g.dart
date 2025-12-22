// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

class _$LinePainter extends CustomPainter {
  const _$LinePainter({this.fit = BoxFit.contain});

  final BoxFit fit;

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
    // Clip to the viewBox (source size)
    canvas.clipRect(Rect.fromLTWH(0, 0, 100.0, 100.0));

    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF000000);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(Offset(0.0, 80.0), Offset(100.0, 20.0), paint);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$LinePainter oldDelegate) {
    return fit != oldDelegate.fit;
  }
}
