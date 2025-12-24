// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cy_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class _$CyPainter extends CustomPainter {
  const _$CyPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(fit, const Size(100.0, 300.0), size);
    final Size sourceSize = fittedSizes.source;
    final Rect destRect = Alignment.center.inscribe(fittedSizes.destination, Offset.zero & size);

    canvas.save();
    canvas.translate(destRect.left, destRect.top);
    canvas.scale(destRect.width / sourceSize.width, destRect.height / sourceSize.height);
    canvas.clipRect(Rect.fromLTWH(0, 0, 100.0, 300.0));

    final Gradient _grad_myGradient = RadialGradient(
      center: Alignment(0.0, -0.5),
      radius: 0.5,
      focal: Alignment(0.0, -0.5),
      focalRadius: 0.0,
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
        Rect.fromCenter(center: const Offset(50.0, 150.0), width: 50.0, height: 90.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_myGradient.createShader(Rect.fromLTWH(5.0, 205.0, 90.0, 90.0));
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(5.0, 205.0, 90.0, 90.0), paint);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$CyPainter oldDelegate) {
    return fit != oldDelegate.fit;
  }
}
