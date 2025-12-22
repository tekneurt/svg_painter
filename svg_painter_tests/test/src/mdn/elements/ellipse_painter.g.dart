// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ellipse_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

class _$MdnEllipsePainter extends CustomPainter {
  const _$MdnEllipsePainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(200.0, 100.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 200.0, 100.0));

    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF000000);
      paint.style = PaintingStyle.fill;
      canvas.drawOval(
        Rect.fromCenter(
          center: const Offset(100.0, 50.0),
          width: 200.0,
          height: 100.0,
        ),
        paint,
      );
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$MdnEllipsePainter oldDelegate) {
    return fit != oldDelegate.fit;
  }
}
