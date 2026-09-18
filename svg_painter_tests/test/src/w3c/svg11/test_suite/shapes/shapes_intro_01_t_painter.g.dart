// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shapes_intro_01_t_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class ShapesIntro01TPainterWidget extends StatelessWidget {
  const ShapesIntro01TPainterWidget({
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
      label: '\$RCSfile: shapes-intro-01-t.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$ShapesIntro01TPainter(fit: fit),
      ),
    );
  }
}

class _$ShapesIntro01TPainter extends CustomPainter {
  const _$ShapesIntro01TPainter({this.fit = BoxFit.contain});

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
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(50.0, 50.0, 35.0, 60.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(50.0, 155.0, 35.0, 60.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(130.0, 50.0, 35.0, 60.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(130.0, 155.0, 35.0, 60.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(210.0, 50.0, 60.0, 60.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(210.0, 155.0, 60.0, 60.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(315.0, 50.0, 35.0, 60.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(315.0, 155.0, 35.0, 60.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(394.0, 50.0, 35.0, 60.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(394.0, 155.0, 35.0, 60.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(235.0, 260.0, 10.0, 10.0), paint);
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
              fontSize: 8.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'Arial',
            ),
            children: <InlineSpan>[TextSpan(text: 'Stroked')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            5.0,
            90.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 8.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'Arial',
            ),
            children: <InlineSpan>[TextSpan(text: 'Unstroked')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            5.0,
            195.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 8.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'Arial',
            ),
            children: <InlineSpan>[TextSpan(text: 'Zero width rect')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            50.0,
            135.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 8.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'Arial',
            ),
            children: <InlineSpan>[TextSpan(text: 'Zero height rect')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            130.0,
            135.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 8.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'Arial',
            ),
            children: <InlineSpan>[TextSpan(text: 'Zero radius circle')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            210.0,
            135.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 8.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'Arial',
            ),
            children: <InlineSpan>[TextSpan(text: 'Zero x radius ellipse')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            315.0,
            135.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 8.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'Arial',
            ),
            children: <InlineSpan>[TextSpan(text: 'Zero y radius ellipse')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            394.0,
            135.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 8.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'Arial',
            ),
            children: <InlineSpan>[TextSpan(text: 'Zero length line')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            235.0,
            290.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(240.0, 265.0),
        const Offset(240.0, 265.0),
        paint,
      );
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
              fontFamily: 'SVGFreeSansASCII,sans-serif',
            ),
            children: <InlineSpan>[TextSpan(text: '\$Revision: 1.4 \$')],
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
  bool shouldRepaint(covariant _$ShapesIntro01TPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
