// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cy_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

class _$CyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient _grad_myGradient = RadialGradient(
      center: Alignment(0.0, -0.5),
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
          center: const Offset(50.0, 150.0),
          width: 50.0,
          height: 90.0,
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_myGradient.createShader(
        Rect.fromLTWH(5.0, 205.0, 90.0, 90.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(5.0, 205.0, 90.0, 90.0), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
