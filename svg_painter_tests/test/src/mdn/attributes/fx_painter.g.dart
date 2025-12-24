// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fx_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class _$FxPainter extends CustomPainter {
  const _$FxPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(fit, const Size(480.0, 200.0), size);
    final Size sourceSize = fittedSizes.source;
    final Rect destRect = Alignment.center.inscribe(fittedSizes.destination, Offset.zero & size);

    canvas.save();
    canvas.translate(destRect.left, destRect.top);
    canvas.scale(destRect.width / sourceSize.width, destRect.height / sourceSize.height);
    canvas.clipRect(Rect.fromLTWH(0, 0, 480.0, 200.0));

    final Gradient _grad_gradient1 = RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.5,
      focal: Alignment(-0.30000000000000004, -0.30000000000000004),
      focalRadius: 0.05,
      colors: [Color(0xFFFFFFFF), Color(0xFF8FBC8F)],
      stops: [0.0, 1.0],
    );
    final Gradient _grad_gradient2 = RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.5,
      focal: Alignment(0.5, -0.30000000000000004),
      focalRadius: 0.05,
      colors: [Color(0xFFFFFFFF), Color(0xFF8FBC8F)],
      stops: [0.0, 1.0],
    );
    {
      final Paint paint = Paint();
      paint.shader = _grad_gradient1.createShader(
        Rect.fromCircle(center: const Offset(100.0, 100.0), radius: 100.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(100.0, 100.0), 100.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_gradient2.createShader(
        Rect.fromCircle(center: const Offset(340.0, 100.0), radius: 100.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(340.0, 100.0), 100.0, paint);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$FxPainter oldDelegate) {
    return fit != oldDelegate.fit;
  }
}
