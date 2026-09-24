// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shapes_intro_02_f_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class ShapesIntro02FPainterWidget extends StatelessWidget {
  const ShapesIntro02FPainterWidget({
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
      label: '\$RCSfile: shapes-intro-02-f.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$ShapesIntro02FPainter(fit: fit),
      ),
    );
  }
}

class _$ShapesIntro02FPainter extends CustomPainter {
  const _$ShapesIntro02FPainter({this.fit = BoxFit.contain});

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
      final Path path = Path()
        ..moveTo(35.0, 25.0)
        ..lineTo(115.0, 25.0)
        ..arcToPoint(
          const Offset(125.0, 45.0),
          radius: const Radius.elliptical(10.0, 20.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        )
        ..lineTo(125.0, 105.0)
        ..arcToPoint(
          const Offset(115.0, 125.0),
          radius: const Radius.elliptical(10.0, 20.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        )
        ..lineTo(35.0, 125.0)
        ..arcToPoint(
          const Offset(25.0, 105.0),
          radius: const Radius.elliptical(10.0, 20.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        )
        ..lineTo(25.0, 45.0)
        ..arcToPoint(
          const Offset(35.0, 25.0),
          radius: const Radius.elliptical(10.0, 20.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        );
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(25.0, 25.0, 100.0, 100.0),
          const Radius.elliptical(10.0, 20.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(130.0, 25.0, 100.0, 100.0),
          const Radius.elliptical(10.0, 20.0),
        ),
        paint,
      );
    }
    {
      final Path path = Path()
        ..moveTo(140.0, 25.0)
        ..lineTo(220.0, 25.0)
        ..arcToPoint(
          const Offset(230.0, 45.0),
          radius: const Radius.elliptical(10.0, 20.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        )
        ..lineTo(230.0, 105.0)
        ..arcToPoint(
          const Offset(220.0, 125.0),
          radius: const Radius.elliptical(10.0, 20.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        )
        ..lineTo(140.0, 125.0)
        ..arcToPoint(
          const Offset(130.0, 105.0),
          radius: const Radius.elliptical(10.0, 20.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        )
        ..lineTo(130.0, 45.0)
        ..arcToPoint(
          const Offset(140.0, 25.0),
          radius: const Radius.elliptical(10.0, 20.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        );
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(300.0, 125.0)
        ..arcToPoint(
          const Offset(299.9999, 125.0),
          radius: const Radius.elliptical(50.0, 50.0),
          rotation: 0.0,
          largeArc: true,
          clockwise: false,
        );
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(300.0, 75.0), 50.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(401.0, 75.0), 50.0, paint);
    }
    {
      final Path path = Path()
        ..moveTo(401.0, 125.0)
        ..arcToPoint(
          const Offset(400.9999, 125.0),
          radius: const Radius.elliptical(50.0, 50.0),
          rotation: 0.0,
          largeArc: true,
          clockwise: false,
        );
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(60.0, 305.0)
        ..arcToPoint(
          const Offset(59.9999, 305.0),
          radius: const Radius.elliptical(50.0, 80.0),
          rotation: 0.0,
          largeArc: true,
          clockwise: false,
        )
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
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawOval(Rect.fromLTWH(10.0, 145.0, 100.0, 160.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawOval(Rect.fromLTWH(111.0, 145.0, 100.0, 160.0), paint);
    }
    {
      final Path path = Path()
        ..moveTo(161.0, 305.0)
        ..arcToPoint(
          const Offset(160.9999, 305.0),
          radius: const Radius.elliptical(50.0, 80.0),
          rotation: 0.0,
          largeArc: true,
          clockwise: false,
        )
        ..close();
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(220.0, 150.0)
        ..lineTo(270.0, 200.0)
        ..lineTo(220.0, 250.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(220.0, 150.0)
        ..lineTo(270.0, 200.0)
        ..lineTo(220.0, 250.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(270.0, 150.0)
        ..lineTo(320.0, 200.0)
        ..lineTo(270.0, 250.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(270.0, 150.0)
        ..lineTo(320.0, 200.0)
        ..lineTo(270.0, 250.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(350.0, 250.0)
        ..lineTo(350.0, 350.0)
        ..lineTo(400.0, 350.0)
        ..lineTo(400.0, 250.0)
        ..lineTo(450.0, 250.0)
        ..lineTo(450.0, 350.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(350.0, 250.0)
        ..lineTo(350.0, 350.0)
        ..lineTo(400.0, 350.0)
        ..lineTo(400.0, 250.0)
        ..lineTo(450.0, 250.0)
        ..lineTo(450.0, 350.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(350.0, 135.0)
        ..lineTo(350.0, 235.0)
        ..lineTo(400.0, 235.0)
        ..lineTo(400.0, 135.0)
        ..lineTo(450.0, 135.0)
        ..lineTo(450.0, 235.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(350.0, 135.0)
        ..lineTo(350.0, 235.0)
        ..lineTo(400.0, 235.0)
        ..lineTo(400.0, 135.0)
        ..lineTo(450.0, 135.0)
        ..lineTo(450.0, 235.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(225.0, 275.0)
        ..lineTo(325.0, 275.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 10.0;
      canvas.drawLine(
        const Offset(225.0, 275.0),
        const Offset(325.0, 275.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 10.0;
      canvas.drawLine(
        const Offset(225.0, 325.0),
        const Offset(325.0, 325.0),
        paint,
      );
    }
    {
      final Path path = Path()
        ..moveTo(225.0, 325.0)
        ..lineTo(325.0, 325.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
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
              fontSize: 32.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
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
  bool shouldRepaint(covariant _$ShapesIntro02FPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
