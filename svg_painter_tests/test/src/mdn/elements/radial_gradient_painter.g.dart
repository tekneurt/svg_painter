// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radial_gradient_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

class _$RadialGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient _grad_myGradient = RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.5,
      colors: [Color(0xFFFFD700), Color(0xFFFF0000)],
      stops: [0.1, 0.95],
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
