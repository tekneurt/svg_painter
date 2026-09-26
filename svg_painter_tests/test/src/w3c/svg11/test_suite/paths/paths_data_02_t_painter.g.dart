// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paths_data_02_t_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class PathsData02TPainterWidget extends StatelessWidget {
  const PathsData02TPainterWidget({
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
      label: '\$RCSfile: paths-data-02-t.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$PathsData02TPainter(fit: fit),
      ),
    );
  }
}

class _$PathsData02TPainter extends CustomPainter {
  const _$PathsData02TPainter({this.fit = BoxFit.contain});

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

    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[
              TextSpan(text: 'Quadric bezier curves drawn with commands:'),
            ],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            120.0,
            14.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(15.0, 20.0)
        ..quadraticBezierTo(30.0, 120.0, 130.0, 30.0)
        ..moveTo(180.0, 80.0)
        ..quadraticBezierTo(105.0, -20.0, 17.0, 20.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 3.0;
        canvas.drawPath(path, paint);
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
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'M, Q, M, q, z')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            80.0,
            86.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00C000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(13.0, 18.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00C000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(128.0, 28.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00C000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(178.0, 78.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00C000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(15.0, 18.0, 4.0, 4.0), paint);
    }
    {
      final Path path = Path()
        ..moveTo(372.0, 130.0)
        ..quadraticBezierTo(272.0, 50.0, 422.0, 10.0)
        ..close()
        ..moveTo(442.0, 130.0)
        ..quadraticBezierTo(492.0, -20.0, 362.0, 40.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFFF00);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000CF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
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
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'm, q, z, m, q, z')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            352.0,
            150.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(370.0, 128.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(420.0, 8.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(440.0, 128.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(360.0, 38.0, 4.0, 4.0), paint);
    }
    {
      final Path path = Path()
        ..moveTo(224.0, 103.0)
        ..quadraticBezierTo(234.0, -12.0, 304.0, 33.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF00FFFF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
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
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'M, Q, Z')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            192.0,
            36.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(222.0, 101.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(302.0, 31.0, 4.0, 4.0), paint);
    }
    {
      final Path path = Path()
        ..moveTo(208.0, 168.0)
        ..quadraticBezierTo(258.0, 268.0, 308.0, 168.0)
        ..quadraticBezierTo(358.0, 68.0, 258.0, 118.0)
        ..quadraticBezierTo(128.0, 88.0, 208.0, 168.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF00C000);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
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
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'M, Q, T, Q, z')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            308.0,
            188.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(206.0, 166.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(306.0, 166.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(256.0, 116.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(206.0, 206.0, 4.0, 4.0), paint);
    }
    {
      final Path path = Path()
        ..moveTo(60.0, 100.0)
        ..quadraticBezierTo(-40.0, 150.0, 60.0, 200.0)
        ..quadraticBezierTo(160.0, 150.0, 60.0, 100.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF00CF00);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
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
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'M, Q, Q, z')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            80.0,
            200.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(58.0, 98.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(58.0, 198.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(58.0, 98.0, 4.0, 4.0), paint);
    }
    {
      final Path path = Path()
        ..moveTo(240.0, 296.0)
        ..quadraticBezierTo(265.0, 196.0, 287.0, 296.0)
        ..quadraticBezierTo(309.0, 396.0, 334.0, 296.0)
        ..quadraticBezierTo(359.0, 196.0, 381.0, 296.0)
        ..quadraticBezierTo(403.0, 396.0, 428.0, 296.0)
        ..quadraticBezierTo(453.0, 196.0, 475.0, 296.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF40DD20);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
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
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'M, q, t, t, t, t, z')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            380.0,
            236.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(238.0, 294.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(285.0, 294.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(332.0, 294.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(379.0, 294.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(426.0, 294.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(473.0, 294.0, 4.0, 4.0), paint);
    }
    {
      final Path path = Path()
        ..moveTo(172.0, 193.0)
        ..quadraticBezierTo(72.0, 243.0, 172.0, 243.0)
        ..quadraticBezierTo(72.0, 243.0, 172.0, 293.0)
        ..quadraticBezierTo(272.0, 243.0, 172.0, 243.0)
        ..quadraticBezierTo(272.0, 243.0, 172.0, 193.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000C0);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF00CF00);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 2.0;
        canvas.drawPath(path, paint);
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
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'M, q, Q, q, Q, z')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            48.0,
            280.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF40DD20);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(170.0, 191.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF40DD20);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(170.0, 241.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF40DD20);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(170.0, 291.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF40DD20);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(170.0, 241.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF40DD20);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(170.0, 191.0, 4.0, 4.0), paint);
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
  bool shouldRepaint(covariant _$PathsData02TPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
