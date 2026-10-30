// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orient_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class OrientPainterWidget extends StatelessWidget {
  const OrientPainterWidget({
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
      painter: _$OrientPainter(fit: fit),
    );
  }
}

class _$OrientPainter extends CustomPainter {
  const _$OrientPainter({this.fit = BoxFit.contain});

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

    void _marker_dataArrow(
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
      canvas.rotate(-1.1344640137963142);
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
          paint.color = const Color(0xFFFF0000);
          paint.style = PaintingStyle.fill;
          canvas.drawPath(path, paint);
        }
      }
      canvas.restore();
    }

    {
      final Path path = Path()
        ..moveTo(10.0, 10.0)
        ..lineTo(10.0, 90.0)
        ..lineTo(90.0, 90.0);
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
          const Offset(10.0, 10.0),
          1.5707963267948966,
          1.0,
          isStart: true,
          contextStroke: strokePaint,
        );
        _marker_arrow(
          canvas,
          const Offset(90.0, 90.0),
          0.0,
          1.0,
          contextStroke: strokePaint,
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(15.0, 80.0)
        ..lineTo(29.0, 50.0)
        ..lineTo(43.0, 60.0)
        ..lineTo(57.0, 30.0)
        ..lineTo(71.0, 40.0)
        ..lineTo(85.0, 15.0);
      {
        final Paint strokePaint = Paint();
        {
          strokePaint.color = const Color(0xFF808080);
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 1.0;
        }
        canvas.drawPath(path, strokePaint);
        _marker_dataArrow(
          canvas,
          const Offset(15.0, 80.0),
          -1.1341691669813554,
          1.0,
          isStart: true,
          contextStroke: strokePaint,
        );
        _marker_dataArrow(
          canvas,
          const Offset(29.0, 50.0),
          -0.2569598404992669,
          1.0,
          contextStroke: strokePaint,
        );
        _marker_dataArrow(
          canvas,
          const Offset(43.0, 60.0),
          -0.2569598404992669,
          1.0,
          contextStroke: strokePaint,
        );
        _marker_dataArrow(
          canvas,
          const Offset(57.0, 30.0),
          -0.2569598404992669,
          1.0,
          contextStroke: strokePaint,
        );
        _marker_dataArrow(
          canvas,
          const Offset(71.0, 40.0),
          -0.22002925944764962,
          1.0,
          contextStroke: strokePaint,
        );
        _marker_dataArrow(
          canvas,
          const Offset(85.0, 15.0),
          -1.0603080048781208,
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
  bool shouldRepaint(covariant _$OrientPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
