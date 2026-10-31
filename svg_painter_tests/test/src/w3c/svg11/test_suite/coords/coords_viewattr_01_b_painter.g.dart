// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coords_viewattr_01_b_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, unused_local_variable, deprecated_member_use_from_same_package

class CoordsViewattr01BPainterWidget extends StatelessWidget {
  const CoordsViewattr01BPainterWidget({
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
      label: '\$RCSfile: coords-viewattr-01-b.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$CoordsViewattr01BPainter(fit: fit),
      ),
    );
  }
}

class _$CoordsViewattr01BPainter extends CustomPainter {
  const _$CoordsViewattr01BPainter({this.fit = BoxFit.contain});

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

    canvas.save();
    canvas.translate(0.0, 30.0);
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
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[
              TextSpan(text: 'Test available options of preserveAspectRatio'),
            ],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            240.0 - tp.width / 2.0,
            0.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
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
              fontSize: 9.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'SVG to fit')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            35.5 - tp.width / 2.0,
            30.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.translate(20.0, 40.0);
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
              fontSize: 9.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'Viewport 1')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            35.5 - tp.width / 2.0,
            110.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.translate(10.0, 120.0);
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
              fontSize: 9.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'Viewport 2')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            35.5 - tp.width / 2.0,
            180.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.translate(20.0, 190.0);
    canvas.restore();
    canvas.save();
    canvas.translate(120.0, 50.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 9.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[
              TextSpan(text: '---------- meet --------------------'),
            ],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            -20.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
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
              fontSize: 9.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'xMin*')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            -5.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 50.0, 30.0));
    canvas.save();
    canvas.scale(0.75, 0.75);
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(70.0, 0.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 9.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'xMid*')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            -5.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 50.0, 30.0));
    canvas.save();
    canvas.translate(13.75, 0.0);
    canvas.scale(0.75, 0.75);
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(0.0, 50.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 9.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'xMax*')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            -5.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 50.0, 30.0));
    canvas.save();
    canvas.translate(27.5, 0.0);
    canvas.scale(0.75, 0.75);
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(300.0, 50.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 9.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[
              TextSpan(text: '---------- meet ------------------------'),
            ],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            -20.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
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
              fontSize: 9.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: '*YMin')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            -5.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 30.0, 60.0));
    canvas.restore();
    canvas.save();
    canvas.translate(50.0, 0.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 9.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: '*YMid')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            -5.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 30.0, 60.0));
    canvas.save();
    canvas.translate(0.0, 10.0);
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(100.0, 0.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 9.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: '*YMax')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            -5.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 30.0, 60.0));
    canvas.save();
    canvas.translate(0.0, 20.0);
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(120.0, 185.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 9.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[
              TextSpan(text: '---------- slice -------------------------'),
            ],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            -20.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
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
              fontSize: 9.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'xMin*')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            -5.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 30.0, 60.0));
    canvas.save();
    canvas.scale(1.5, 1.5);
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(50.0, 0.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 9.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'xMid*')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            -5.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 30.0, 60.0));
    canvas.save();
    canvas.translate(-7.5, 0.0);
    canvas.scale(1.5, 1.5);
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(100.0, 0.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 9.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'xMax*')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            -5.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 30.0, 60.0));
    canvas.save();
    canvas.translate(-15.0, 0.0);
    canvas.scale(1.5, 1.5);
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(300.0, 155.0);
    canvas.translate(0.0, 30.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 9.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[
              TextSpan(text: '---------- slice ---------------------'),
            ],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            -20.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
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
              fontSize: 9.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: '*YMin')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            -5.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 50.0, 30.0));
    canvas.save();
    canvas.scale(1.6666666666666667, 1.6666666666666667);
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(70.0, 0.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 9.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: '*YMid')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            -5.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 50.0, 30.0));
    canvas.save();
    canvas.translate(0.0, -18.333333333333336);
    canvas.scale(1.6666666666666667, 1.6666666666666667);
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(0.0, 50.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 9.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: '*YMax')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            -5.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 50.0, 30.0));
    canvas.save();
    canvas.translate(0.0, -36.66666666666667);
    canvas.scale(1.6666666666666667, 1.6666666666666667);
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.restore();
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
  bool shouldRepaint(covariant _$CoordsViewattr01BPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
