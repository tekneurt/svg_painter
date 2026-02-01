// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_polygon_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class PointsPolygonPainterWidget extends StatelessWidget {
  const PointsPolygonPainterWidget({
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
      painter: _$PointsPolygonPainter(fit: fit),
    );
  }
}

class _$PointsPolygonPainter extends CustomPainter {
  const _$PointsPolygonPainter({this.fit = BoxFit.contain});

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
    canvas.clipRect(Rect.fromLTWH(0, 0, 120.0, 120.0));

    {
      {
        final Path path = Path();
        path.addPolygon([
          const Offset(60.0, 10.0),
          const Offset(31.0, 100.0),
          const Offset(108.0, 45.0),
          const Offset(12.0, 45.0),
          const Offset(89.0, 100.0),
        ], true);
        {
          final Paint paint = Paint();
          paint.color = Colors.black;
          paint.style = PaintingStyle.stroke;
          paint.strokeWidth = 1.0;
          canvas.drawPath(path, paint);
        }
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$PointsPolygonPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
