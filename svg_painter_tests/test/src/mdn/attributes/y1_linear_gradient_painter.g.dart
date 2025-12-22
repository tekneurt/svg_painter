// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'y1_linear_gradient_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

class _$Y1LinearGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient _grad_g0 = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: [Color(0xFF000000), Color(0xFFFF0000), Color(0xFF000000)],
      stops: [0.05, 0.5, 0.95],
    );
    final Gradient _grad_g1 = LinearGradient(
      begin: Alignment(-1.0, 1.0),
      end: Alignment(1.0, -1.0),
      colors: [Color(0xFF000000), Color(0xFFFF0000), Color(0xFF000000)],
      stops: [0.05, 0.5, 0.95],
    );
    {
      final Paint paint = Paint();
      paint.shader = _grad_g0.createShader(Rect.fromLTWH(1.0, 1.0, 8.0, 8.0));
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(1.0, 1.0, 8.0, 8.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_g1.createShader(Rect.fromLTWH(11.0, 1.0, 8.0, 8.0));
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(11.0, 1.0, 8.0, 8.0), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
