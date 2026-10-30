// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fill_context_fill_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class FillContextFillPainterWidget extends StatelessWidget {
  const FillContextFillPainterWidget({
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
      size: Size(width ?? 300.0, height ?? 90.0),
      painter: _$FillContextFillPainter(fit: fit),
    );
  }
}

class _$FillContextFillPainter extends CustomPainter {
  const _$FillContextFillPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(300.0, 90.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(300.0, 90.0),
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
      canvas.translate(-6.0, -6.0);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 12.0, 12.0));
      {
        final Paint paint = Paint();
        if (contextFill != null) {
          paint.color = contextFill.color;
          paint.shader = contextFill.shader;
        } else {
          paint.color = const Color(0x00000000);
        }
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(6.0, 6.0), 3.0, paint);
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
        paint.strokeWidth = 2.0;
        canvas.drawCircle(const Offset(6.0, 6.0), 3.0, paint);
      }
      canvas.restore();
    }

    {
      final Path path = Path()
        ..moveTo(10.0, 44.64)
        ..lineTo(30.0, 10.0)
        ..lineTo(70.0, 10.0)
        ..lineTo(90.0, 44.64)
        ..lineTo(70.0, 79.28)
        ..lineTo(30.0, 79.28)
        ..close();
      {
        final Paint fillPaint = Paint();
        {
          fillPaint.color = const Color(0xFFFFA500);
          fillPaint.style = PaintingStyle.fill;
        }
        final Paint strokePaint = Paint();
        {
          strokePaint.color = const Color(0xFFFF0000);
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 2.0;
        }
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, strokePaint);
        _marker_circle(
          canvas,
          const Offset(10.0, 44.64),
          -1.0471848490249271,
          2.0,
          isStart: true,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(30.0, 10.0),
          -0.5235924245124636,
          2.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(70.0, 10.0),
          0.5235924245124636,
          2.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(90.0, 44.64),
          1.5707963267948968,
          2.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(70.0, 79.28),
          2.61800022907733,
          2.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(30.0, 79.28),
          -2.61800022907733,
          2.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(10.0, 44.64),
          -2.094407804564866,
          2.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(100.0, 44.64)
        ..lineTo(80.0, 10.0)
        ..lineTo(120.0, 10.0)
        ..lineTo(140.0, 44.64)
        ..lineTo(120.0, 79.28)
        ..lineTo(80.0, 79.28)
        ..close();
      {
        final Paint fillPaint = Paint();
        {
          fillPaint.color = const Color(0xFF90EE90);
          fillPaint.style = PaintingStyle.fill;
        }
        final Paint strokePaint = Paint();
        {
          strokePaint.color = const Color(0xFF008000);
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 2.0;
        }
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, strokePaint);
        _marker_circle(
          canvas,
          const Offset(100.0, 44.64),
          -2.094407804564866,
          2.0,
          isStart: true,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(80.0, 10.0),
          -1.047203902282433,
          2.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(120.0, 10.0),
          0.5235924245124636,
          2.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(140.0, 44.64),
          1.5707963267948968,
          2.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(120.0, 79.28),
          2.61800022907733,
          2.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(80.0, 79.28),
          -2.0943887513073602,
          2.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(100.0, 44.64),
          -1.0471848490249271,
          2.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(150.0, 44.64)
        ..lineTo(130.0, 10.0)
        ..lineTo(170.0, 10.0)
        ..lineTo(190.0, 44.64)
        ..lineTo(170.0, 79.28)
        ..lineTo(130.0, 79.28)
        ..close();
      {
        final Paint fillPaint = Paint();
        {
          fillPaint.color = const Color(0xFFADD8E6);
          fillPaint.style = PaintingStyle.fill;
        }
        final Paint strokePaint = Paint();
        {
          strokePaint.color = const Color(0xFF0000FF);
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 2.0;
        }
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, strokePaint);
        _marker_circle(
          canvas,
          const Offset(150.0, 44.64),
          -2.094407804564866,
          2.0,
          isStart: true,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(130.0, 10.0),
          -1.047203902282433,
          2.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(170.0, 10.0),
          0.5235924245124636,
          2.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(190.0, 44.64),
          1.5707963267948968,
          2.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(170.0, 79.28),
          2.61800022907733,
          2.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(130.0, 79.28),
          -2.0943887513073602,
          2.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_circle(
          canvas,
          const Offset(150.0, 44.64),
          -1.0471848490249271,
          2.0,
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
  bool shouldRepaint(covariant _$FillContextFillPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
