// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paint_order_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class PaintOrderPainterWidget extends StatelessWidget {
  const PaintOrderPainterWidget({
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
      size: Size(width ?? 400.0, height ?? 200.0),
      painter: _$PaintOrderPainter(fit: fit),
    );
  }
}

class _$PaintOrderPainter extends CustomPainter {
  const _$PaintOrderPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(400.0, 200.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(400.0, 200.0),
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

    final Gradient _grad_g = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(-1.0, 1.0),
      colors: <Color>[const Color(0xFF888888), const Color(0xFFCCCCCC)],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp,
    );
    {
      final Paint paint = Paint();
      paint.shader = _grad_g.createShader(
        Rect.fromLTWH(0.0, 0.0, 400.0, 200.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 400.0, 200.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFDC143C);
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: const Color(0xFFDC143C),
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              fontFamily: 'Roboto',
              package: 'svg_painter',
            ),
            children: <InlineSpan>[TextSpan(text: 'stroke over')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            200.0 - tp.width / 2.0,
            75.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.white;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 6.0;
      paint.strokeJoin = StrokeJoin.round;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              foreground: paint,
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              fontFamily: 'Roboto',
              package: 'svg_painter',
            ),
            children: <InlineSpan>[TextSpan(text: 'stroke over')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            200.0 - tp.width / 2.0,
            75.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.white;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 6.0;
      paint.strokeJoin = StrokeJoin.round;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              foreground: paint,
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              fontFamily: 'Roboto',
              package: 'svg_painter',
            ),
            children: <InlineSpan>[TextSpan(text: 'stroke under')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            200.0 - tp.width / 2.0,
            150.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFDC143C);
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: const Color(0xFFDC143C),
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              fontFamily: 'Roboto',
              package: 'svg_painter',
            ),
            children: <InlineSpan>[TextSpan(text: 'stroke under')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            200.0 - tp.width / 2.0,
            150.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.restore();
  }

  void _applyOverride(Paint paint, Object? override) {
    switch (override) {
      case final Color color:
        paint.color = color;
        paint.shader = null;

      case final Shader shader:
        paint.shader = shader;

      case null || _:
        break;
    }
  }

  @override
  bool shouldRepaint(covariant _$PaintOrderPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
