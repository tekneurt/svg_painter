// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fy_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class Fy1PainterWidget extends StatelessWidget {
  const Fy1PainterWidget({
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
  });

  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width ?? 480.0, height ?? 200.0),
      painter: _$Fy1Painter(fit: fit),
    );
  }
}

class _$Fy1Painter extends CustomPainter {
  const _$Fy1Painter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(480.0, 200.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(480.0, 200.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 480.0, 200.0));

    final Gradient _grad_gradient1 = RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.5,
      focal: Alignment(-0.30000000000000004, -0.30000000000000004),
      focalRadius: 0.05,
      colors: [Colors.white, const Color(0xFF8FBC8F)],
      stops: [0.0, 1.0],
    );
    final Gradient _grad_gradient2 = RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.5,
      focal: Alignment(-0.30000000000000004, 0.5),
      focalRadius: 0.05,
      colors: [Colors.white, const Color(0xFF8FBC8F)],
      stops: [0.0, 1.0],
    );
    {
      {
        final Paint paint = Paint();
        paint.shader = _grad_gradient1.createShader(
          Rect.fromCircle(center: const Offset(100.0, 100.0), radius: 100.0),
        );
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(100.0, 100.0), 100.0, paint);
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.shader = _grad_gradient2.createShader(
          Rect.fromCircle(center: const Offset(340.0, 100.0), radius: 100.0),
        );
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(340.0, 100.0), 100.0, paint);
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$Fy1Painter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class Fy2PainterWidget extends StatelessWidget {
  const Fy2PainterWidget({
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
  });

  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width ?? 200.0, height ?? 200.0),
      painter: _$Fy2Painter(fit: fit),
    );
  }
}

class _$Fy2Painter extends CustomPainter {
  const _$Fy2Painter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(200.0, 200.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(200.0, 200.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 200.0, 200.0));

    final Gradient _grad_Gradient = RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.5,
      focal: Alignment(-0.30000000000000004, -0.30000000000000004),
      focalRadius: 0.05,
      colors: [const Color(0xFFFF0000), const Color(0xFF0000FF)],
      stops: [0.0, 1.0],
    );
    {
      {
        final Paint paint = Paint();
        paint.shader = _grad_Gradient.createShader(
          Rect.fromLTWH(
            16.666666666666668,
            16.666666666666668,
            166.66666666666669,
            166.66666666666669,
          ),
        );
        paint.style = PaintingStyle.fill;
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(
              16.666666666666668,
              16.666666666666668,
              166.66666666666669,
              166.66666666666669,
            ),
            const Radius.elliptical(25.0, 25.0),
          ),
          paint,
        );
      }
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 3.333333333333333;
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(
              16.666666666666668,
              16.666666666666668,
              166.66666666666669,
              166.66666666666669,
            ),
            const Radius.elliptical(25.0, 25.0),
          ),
          paint,
        );
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = Colors.transparent;
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(100.0, 100.0), 83.33333333333333, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = Colors.white;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 3.333333333333333;
        canvas.drawCircle(const Offset(100.0, 100.0), 83.33333333333333, paint);
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = Colors.white;
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(
          const Offset(58.333333333333336, 58.333333333333336),
          3.333333333333333,
          paint,
        );
      }
      {
        final Paint paint = Paint();
        paint.color = Colors.white;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.6666666666666665;
        canvas.drawCircle(
          const Offset(58.333333333333336, 58.333333333333336),
          3.333333333333333,
          paint,
        );
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = Colors.white;
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(100.0, 100.0), 3.333333333333333, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = Colors.white;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.6666666666666665;
        canvas.drawCircle(const Offset(100.0, 100.0), 3.333333333333333, paint);
      }
    }
    {
      {
        final TextSpan span = TextSpan(
          text: '''(fx,fy)''',
          style: TextStyle(
            color: const Color(0xFFFFFFFF),
            fontSize: 22.222222222222225,
            fontFamily: 'Roboto',
          ),
        );
        final TextPainter tp = TextPainter(
          text: span,
          textDirection: TextDirection.ltr,
        );
        tp.layout();
        tp.paint(
          canvas,
          Offset(
            63.333333333333336,
            66.66666666666667 -
                tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      {
        final TextSpan span = TextSpan(
          text: '''(cx,cy)''',
          style: TextStyle(
            color: const Color(0xFFFFFFFF),
            fontSize: 22.222222222222225,
            fontFamily: 'Roboto',
          ),
        );
        final TextPainter tp = TextPainter(
          text: span,
          textDirection: TextDirection.ltr,
        );
        tp.layout();
        tp.paint(
          canvas,
          Offset(
            105.0,
            105.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$Fy2Painter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
