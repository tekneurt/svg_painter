// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'r_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

class _$RPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient _grad_myGradient000 = RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.0,
      colors: [Color(0xFFFFFFFF), Color(0xFF000000)],
      stops: [0.0, 1.0],
    );
    final Gradient _grad_myGradient050 = RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.5,
      colors: [Color(0xFFFFFFFF), Color(0xFF000000)],
      stops: [0.0, 1.0],
    );
    final Gradient _grad_myGradient100 = RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 1.0,
      colors: [Color(0xFFFFFFFF), Color(0xFF000000)],
      stops: [0.0, 1.0],
    );
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF000000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(150.0, 50.0), 25.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF000000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(250.0, 50.0), 50.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_myGradient000.createShader(
        Rect.fromLTWH(20.0, 120.0, 60.0, 60.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(20.0, 120.0, 60.0, 60.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_myGradient050.createShader(
        Rect.fromLTWH(120.0, 120.0, 60.0, 60.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(120.0, 120.0, 60.0, 60.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_myGradient100.createShader(
        Rect.fromLTWH(220.0, 120.0, 60.0, 60.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(220.0, 120.0, 60.0, 60.0), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
