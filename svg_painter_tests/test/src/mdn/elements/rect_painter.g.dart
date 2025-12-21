// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rect_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

class _$RectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF000000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 100.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF000000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(120.0, 0.0, 100.0, 100.0),
          Radius.elliptical(15.0, 15.0),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
