// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pservers_grad_18_b_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, unused_local_variable, deprecated_member_use_from_same_package

class PserversGrad18BPainterWidget extends StatelessWidget {
  const PserversGrad18BPainterWidget({
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
      label: '\$RCSfile: pservers-grad-18-b.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$PserversGrad18BPainter(fit: fit),
      ),
    );
  }
}

class _$PserversGrad18BPainter extends CustomPainter {
  const _$PserversGrad18BPainter({this.fit = BoxFit.contain});

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

    canvas.save();
    canvas.translate(destRect.left, destRect.top);
    canvas.scale(
      destRect.width / sourceSize.width,
      destRect.height / sourceSize.height,
    );

    final Gradient _grad_MyGradient1 = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: <Color>[const Color(0xFF008000), const Color(0xFFFF4488)],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp,
    );
    final Gradient _grad_MyGradient2 = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: <Color>[const Color(0xFF008000), const Color(0x80008000)],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp,
    );
    final Gradient _grad_MyGradient3 = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: <Color>[const Color(0xFF008000), Colors.black],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp,
    );
    final Gradient _grad_MyGradient4 = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: <Color>[const Color(0xFF008000), const Color(0xFFFFFF00)],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp,
    );
    {
      final Paint paint = Paint();
      paint.shader = _grad_MyGradient1.createShader(
        Rect.fromLTWH(50.0, 50.0, 100.0, 100.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(50.0, 50.0, 100.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_MyGradient2.createShader(
        Rect.fromLTWH(200.0, 50.0, 100.0, 100.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(200.0, 50.0, 100.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_MyGradient3.createShader(
        Rect.fromLTWH(50.0, 200.0, 100.0, 100.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(50.0, 200.0, 100.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_MyGradient4.createShader(
        Rect.fromLTWH(200.0, 200.0, 100.0, 100.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(200.0, 200.0, 100.0, 100.0), paint);
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
  bool shouldRepaint(covariant _$PserversGrad18BPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
