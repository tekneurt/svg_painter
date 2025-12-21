// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linear_gradient_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

class _$LinearGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient _grad_myGradient = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: [Color(0xFFFFD700), Color(0xFFFF0000)],
      stops: [0.05, 0.95],
      transform: GradientRotation(3.141592653589793 / 2),
    );
    {
      final Paint paint = Paint();
      paint.shader = _grad_myGradient.createShader(
        Rect.fromCircle(center: const Offset(50.0, 50.0), radius: 50.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(50.0, 50.0), 50.0, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
