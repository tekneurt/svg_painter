// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paths_data_05_t_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class PathsData05TPainterWidget extends StatelessWidget {
  const PathsData05TPainterWidget({
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
      label: '\$RCSfile: paths-data-05-t.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$PathsData05TPainter(fit: fit),
      ),
    );
  }
}

class _$PathsData05TPainter extends CustomPainter {
  const _$PathsData05TPainter({this.fit = BoxFit.contain});

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
    canvas.scale(1.8, 1.8);
    canvas.translate(0.0, -150.0);
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
            children: <InlineSpan>[TextSpan(text: 'm, l, l, l, z,')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            96.0,
            180.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'subpath')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            100.0,
            194.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'm, l, l, l, z')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            97.0,
            208.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(62.0, 190.0)
        ..lineTo(113.96152000000001, 280.0)
        ..lineTo(10.038480000000007, 280.0)
        ..lineTo(62.00000000000001, 190.0)
        ..close()
        ..moveTo(62.0, 205.0)
        ..lineTo(100.97113999999999, 272.5)
        ..lineTo(23.058859999999996, 272.5)
        ..lineTo(62.029999999999994, 205.0)
        ..close();
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
      paint.color = const Color(0xFF40DD20);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(60.0, 188.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF40DD20);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(111.96152, 278.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF40DD20);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(8.03848, 278.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF40DD20);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(60.0, 203.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF40DD20);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(98.97114, 270.5, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF40DD20);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(21.02886, 270.5, 4.0, 4.0), paint);
    }
    {
      final Path path = Path()
        ..moveTo(177.0, 190.0)
        ..lineTo(228.96152, 280.0)
        ..lineTo(125.03848, 280.0)
        ..lineTo(177.0, 190.0)
        ..close()
        ..moveTo(177.0, 205.0)
        ..lineTo(215.97114, 272.5)
        ..lineTo(138.05885999999998, 272.5)
        ..lineTo(177.02999999999997, 205.0)
        ..close();
      path.fillType = PathFillType.evenOdd;
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF006000);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF40DD20);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(175.0, 188.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF40DD20);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(226.96152, 278.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF40DD20);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(123.03848, 278.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF40DD20);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(175.0, 203.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF40DD20);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(213.97114, 270.5, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF40DD20);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(136.02886, 270.5, 4.0, 4.0), paint);
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
  bool shouldRepaint(covariant _$PathsData05TPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
