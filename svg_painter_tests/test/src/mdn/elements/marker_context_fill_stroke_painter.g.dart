// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marker_context_fill_stroke_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class MarkerContextFillStrokePainterWidget extends StatelessWidget {
  const MarkerContextFillStrokePainterWidget({
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
      size: Size(width ?? 50.0, height ?? 50.0),
      painter: _$MarkerContextFillStrokePainter(fit: fit),
    );
  }
}

class _$MarkerContextFillStrokePainter extends CustomPainter {
  const _$MarkerContextFillStrokePainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(50.0, 50.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(50.0, 50.0),
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

    void _marker_circle(
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
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-3.0, -3.0);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 6.0, 6.0));
      {
        final Paint paint = Paint();
        if (contextFill != null) {
          paint.color = contextFill.color;
          paint.shader = contextFill.shader;
        } else {
          paint.color = const Color(0x00000000);
        }
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(3.0, 3.0), 2.0, paint);
      }
      {
        final Paint paint = Paint();
        if (contextStroke != null) {
          paint.color = contextStroke.color;
          paint.shader = contextStroke.shader;
        } else {
          paint.color = const Color(0x00000000);
        }
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawCircle(const Offset(3.0, 3.0), 2.0, paint);
      }
      canvas.restore();
    }

    {
      final Path path = Path()
        ..moveTo(10.0, 10.0)
        ..lineTo(30.0, 10.0)
        ..lineTo(40.0, 10.0);
      {
        final Paint fillPaint = Paint();
        {
          fillPaint.color = Colors.black;
          fillPaint.style = PaintingStyle.fill;
        }
        final Paint strokePaint = Paint();
        {
          strokePaint.color = Colors.black;
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 1.0;
        }
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, strokePaint);
        _marker_circle(
          canvas,
          const Offset(10.0, 10.0),
          0.0,
          1.0,
          isStart: true,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(30.0, 10.0),
          0.0,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(40.0, 10.0),
          0.0,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(10.0, 20.0)
        ..lineTo(30.0, 20.0)
        ..lineTo(40.0, 20.0);
      {
        final Paint fillPaint = Paint();
        {
          fillPaint.color = const Color(0xFFFF0000);
          fillPaint.style = PaintingStyle.fill;
        }
        final Paint strokePaint = Paint();
        {
          strokePaint.color = const Color(0xFF0000FF);
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 1.0;
        }
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, strokePaint);
        _marker_circle(
          canvas,
          const Offset(10.0, 20.0),
          0.0,
          1.0,
          isStart: true,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(30.0, 20.0),
          0.0,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(40.0, 20.0),
          0.0,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(10.0, 30.0)
        ..lineTo(30.0, 30.0)
        ..lineTo(40.0, 30.0);
      {
        final Paint strokePaint = Paint();
        {
          strokePaint.color = const Color(0xFFFF0000);
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 1.0;
        }
        canvas.drawPath(path, strokePaint);
        _marker_circle(
          canvas,
          const Offset(10.0, 30.0),
          0.0,
          1.0,
          isStart: true,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(30.0, 30.0),
          0.0,
          1.0,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(40.0, 30.0),
          0.0,
          1.0,
          contextStroke: strokePaint,
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(10.0, 40.0)
        ..lineTo(30.0, 40.0)
        ..lineTo(40.0, 40.0);
      {
        final Paint fillPaint = Paint();
        {
          fillPaint.color = const Color(0xFF0000FF);
          fillPaint.style = PaintingStyle.fill;
        }
        final Paint strokePaint = Paint();
        {
          strokePaint.color = const Color(0xFF808080);
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 1.5;
        }
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, strokePaint);
        _marker_circle(
          canvas,
          const Offset(10.0, 40.0),
          0.0,
          1.5,
          isStart: true,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(30.0, 40.0),
          0.0,
          1.5,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(40.0, 40.0),
          0.0,
          1.5,
          contextFill: fillPaint,
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
  bool shouldRepaint(covariant _$MarkerContextFillStrokePainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
