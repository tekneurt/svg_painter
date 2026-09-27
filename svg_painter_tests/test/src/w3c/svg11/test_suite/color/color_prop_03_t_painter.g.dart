// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_prop_03_t_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class ColorProp03TPainterWidget extends StatelessWidget {
  const ColorProp03TPainterWidget({
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
      label: '\$RCSfile: color-prop-03-t.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$ColorProp03TPainter(fit: fit),
      ),
    );
  }
}

class _$ColorProp03TPainter extends CustomPainter {
  const _$ColorProp03TPainter({this.fit = BoxFit.contain});

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
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(75.0, 40.0), 20.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(115.0, 40.0), 20.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(75.0, 80.0), 20.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(115.0, 80.0), 20.0, paint);
    }
    {
      final Path path = Path()
        ..moveTo(95.0, 40.0)
        ..lineTo(115.0, 60.0)
        ..lineTo(95.0, 80.0)
        ..lineTo(75.0, 60.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(200.0, 40.0), 20.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(240.0, 40.0), 20.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(200.0, 80.0), 20.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(240.0, 80.0), 20.0, paint);
    }
    {
      final Path path = Path()
        ..moveTo(220.0, 40.0)
        ..lineTo(240.0, 60.0)
        ..lineTo(220.0, 80.0)
        ..lineTo(200.0, 60.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF00FF00);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(325.0, 40.0), 20.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(365.0, 40.0), 20.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(325.0, 80.0), 20.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(365.0, 80.0), 20.0, paint);
    }
    {
      final Path path = Path()
        ..moveTo(345.0, 40.0)
        ..lineTo(365.0, 60.0)
        ..lineTo(345.0, 80.0)
        ..lineTo(325.0, 60.0)
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
      paint.color = const Color(0xFFAA0011);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(75.0, 135.0), 20.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFAA0011);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(115.0, 135.0), 20.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFAA0011);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(75.0, 175.0), 20.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFAA0011);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(115.0, 175.0), 20.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF33BB33);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(200.0, 135.0), 20.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF33BB33);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(240.0, 135.0), 20.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF33BB33);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(200.0, 175.0), 20.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF33BB33);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(240.0, 175.0), 20.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF5577EE);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(325.0, 135.0), 20.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF5577EE);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(365.0, 135.0), 20.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF5577EE);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(325.0, 175.0), 20.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF5577EE);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(365.0, 175.0), 20.0, paint);
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
  bool shouldRepaint(covariant _$ColorProp03TPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
