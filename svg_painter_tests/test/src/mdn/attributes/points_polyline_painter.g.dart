// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_polyline_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class PointsPolylinePainterWidget extends StatelessWidget {
  const PointsPolylinePainterWidget({
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
      painter: _$PointsPolylinePainter(fit: fit),
    );
  }
}

class _$PointsPolylinePainter extends CustomPainter {
  const _$PointsPolylinePainter({this.fit = BoxFit.contain});

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

    canvas.save();
    canvas.translate(10.0, 10.0);
    {
      final Path path = Path()
        ..moveTo(50.0, 0.0)
        ..lineTo(21.0, 90.0)
        ..lineTo(98.0, 35.0)
        ..lineTo(2.0, 35.0)
        ..lineTo(79.0, 90.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
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

  @override
  bool shouldRepaint(covariant _$PointsPolylinePainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
