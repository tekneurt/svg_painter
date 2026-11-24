// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coords_viewattr_03_b_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, unused_local_variable, deprecated_member_use_from_same_package

class CoordsViewattr03BPainterWidget extends StatelessWidget {
  const CoordsViewattr03BPainterWidget({
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
      label: '\$RCSfile: coords-viewattr-03-b.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$CoordsViewattr03BPainter(fit: fit),
      ),
    );
  }
}

class _$CoordsViewattr03BPainter extends CustomPainter {
  const _$CoordsViewattr03BPainter({this.fit = BoxFit.contain});

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
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[
              TextSpan(text: '<svg> \'viewBox\' attribute'),
            ],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            240.0 - tp.width / 2.0,
            28.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.translate(35.0, 50.0);
    canvas.save();
    canvas.scale(0.5, 0.5);
    {
      final Path path = Path()
        ..moveTo(20.0, 20.0)
        ..quadraticBezierTo(180.0, 20.0, 180.0, 180.0)
        ..quadraticBezierTo(20.0, 180.0, 20.0, 20.0)
        ..close()
        ..moveTo(20.0, 180.0)
        ..quadraticBezierTo(20.0, 20.0, 180.0, 20.0)
        ..quadraticBezierTo(180.0, 180.0, 20.0, 180.0)
        ..close()
        ..moveTo(100.0, 40.0)
        ..lineTo(160.0, 100.0)
        ..lineTo(100.0, 160.0)
        ..lineTo(40.0, 100.0)
        ..close();
      path.fillType = PathFillType.evenOdd;
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFADD8E6);
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
              fontSize: 13.5,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'viewBox="0 0 200 200"')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            85.0 - tp.width / 2.0,
            155.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 13.5,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'overflow="visible"')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            85.0 - tp.width / 2.0,
            170.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.translate(35.0, 180.0);
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 100.0, 100.0));
    canvas.save();
    canvas.scale(0.5, 0.5);
    {
      final Path path = Path()
        ..moveTo(20.0, 20.0)
        ..quadraticBezierTo(180.0, 20.0, 180.0, 180.0)
        ..quadraticBezierTo(20.0, 180.0, 20.0, 20.0)
        ..close()
        ..moveTo(20.0, 180.0)
        ..quadraticBezierTo(20.0, 20.0, 180.0, 20.0)
        ..quadraticBezierTo(180.0, 180.0, 20.0, 180.0)
        ..close()
        ..moveTo(100.0, 40.0)
        ..lineTo(160.0, 100.0)
        ..lineTo(100.0, 160.0)
        ..lineTo(40.0, 100.0)
        ..close();
      path.fillType = PathFillType.evenOdd;
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFADD8E6);
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
              fontSize: 13.5,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'viewBox="0 0 200 200"')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            85.0 - tp.width / 2.0,
            285.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 13.5,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'overflow="hidden"')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            85.0 - tp.width / 2.0,
            300.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.translate(190.0, 50.0);
    canvas.save();
    canvas.scale(0.5, 0.5);
    {
      final Path path = Path()
        ..moveTo(20.0, 20.0)
        ..quadraticBezierTo(180.0, 20.0, 180.0, 180.0)
        ..quadraticBezierTo(20.0, 180.0, 20.0, 20.0)
        ..close()
        ..moveTo(20.0, 180.0)
        ..quadraticBezierTo(20.0, 20.0, 180.0, 20.0)
        ..quadraticBezierTo(180.0, 180.0, 20.0, 180.0)
        ..close()
        ..moveTo(100.0, 40.0)
        ..lineTo(160.0, 100.0)
        ..lineTo(100.0, 160.0)
        ..lineTo(40.0, 100.0)
        ..close();
      path.fillType = PathFillType.evenOdd;
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFADD8E6);
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
              fontSize: 13.5,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'viewBox="0,0,200,200"')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            240.0 - tp.width / 2.0,
            155.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 13.5,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'overflow="visible"')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            240.0 - tp.width / 2.0,
            170.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.translate(190.0, 180.0);
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 100.0, 100.0));
    canvas.save();
    canvas.scale(0.5, 0.5);
    {
      final Path path = Path()
        ..moveTo(20.0, 20.0)
        ..quadraticBezierTo(180.0, 20.0, 180.0, 180.0)
        ..quadraticBezierTo(20.0, 180.0, 20.0, 20.0)
        ..close()
        ..moveTo(20.0, 180.0)
        ..quadraticBezierTo(20.0, 20.0, 180.0, 20.0)
        ..quadraticBezierTo(180.0, 180.0, 20.0, 180.0)
        ..close()
        ..moveTo(100.0, 40.0)
        ..lineTo(160.0, 100.0)
        ..lineTo(100.0, 160.0)
        ..lineTo(40.0, 100.0)
        ..close();
      path.fillType = PathFillType.evenOdd;
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFADD8E6);
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
              fontSize: 13.5,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'viewBox="0,0,200,200"')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            240.0 - tp.width / 2.0,
            285.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 13.5,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'overflow="hidden"')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            240.0 - tp.width / 2.0,
            300.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.translate(345.0, 50.0);
    canvas.save();
    canvas.scale(0.5, 0.5);
    {
      final Path path = Path()
        ..moveTo(20.0, 20.0)
        ..quadraticBezierTo(180.0, 20.0, 180.0, 180.0)
        ..quadraticBezierTo(20.0, 180.0, 20.0, 20.0)
        ..close()
        ..moveTo(20.0, 180.0)
        ..quadraticBezierTo(20.0, 20.0, 180.0, 20.0)
        ..quadraticBezierTo(180.0, 180.0, 20.0, 180.0)
        ..close()
        ..moveTo(100.0, 40.0)
        ..lineTo(160.0, 100.0)
        ..lineTo(100.0, 160.0)
        ..lineTo(40.0, 100.0)
        ..close();
      path.fillType = PathFillType.evenOdd;
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFADD8E6);
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
              fontSize: 13.5,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'viewBox="0,0, 200, 200"')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            395.0 - tp.width / 2.0,
            155.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 13.5,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'overflow="visible"')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            395.0 - tp.width / 2.0,
            170.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.translate(345.0, 180.0);
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 100.0, 100.0));
    canvas.save();
    canvas.scale(0.5, 0.5);
    {
      final Path path = Path()
        ..moveTo(20.0, 20.0)
        ..quadraticBezierTo(180.0, 20.0, 180.0, 180.0)
        ..quadraticBezierTo(20.0, 180.0, 20.0, 20.0)
        ..close()
        ..moveTo(20.0, 180.0)
        ..quadraticBezierTo(20.0, 20.0, 180.0, 20.0)
        ..quadraticBezierTo(180.0, 180.0, 20.0, 180.0)
        ..close()
        ..moveTo(100.0, 40.0)
        ..lineTo(160.0, 100.0)
        ..lineTo(100.0, 160.0)
        ..lineTo(40.0, 100.0)
        ..close();
      path.fillType = PathFillType.evenOdd;
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFADD8E6);
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
              fontSize: 13.5,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'viewBox="0,0, 200, 200"')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            395.0 - tp.width / 2.0,
            285.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 13.5,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'overflow="hidden"')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            395.0 - tp.width / 2.0,
            300.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
  bool shouldRepaint(covariant _$CoordsViewattr03BPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
