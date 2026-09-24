// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'painting_stroke_08_t_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class PaintingStroke08TPainterWidget extends StatelessWidget {
  const PaintingStroke08TPainterWidget({
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
      label: '\$RCSfile: painting-stroke-08-t.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$PaintingStroke08TPainter(fit: fit),
      ),
    );
  }
}

class _$PaintingStroke08TPainter extends CustomPainter {
  const _$PaintingStroke08TPainter({this.fit = BoxFit.contain});

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
    canvas.translate(50.0, 0.0);
    canvas.scale(1.7, 1.7);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF6666);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(200.0, 20.0), 5.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF6666);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(200.0, 40.0), 5.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF6666);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(200.0, 60.0), 5.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF6666);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(200.0, 80.0), 5.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(200.0, 80.0), 5.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(200.0, 100.0), 5.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(200.0, 120.0), 5.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(200.0, 140.0), 5.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF66FF33);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(200.0, 160.0), 5.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF66FF33);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(200.0, 180.0), 5.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF66FF33);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(200.0, 200.0), 5.0, paint);
    }
    {
      final Path path = Path()
        ..moveTo(20.0, 20.0)
        ..lineTo(200.0, 20.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0x000000FF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(20.0, 40.0)
        ..lineTo(200.0, 40.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0x000000FF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(20.0, 60.0)
        ..lineTo(200.0, 60.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0x000000FF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(20.0, 80.0)
        ..lineTo(200.0, 80.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0x330000FF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(20.0, 100.0)
        ..lineTo(200.0, 100.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0x660000FF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(20.0, 120.0)
        ..lineTo(200.0, 120.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0x990000FF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(20.0, 140.0)
        ..lineTo(200.0, 140.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xCC0000FF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(20.0, 160.0)
        ..lineTo(200.0, 160.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(20.0, 180.0)
        ..lineTo(200.0, 180.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(20.0, 200.0)
        ..lineTo(200.0, 200.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
        canvas.drawPath(path, paint);
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
  bool shouldRepaint(covariant _$PaintingStroke08TPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
