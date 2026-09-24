// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dx_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class DxPainterWidget extends StatelessWidget {
  const DxPainterWidget({
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
      size: Size(width ?? 100.0, height ?? 100.0),
      painter: _$DxPainter(fit: fit),
    );
  }
}

class _$DxPainter extends CustomPainter {
  const _$DxPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(100.0, 100.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(100.0, 100.0),
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
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 0.5;
      final List<double> dashArray = [3.0, 3.0];
      {
        final Path path = Path()
          ..moveTo(0.0, 50.0)
          ..lineTo(100.0, 50.0);
        canvas.drawPath(_dashPath(path, dashArray), paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 0.5;
      final List<double> dashArray = [3.0, 3.0];
      {
        final Path path = Path()
          ..moveTo(10.0, 0.0)
          ..lineTo(10.0, 100.0);
        canvas.drawPath(_dashPath(path, dashArray), paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 0.5;
      final List<double> dashArray = [3.0, 3.0];
      {
        final Path path = Path()
          ..moveTo(60.0, 0.0)
          ..lineTo(60.0, 100.0);
        canvas.drawPath(_dashPath(path, dashArray), paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF808080);
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: const Color(0xFF808080),
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'Tinos',
              package: 'svg_painter',
            ),
            children: <InlineSpan>[TextSpan(text: 'SVG')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            10.0,
            50.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'Tinos',
              package: 'svg_painter',
            ),
            children: <InlineSpan>[TextSpan(text: 'SVG')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            60.0,
            50.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
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
  bool shouldRepaint(covariant _$DxPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
