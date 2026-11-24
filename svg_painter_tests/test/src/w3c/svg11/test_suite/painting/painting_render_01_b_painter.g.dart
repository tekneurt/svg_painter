// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'painting_render_01_b_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, unused_local_variable, deprecated_member_use_from_same_package

class PaintingRender01BPainterWidget extends StatelessWidget {
  const PaintingRender01BPainterWidget({
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
      label: '\$RCSfile: painting-render-01-b.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$PaintingRender01BPainter(fit: fit),
      ),
    );
  }
}

class _$PaintingRender01BPainter extends CustomPainter {
  const _$PaintingRender01BPainter({this.fit = BoxFit.contain});

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

    final Gradient _grad_gradientDefault = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: <Color>[
        Colors.white,
        const Color(0xFF0000FF),
        const Color(0xFFFF0000),
        const Color(0xFFFFFF00),
      ],
      stops: <double>[0.0, 0.33, 0.66, 1.0],
      tileMode: TileMode.clamp,
    );
    final Gradient _grad_gradientSRGB = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: <Color>[
        Colors.white,
        const Color(0xFF0000FF),
        const Color(0xFFFF0000),
        const Color(0xFFFFFF00),
      ],
      stops: <double>[0.0, 0.33, 0.66, 1.0],
      tileMode: TileMode.clamp,
    );
    final Gradient _grad_gradientLinearRGB = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: <Color>[
        Colors.white,
        const Color(0xFFF8F8FF),
        const Color(0xFFF0F0FF),
        const Color(0xFFE9E9FF),
        const Color(0xFFE1E1FF),
        const Color(0xFFD8D8FF),
        const Color(0xFFCFCFFF),
        const Color(0xFFC6C6FF),
        const Color(0xFFBCBCFF),
        const Color(0xFFB1B1FF),
        const Color(0xFFA5A5FF),
        const Color(0xFF9898FF),
        const Color(0xFF8989FF),
        const Color(0xFF7878FF),
        const Color(0xFF6363FF),
        const Color(0xFF4747FF),
        const Color(0xFF0000FF),
        const Color(0xFF4700F8),
        const Color(0xFF6300F0),
        const Color(0xFF7800E9),
        const Color(0xFF8900E1),
        const Color(0xFF9800D8),
        const Color(0xFFA500CF),
        const Color(0xFFB100C6),
        const Color(0xFFBC00BC),
        const Color(0xFFC600B1),
        const Color(0xFFCF00A5),
        const Color(0xFFD80098),
        const Color(0xFFE10089),
        const Color(0xFFE90078),
        const Color(0xFFF00063),
        const Color(0xFFF80047),
        const Color(0xFFFF0000),
        const Color(0xFFFF4700),
        const Color(0xFFFF6300),
        const Color(0xFFFF7800),
        const Color(0xFFFF8900),
        Colors.orange,
        const Color(0xFFFFA500),
        const Color(0xFFFFB100),
        const Color(0xFFFFBC00),
        const Color(0xFFFFC600),
        const Color(0xFFFFCF00),
        const Color(0xFFFFD800),
        const Color(0xFFFFE100),
        const Color(0xFFFFE900),
        const Color(0xFFFFF000),
        const Color(0xFFFFF800),
        const Color(0xFFFFFF00),
      ],
      stops: <double>[
        0.0,
        0.020625,
        0.04125,
        0.061875,
        0.0825,
        0.10312500000000001,
        0.12375,
        0.144375,
        0.165,
        0.185625,
        0.20625000000000002,
        0.22687500000000002,
        0.2475,
        0.268125,
        0.28875,
        0.309375,
        0.33,
        0.350625,
        0.37125,
        0.39187500000000003,
        0.41250000000000003,
        0.43312500000000004,
        0.45375,
        0.474375,
        0.495,
        0.515625,
        0.53625,
        0.556875,
        0.5775,
        0.598125,
        0.61875,
        0.639375,
        0.66,
        0.68125,
        0.7025,
        0.72375,
        0.745,
        0.76625,
        0.7875000000000001,
        0.8087500000000001,
        0.8300000000000001,
        0.8512500000000001,
        0.8725,
        0.89375,
        0.915,
        0.93625,
        0.9575,
        0.97875,
        1.0,
      ],
      tileMode: TileMode.clamp,
    );
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[
              TextSpan(text: 'Basic test of color-interpolation property.'),
            ],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            225.0 - tp.width / 2.0,
            30.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.translate(40.0, 80.0);
    {
      final Paint paint = Paint();
      paint.shader = _grad_gradientDefault.createShader(
        Rect.fromLTWH(0.0, 0.0, 300.0, 40.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 300.0, 40.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 300.0, 40.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.white;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(0.0, -10.0), 3.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawCircle(const Offset(0.0, -10.0), 3.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(const Offset(0.0, -7.0), const Offset(0.0, 40.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF8080FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(48.0, 18.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(48.0, 18.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF8080FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(50.0, 15.0),
        const Offset(50.0, 25.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(100.0, -10.0), 3.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawCircle(const Offset(100.0, -10.0), 3.0, paint);
    }
    canvas.save();
    canvas.translate(100.0, 0.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(const Offset(0.0, -7.0), const Offset(0.0, 40.0), paint);
    }
    canvas.restore();
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF800080);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(148.0, 18.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(148.0, 18.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF800080);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(150.0, 15.0),
        const Offset(150.0, 25.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(200.0, -10.0), 3.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawCircle(const Offset(200.0, -10.0), 3.0, paint);
    }
    canvas.save();
    canvas.translate(200.0, 0.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(const Offset(0.0, -7.0), const Offset(0.0, 40.0), paint);
    }
    canvas.restore();
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF8000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(248.0, 18.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(248.0, 18.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF8000);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(250.0, 15.0),
        const Offset(250.0, 25.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(300.0, -10.0), 3.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawCircle(const Offset(300.0, -10.0), 3.0, paint);
    }
    canvas.save();
    canvas.translate(300.0, 0.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(const Offset(0.0, -7.0), const Offset(0.0, 40.0), paint);
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
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'default (sRGB)')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            310.0,
            20.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.restore();
    canvas.save();
    canvas.translate(40.0, 160.0);
    {
      final Paint paint = Paint();
      paint.shader = _grad_gradientSRGB.createShader(
        Rect.fromLTWH(0.0, 0.0, 300.0, 40.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 300.0, 40.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 300.0, 40.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.white;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(0.0, -10.0), 3.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawCircle(const Offset(0.0, -10.0), 3.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(const Offset(0.0, -7.0), const Offset(0.0, 40.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF8080FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(48.0, 18.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(48.0, 18.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF8080FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(50.0, 15.0),
        const Offset(50.0, 25.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(100.0, -10.0), 3.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawCircle(const Offset(100.0, -10.0), 3.0, paint);
    }
    canvas.save();
    canvas.translate(100.0, 0.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(const Offset(0.0, -7.0), const Offset(0.0, 40.0), paint);
    }
    canvas.restore();
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF800080);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(148.0, 18.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(148.0, 18.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF800080);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(150.0, 15.0),
        const Offset(150.0, 25.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(200.0, -10.0), 3.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawCircle(const Offset(200.0, -10.0), 3.0, paint);
    }
    canvas.save();
    canvas.translate(200.0, 0.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(const Offset(0.0, -7.0), const Offset(0.0, 40.0), paint);
    }
    canvas.restore();
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF8000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(248.0, 18.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(248.0, 18.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF8000);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(250.0, 15.0),
        const Offset(250.0, 25.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(300.0, -10.0), 3.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawCircle(const Offset(300.0, -10.0), 3.0, paint);
    }
    canvas.save();
    canvas.translate(300.0, 0.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(const Offset(0.0, -7.0), const Offset(0.0, 40.0), paint);
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
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'sRGB')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            310.0,
            20.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.restore();
    canvas.save();
    canvas.translate(40.0, 240.0);
    {
      final Paint paint = Paint();
      paint.shader = _grad_gradientLinearRGB.createShader(
        Rect.fromLTWH(0.0, 0.0, 300.0, 40.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 300.0, 40.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 300.0, 40.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.white;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(0.0, -10.0), 3.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawCircle(const Offset(0.0, -10.0), 3.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(const Offset(0.0, -7.0), const Offset(0.0, 40.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF8080FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(48.0, 18.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(48.0, 18.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF8080FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(50.0, 15.0),
        const Offset(50.0, 25.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(100.0, -10.0), 3.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawCircle(const Offset(100.0, -10.0), 3.0, paint);
    }
    canvas.save();
    canvas.translate(100.0, 0.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(const Offset(0.0, -7.0), const Offset(0.0, 40.0), paint);
    }
    canvas.restore();
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF800080);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(148.0, 18.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(148.0, 18.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF800080);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(150.0, 15.0),
        const Offset(150.0, 25.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(200.0, -10.0), 3.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawCircle(const Offset(200.0, -10.0), 3.0, paint);
    }
    canvas.save();
    canvas.translate(200.0, 0.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(const Offset(0.0, -7.0), const Offset(0.0, 40.0), paint);
    }
    canvas.restore();
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF8000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(248.0, 18.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(248.0, 18.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF8000);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(250.0, 15.0),
        const Offset(250.0, 25.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(300.0, -10.0), 3.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawCircle(const Offset(300.0, -10.0), 3.0, paint);
    }
    canvas.save();
    canvas.translate(300.0, 0.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(const Offset(0.0, -7.0), const Offset(0.0, 40.0), paint);
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
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'linearRGB')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            310.0,
            20.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
  bool shouldRepaint(covariant _$PaintingRender01BPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
