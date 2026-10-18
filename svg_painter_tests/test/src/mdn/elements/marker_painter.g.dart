// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marker_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class MarkerPainterWidget extends StatelessWidget {
  const MarkerPainterWidget({
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
      size: Size(width ?? 300.0, height ?? 100.0),
      painter: _$MarkerPainter(fit: fit),
    );
  }
}

class _$MarkerPainter extends CustomPainter {
  const _$MarkerPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(300.0, 100.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(300.0, 100.0),
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

    void _marker_arrow(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      if (isStart) {
        canvas.rotate(tangentAngle + 3.141592653589793);
      } else {
        canvas.rotate(tangentAngle);
      }
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-3.0, -3.0);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 6.0, 6.0));
      canvas.scale(0.6, 0.6);
      {
        final Path path = Path()
          ..moveTo(0.0, 0.0)
          ..lineTo(10.0, 5.0)
          ..lineTo(0.0, 10.0)
          ..close();
        {
          final Paint paint = Paint();
          paint.color = Colors.black;
          paint.style = PaintingStyle.fill;
          canvas.drawPath(path, paint);
        }
      }
      canvas.restore();
    }

    {
      final Paint strokePaint = Paint();
      {
        strokePaint.color = Colors.black;
        strokePaint.style = PaintingStyle.stroke;
        strokePaint.strokeWidth = 1.0;
      }
      canvas.drawLine(
        const Offset(10.0, 10.0),
        const Offset(90.0, 90.0),
        strokePaint,
      );
      _marker_arrow(
        canvas,
        const Offset(90.0, 90.0),
        0.7853981633974483,
        1.0,
        contextStroke: strokePaint,
      );
    }
    {
      final Path path = Path()
        ..moveTo(110.0, 10.0)
        ..cubicTo(120.0, 20.0, 130.0, 20.0, 140.0, 10.0)
        ..cubicTo(150.0, 0.0, 160.0, 0.0, 170.0, 10.0)
        ..cubicTo(180.0, 20.0, 190.0, 20.0, 200.0, 10.0);
      {
        final Paint strokePaint = Paint();
        {
          strokePaint.color = Colors.black;
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 1.0;
        }
        canvas.drawPath(path, strokePaint);
        _marker_arrow(
          canvas,
          const Offset(110.0, 10.0),
          0.7853981633974483,
          1.0,
          isStart: true,
          contextStroke: strokePaint,
        );
        _marker_arrow(
          canvas,
          const Offset(140.0, 10.0),
          -0.7853981633974482,
          1.0,
          contextStroke: strokePaint,
        );
        _marker_arrow(
          canvas,
          const Offset(170.0, 10.0),
          0.7853981633974482,
          1.0,
          contextStroke: strokePaint,
        );
        _marker_arrow(
          canvas,
          const Offset(200.0, 10.0),
          -0.7853981633974483,
          1.0,
          contextStroke: strokePaint,
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

  @override
  bool shouldRepaint(covariant _$MarkerPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
