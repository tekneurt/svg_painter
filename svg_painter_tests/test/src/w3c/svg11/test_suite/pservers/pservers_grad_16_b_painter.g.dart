// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pservers_grad_16_b_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, unused_local_variable, deprecated_member_use_from_same_package

class PserversGrad16BPainterWidget extends StatelessWidget {
  const PserversGrad16BPainterWidget({
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
      label: '\$RCSfile: pservers-grad-16-b.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$PserversGrad16BPainter(fit: fit),
      ),
    );
  }
}

class _$PserversGrad16BPainter extends CustomPainter {
  const _$PserversGrad16BPainter({this.fit = BoxFit.contain});

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

    final Gradient _grad_defs1 = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: <Color>[],
      stops: <double>[],
      tileMode: TileMode.clamp,
    );
    final Gradient _grad_defs2 = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: <Color>[Colors.black, Colors.black],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp,
    );
    final Gradient _grad_defs3 = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: <Color>[
        const Color(0xFFFFFF00),
        const Color(0xFFFF4488),
        const Color(0xFF008000),
        const Color(0xFF0000FF),
      ],
      stops: <double>[0.0, 0.25, 0.5, 0.5],
      tileMode: TileMode.clamp,
    );
    {
      final Paint paint = Paint();
      paint.color = Colors.transparent;
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(20.0, 10.0, 440.0, 80.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF4488);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(20.0, 10.0, 440.0, 80.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_defs2.createShader(
        Rect.fromLTWH(20.0, 110.0, 440.0, 80.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(20.0, 110.0, 440.0, 80.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_defs3.createShader(
        Rect.fromLTWH(20.0, 210.0, 440.0, 80.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(20.0, 210.0, 440.0, 80.0), paint);
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
  bool shouldRepaint(covariant _$PserversGrad16BPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
