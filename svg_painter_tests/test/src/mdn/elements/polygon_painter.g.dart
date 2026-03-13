// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polygon_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class PolygonPainterWidget extends StatelessWidget {
  const PolygonPainterWidget({
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
      size: Size(width ?? 200.0, height ?? 100.0),
      painter: _$PolygonPainter(fit: fit),
    );
  }
}

class _$PolygonPainter extends CustomPainter {
  const _$PolygonPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(200.0, 100.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(200.0, 100.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 200.0, 100.0));

    final Path _poly_183222698 = Path()
      ..moveTo(0.0, 100.0)
      ..lineTo(50.0, 25.0)
      ..lineTo(50.0, 75.0)
      ..lineTo(100.0, 0.0)
      ..close();
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawPath(_poly_183222698, paint);
    }
    final Path _poly_1012185662 = Path()
      ..moveTo(100.0, 100.0)
      ..lineTo(150.0, 25.0)
      ..lineTo(150.0, 75.0)
      ..lineTo(200.0, 0.0)
      ..close();
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawPath(_poly_1012185662, paint);
    }
    canvas.restore();
  }

  void _applyOverride(Paint paint, Object? override) {
    if (override == null) return;
    if (override is Color) {
      paint.color = override;
      paint.shader = null;
    } else if (override is Shader) {
      paint.shader = override;
    }
  }

  @override
  bool shouldRepaint(covariant _$PolygonPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    }

    return true;
  }
}
