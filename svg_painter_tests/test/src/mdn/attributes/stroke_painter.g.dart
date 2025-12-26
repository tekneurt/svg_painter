// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stroke_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class _$StrokePainter extends CustomPainter {
  const _$StrokePainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(20.0, 10.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(20.0, 10.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 20.0, 10.0));

    final Gradient _grad_myGradient = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: [Color(0xFF008000), Color(0xFFFFFFFF)],
      stops: [0.0, 1.0],
    );
    {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF008000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawCircle(const Offset(5.0, 5.0), 4.0, paint);
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.shader = _grad_myGradient.createShader(
          Rect.fromCircle(center: const Offset(15.0, 5.0), radius: 4.0),
        );
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawCircle(const Offset(15.0, 5.0), 4.0, paint);
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$StrokePainter oldDelegate) {
    return fit != oldDelegate.fit;
  }
}
