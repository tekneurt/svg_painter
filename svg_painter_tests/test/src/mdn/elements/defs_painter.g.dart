// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defs_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class _$DefsPainter extends CustomPainter {
  const _$DefsPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(10.0, 10.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(10.0, 10.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 10.0, 10.0));

    final Gradient _grad_myGradient = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: [Color(0xFFFFD700), Color(0xFFFF0000)],
      stops: [0.2, 0.9],
      transform: const GradientRotation(3.141592653589793 / 2),
    );
    {
      {
        final Paint paint = Paint();
        paint.shader = _grad_myGradient.createShader(
          Rect.fromCircle(center: const Offset(5.0, 5.0), radius: 5.0),
        );
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(5.0, 5.0), 5.0, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0x00000000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawCircle(const Offset(5.0, 5.0), 5.0, paint);
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$DefsPainter oldDelegate) {
    return fit != oldDelegate.fit;
  }
}
