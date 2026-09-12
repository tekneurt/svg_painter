// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stroke_dashoffset_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class StrokeDashoffsetPainterWidget extends StatelessWidget {
  const StrokeDashoffsetPainterWidget({
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
    return CustomPaint(
      size: Size(width ?? 33.0, height ?? 10.0),
      painter: _$StrokeDashoffsetPainter(fit: fit),
    );
  }
}

class _$StrokeDashoffsetPainter extends CustomPainter {
  const _$StrokeDashoffsetPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(33.0, 10.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(33.0, 10.0),
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
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 33.0, 10.0));
    canvas.save();
    canvas.translate(3.0, -0.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(const Offset(0.0, 1.0), const Offset(30.0, 1.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      final List<double> dashArray = [3.0, 1.0];
      {
        final Path path = Path()
          ..moveTo(0.0, 3.0)
          ..lineTo(30.0, 3.0);
        canvas.drawPath(_dashPath(path, dashArray), paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      final List<double> dashArray = [3.0, 1.0];
      {
        final Path path = Path()
          ..moveTo(0.0, 5.0)
          ..lineTo(30.0, 5.0);
        canvas.drawPath(_dashPath(path, dashArray, dashOffset: 3.0), paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      final List<double> dashArray = [3.0, 1.0];
      {
        final Path path = Path()
          ..moveTo(0.0, 7.0)
          ..lineTo(30.0, 7.0);
        canvas.drawPath(_dashPath(path, dashArray, dashOffset: -3.0), paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      final List<double> dashArray = [3.0, 1.0];
      {
        final Path path = Path()
          ..moveTo(0.0, 9.0)
          ..lineTo(30.0, 9.0);
        canvas.drawPath(_dashPath(path, dashArray, dashOffset: 1.0), paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(0.0, 5.0)
        ..lineTo(-3.0, 5.0)
        ..moveTo(0.0, 7.0)
        ..lineTo(3.0, 7.0)
        ..moveTo(0.0, 9.0)
        ..lineTo(-1.0, 9.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0x80FF0000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    canvas.restore();
    canvas.restore();
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
        (final sum, final d) => sum + d * scale,
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
  bool shouldRepaint(covariant _$StrokeDashoffsetPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
