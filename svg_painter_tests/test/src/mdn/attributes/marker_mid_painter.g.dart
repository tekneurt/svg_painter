// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marker_mid_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class MarkerMidPainterWidget extends StatelessWidget {
  const MarkerMidPainterWidget({
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
      size: Size(width ?? 120.0, height ?? 120.0),
      painter: _$MarkerMidPainter(fit: fit),
    );
  }
}

class _$MarkerMidPainter extends CustomPainter {
  const _$MarkerMidPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(120.0, 120.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(120.0, 120.0),
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
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-4.0, -4.0);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 8.0, 8.0));
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(4.0, 4.0), 4.0, paint);
      }
      canvas.restore();
    }

    {
      final Path path = Path()
        ..moveTo(20.0, 100.0)
        ..lineTo(40.0, 60.0)
        ..lineTo(70.0, 80.0)
        ..lineTo(100.0, 20.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
      _marker_circle(
        canvas,
        const Offset(40.0, 60.0),
        -0.2595730571232615,
        1.0,
      );
      _marker_circle(
        canvas,
        const Offset(70.0, 80.0),
        -0.2595730571232615,
        1.0,
      );
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
  bool shouldRepaint(covariant _$MarkerMidPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
