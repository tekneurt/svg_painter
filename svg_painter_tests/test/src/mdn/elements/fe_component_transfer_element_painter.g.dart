// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fe_component_transfer_element_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class FeComponentTransferElementPainterWidget extends StatelessWidget {
  const FeComponentTransferElementPainterWidget({
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
      size: Size(width ?? 600.0, height ?? 300.0),
      painter: _$FeComponentTransferElementPainter(fit: fit),
    );
  }
}

class _$FeComponentTransferElementPainter extends CustomPainter {
  const _$FeComponentTransferElementPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(600.0, 300.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(600.0, 300.0),
      size,
    );
    final Size sourceSize = fittedSizes.source;
    final Rect destRect = Alignment.center.inscribe(
      fittedSizes.destination,
      Offset.zero & size,
    );
    final Rect viewBoxRect = Rect.fromLTWH(0, 0, 600.0, 300.0);

    canvas.save();
    canvas.translate(destRect.left, destRect.top);
    canvas.scale(
      destRect.width / sourceSize.width,
      destRect.height / sourceSize.height,
    );

    final Gradient _grad_rainbow = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: <Color>[
        const Color(0xFFFF0000),
        const Color(0xFFFFFF00),
        const Color(0xFF00FF00),
        const Color(0xFF00FFFF),
        const Color(0xFF0000FF),
        const Color(0xFF800080),
      ],
      stops: <double>[0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
      tileMode: TileMode.clamp,
    );
    void _filter_identity(Canvas canvas, void Function() drawGraphic) {
      canvas.saveLayer(
        null,
        Paint()
          ..colorFilter = const ColorFilter.matrix(<double>[
            1.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            1.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            1.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            1.0,
            0.0,
          ]),
      );
      drawGraphic();
      canvas.restore();
    }

    void _filter_table(Canvas canvas, void Function() drawGraphic) {
      canvas.saveLayer(
        null,
        Paint()
          ..colorFilter = const ColorFilter.matrix(<double>[
            1.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            -1.0,
            0.0,
            0.0,
            255.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            1.0,
            0.0,
          ]),
      );
      drawGraphic();
      canvas.restore();
    }

    void _filter_discrete(Canvas canvas, void Function() drawGraphic) {
      canvas.saveLayer(
        null,
        Paint()
          ..colorFilter = const ColorFilter.matrix(<double>[
            1.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            -1.0,
            0.0,
            0.0,
            255.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            1.0,
            0.0,
          ]),
      );
      drawGraphic();
      canvas.restore();
    }

    void _filter_linear(Canvas canvas, void Function() drawGraphic) {
      canvas.saveLayer(
        null,
        Paint()
          ..colorFilter = const ColorFilter.matrix(<double>[
            0.5,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.5,
            0.0,
            0.0,
            63.75,
            0.0,
            0.0,
            0.5,
            0.0,
            127.5,
            0.0,
            0.0,
            0.0,
            1.0,
            0.0,
          ]),
      );
      drawGraphic();
      canvas.restore();
    }

    void _filter_gamma(Canvas canvas, void Function() drawGraphic) {
      canvas.saveLayer(
        null,
        Paint()
          ..colorFilter = const ColorFilter.matrix(<double>[
            4.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            4.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            4.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            1.0,
            0.0,
          ]),
      );
      drawGraphic();
      canvas.restore();
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
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              fontFamily: 'Tinos',
              package: 'svg_painter',
            ),
            children: <InlineSpan>[TextSpan(text: 'Default')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            20.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_rainbow.createShader(viewBoxRect);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 30.0, 600.0, 20.0), paint);
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
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              fontFamily: 'Tinos',
              package: 'svg_painter',
            ),
            children: <InlineSpan>[TextSpan(text: 'Identity')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            70.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    _filter_identity(canvas, () {
      {
        final Paint paint = Paint();
        paint.shader = _grad_rainbow.createShader(viewBoxRect);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 80.0, 600.0, 20.0), paint);
      }
    });
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              fontFamily: 'Tinos',
              package: 'svg_painter',
            ),
            children: <InlineSpan>[TextSpan(text: 'Table lookup')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            120.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    _filter_table(canvas, () {
      {
        final Paint paint = Paint();
        paint.shader = _grad_rainbow.createShader(viewBoxRect);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 130.0, 600.0, 20.0), paint);
      }
    });
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              fontFamily: 'Tinos',
              package: 'svg_painter',
            ),
            children: <InlineSpan>[TextSpan(text: 'Discrete table lookup')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            170.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    _filter_discrete(canvas, () {
      {
        final Paint paint = Paint();
        paint.shader = _grad_rainbow.createShader(viewBoxRect);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 180.0, 600.0, 20.0), paint);
      }
    });
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              fontFamily: 'Tinos',
              package: 'svg_painter',
            ),
            children: <InlineSpan>[TextSpan(text: 'Linear function')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            220.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    _filter_linear(canvas, () {
      {
        final Paint paint = Paint();
        paint.shader = _grad_rainbow.createShader(viewBoxRect);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 230.0, 600.0, 20.0), paint);
      }
    });
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              fontFamily: 'Tinos',
              package: 'svg_painter',
            ),
            children: <InlineSpan>[TextSpan(text: 'Gamma function')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            270.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    _filter_gamma(canvas, () {
      {
        final Paint paint = Paint();
        paint.shader = _grad_rainbow.createShader(viewBoxRect);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 280.0, 600.0, 20.0), paint);
      }
    });
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
  bool shouldRepaint(
    covariant _$FeComponentTransferElementPainter oldDelegate,
  ) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
