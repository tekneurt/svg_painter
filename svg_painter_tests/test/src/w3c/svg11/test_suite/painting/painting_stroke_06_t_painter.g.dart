// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'painting_stroke_06_t_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class PaintingStroke06TPainterWidget extends StatelessWidget {
  const PaintingStroke06TPainterWidget({
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
      label: '\$RCSfile: painting-stroke-06-t.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$PaintingStroke06TPainter(fit: fit),
      ),
    );
  }
}

class _$PaintingStroke06TPainter extends CustomPainter {
  const _$PaintingStroke06TPainter({this.fit = BoxFit.contain});

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
    {
      final Path path = Path()
        ..moveTo(20.0, 20.0)
        ..lineTo(200.0, 20.0);
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
        ..moveTo(20.0, 40.0)
        ..lineTo(200.0, 40.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
        final List<double> dashArray = [0.0, 0.0];
        canvas.drawPath(_dashPath(path, dashArray), paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(20.0, 60.0)
        ..lineTo(200.0, 60.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 20.0;
        final List<double> dashArray = [5.0, 2.0, 5.0, 5.0, 2.0, 5.0];
        canvas.drawPath(_dashPath(path, dashArray), paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(20.0, 60.0)
        ..lineTo(200.0, 60.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
        final List<double> dashArray = [5.0, 2.0, 5.0, 5.0, 2.0, 5.0];
        canvas.drawPath(_dashPath(path, dashArray), paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(20.0, 80.0)
        ..lineTo(200.0, 80.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
        final List<double> dashArray = [2.0, 2.0];
        canvas.drawPath(_dashPath(path, dashArray), paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(20.0, 90.0)
        ..lineTo(200.0, 90.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
        final List<double> dashArray = [2.0, 2.0];
        canvas.drawPath(_dashPath(path, dashArray, dashOffset: 2.0), paint);
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

  Path _dashPath(
    Path source,
    List<double> dashArray, {
    double? pathLength,
    double? dashOffset,
  }) {
    if (dashArray.isEmpty) return source;
    final Path dest = Path();
    for (final metric in source.computeMetrics()) {
      final double scale;
      if (pathLength == null || pathLength <= 0) {
        scale = 1.0;
      } else {
        scale = metric.length / pathLength;
      }
      final double totalLength = dashArray.fold(
        0.0,
        (sum, d) => sum + d * scale,
      );
      if (totalLength <= 0) return source;
      double offset = (dashOffset ?? 0.0) * scale;
      offset = offset % totalLength;
      if (offset < 0) {
        offset += totalLength;
      }
      double remainingPhase = offset;
      int index = 0;
      bool draw = true;
      while (remainingPhase >= dashArray[index] * scale) {
        remainingPhase -= dashArray[index] * scale;
        draw = !draw;
        index = (index + 1) % dashArray.length;
      }
      double distance = 0.0;
      double segmentLen = (dashArray[index] * scale) - remainingPhase;
      while (distance < metric.length) {
        final double len = segmentLen;
        if (len > 0) {
          if (draw) {
            final double end = distance + len < metric.length
                ? distance + len
                : metric.length;
            dest.addPath(metric.extractPath(distance, end), Offset.zero);
          }
          distance += len;
        }
        draw = !draw;
        index = (index + 1) % dashArray.length;
        segmentLen = dashArray[index] * scale;
      }
    }
    return dest;
  }

  @override
  bool shouldRepaint(covariant _$PaintingStroke06TPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
