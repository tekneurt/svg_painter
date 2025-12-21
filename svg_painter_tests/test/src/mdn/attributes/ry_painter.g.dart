// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ry_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

class _$RyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF000000);
      paint.style = PaintingStyle.fill;
      canvas.drawOval(
        Rect.fromCenter(
          center: const Offset(150.0, 50.0),
          width: 50.0,
          height: 50.0,
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF000000);
      paint.style = PaintingStyle.fill;
      canvas.drawOval(
        Rect.fromCenter(
          center: const Offset(250.0, 50.0),
          width: 50.0,
          height: 100.0,
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF000000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(20.0, 120.0, 60.0, 60.0),
          Radius.elliptical(15.0, 0.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF000000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(120.0, 120.0, 60.0, 60.0),
          Radius.elliptical(15.0, 15.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF000000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(220.0, 120.0, 60.0, 60.0),
          Radius.elliptical(15.0, 30.0),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
