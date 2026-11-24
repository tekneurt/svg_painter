// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coords_transformattr_02_f_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, unused_local_variable, deprecated_member_use_from_same_package

class CoordsTransformattr02FPainterWidget extends StatelessWidget {
  const CoordsTransformattr02FPainterWidget({
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
      label: '\$RCSfile: coords-transformattr-02-f.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$CoordsTransformattr02FPainter(fit: fit),
      ),
    );
  }
}

class _$CoordsTransformattr02FPainter extends CustomPainter {
  const _$CoordsTransformattr02FPainter({this.fit = BoxFit.contain});

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
    canvas.translate(150.0, 0.0);
    canvas.save();
    canvas.translate(-10.0, -20.0);
    canvas.scale(2.0, 2.0);
    canvas.rotate(0.7853981633974483);
    canvas.translate(5.0, 10.0);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 50.0, 50.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(50.0, 50.0), 25.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 10.0;
      canvas.drawLine(
        const Offset(50.0, 50.0),
        const Offset(100.0, 100.0),
        paint,
      );
    }
    canvas.restore();
    canvas.save();
    canvas.translate(-10.0, -20.0);
    canvas.save();
    canvas.scale(2.0, 2.0);
    canvas.save();
    canvas.rotate(0.7853981633974483);
    canvas.save();
    canvas.translate(5.0, 10.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 50.0, 50.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(50.0, 50.0), 25.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 10.0;
      canvas.drawLine(
        const Offset(50.0, 50.0),
        const Offset(100.0, 100.0),
        paint,
      );
    }
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(200.0, 0.0);
    canvas.save();
    canvas.translate(-10.0, -20.0);
    canvas.save();
    canvas.scale(2.0, 2.0);
    canvas.save();
    canvas.rotate(0.7853981633974483);
    canvas.save();
    canvas.translate(5.0, 10.0);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 50.0, 50.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(50.0, 50.0), 25.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 10.0;
      canvas.drawLine(
        const Offset(50.0, 50.0),
        const Offset(100.0, 100.0),
        paint,
      );
    }
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(-10.0, -20.0);
    canvas.scale(2.0, 2.0);
    canvas.rotate(0.7853981633974483);
    canvas.translate(5.0, 10.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 50.0, 50.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(50.0, 50.0), 25.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 10.0;
      canvas.drawLine(
        const Offset(50.0, 50.0),
        const Offset(100.0, 100.0),
        paint,
      );
    }
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
  bool shouldRepaint(covariant _$CoordsTransformattr02FPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
