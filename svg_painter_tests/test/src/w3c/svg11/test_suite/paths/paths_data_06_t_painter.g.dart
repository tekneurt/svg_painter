// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paths_data_06_t_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class PathsData06TPainterWidget extends StatelessWidget {
  const PathsData06TPainterWidget({
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
      label: '\$RCSfile: paths-data-06-t.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$PathsData06TPainter(fit: fit),
      ),
    );
  }
}

class _$PathsData06TPainter extends CustomPainter {
  const _$PathsData06TPainter({this.fit = BoxFit.contain});

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
    canvas.translate(-200.0, 0.0);
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
            children: <InlineSpan>[TextSpan(text: 'M, H, V, H,')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            288.0,
            30.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
            children: <InlineSpan>[TextSpan(text: 'V. H, V, H,')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            288.0,
            46.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
            children: <InlineSpan>[TextSpan(text: 'V, Z')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            304.0,
            62.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(240.0, 56.0)
        ..lineTo(270.0, 56.0)
        ..lineTo(270.0, 86.0)
        ..lineTo(300.0, 86.0)
        ..lineTo(300.0, 116.0)
        ..lineTo(330.0, 116.0)
        ..lineTo(330.0, 146.0)
        ..lineTo(240.0, 146.0)
        ..lineTo(240.0, 56.0)
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
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(238.0, 54.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(268.0, 54.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(268.0, 84.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(298.0, 84.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(298.0, 114.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(328.0, 114.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(328.0, 144.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(238.0, 144.0, 4.0, 4.0), paint);
    }
    {
      final Path path = Path()
        ..moveTo(350.0, 56.0)
        ..lineTo(380.0, 56.0)
        ..lineTo(380.0, 86.0)
        ..lineTo(410.0, 86.0)
        ..lineTo(410.0, 116.0)
        ..lineTo(440.0, 116.0)
        ..lineTo(440.0, 146.0)
        ..lineTo(350.0, 146.0)
        ..lineTo(350.0, 56.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(348.0, 54.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(378.0, 54.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(378.0, 84.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(408.0, 84.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(408.0, 114.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(438.0, 114.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(438.0, 144.0, 4.0, 4.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(348.0, 144.0, 4.0, 4.0), paint);
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
  bool shouldRepaint(covariant _$PathsData06TPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
