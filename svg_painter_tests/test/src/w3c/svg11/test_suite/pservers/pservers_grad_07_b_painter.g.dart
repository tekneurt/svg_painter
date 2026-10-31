// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pservers_grad_07_b_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, unused_local_variable, deprecated_member_use_from_same_package

class PserversGrad07BPainterWidget extends StatelessWidget {
  const PserversGrad07BPainterWidget({
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
    return Semantics(
      label: '\$RCSfile: pservers-grad-07-b.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$PserversGrad07BPainter(fit: fit),
      ),
    );
  }
}

class _$PserversGrad07BPainter extends CustomPainter {
  const _$PserversGrad07BPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(480.0, 360.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(480.0, 360.0),
      size,
    );
    final Size sourceSize = fittedSizes.source;
    final Rect destRect = Alignment.center.inscribe(
      fittedSizes.destination,
      Offset.zero & size,
    );
    final Rect viewBoxRect = Rect.fromLTWH(0, 0, 480.0, 360.0);

    canvas.save();
    canvas.translate(destRect.left, destRect.top);
    canvas.scale(
      destRect.width / sourceSize.width,
      destRect.height / sourceSize.height,
    );

    final Gradient _grad_Gradient = LinearGradient(
      begin: Alignment(-0.9583333333333334, -0.9444444444444444),
      end: Alignment(0.8333333333333333, -0.9444444444444444),
      colors: <Color>[const Color(0xFF0000FF), const Color(0xFF00FF00)],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp,
    );
    canvas.save();
    canvas.scale(1.0, 1.5);
    {
      final Paint paint = Paint();
      paint.shader = _grad_Gradient.createShader(viewBoxRect);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(10.0, 10.0, 430.0, 60.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[
              TextSpan(text: 'Linear gradient filled rectangle'),
            ],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            10.0,
            90.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_Gradient.createShader(viewBoxRect);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 20.0;
      canvas.drawRect(Rect.fromLTWH(25.0, 110.0, 400.0, 30.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[
              TextSpan(text: 'Linear gradient on stroke of rectangle'),
            ],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            10.0,
            170.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.restore();
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 32.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: '\$Revision: 1.1 \$')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            10.0,
            340.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(1.0, 1.0, 478.0, 358.0), paint);
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
  bool shouldRepaint(covariant _$PserversGrad07BPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
