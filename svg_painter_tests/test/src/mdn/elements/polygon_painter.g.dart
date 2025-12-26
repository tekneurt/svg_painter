// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polygon_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

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

    {
      {
        final Path path = Path();
        path.addPolygon([
          const Offset(0.0, 100.0),
          const Offset(50.0, 25.0),
          const Offset(50.0, 75.0),
          const Offset(100.0, 0.0),
        ], true);
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFF000000);
          paint.style = PaintingStyle.fill;
          canvas.drawPath(path, paint);
        }
      }
    }
    {
      {
        final Path path = Path();
        path.addPolygon([
          const Offset(100.0, 100.0),
          const Offset(150.0, 25.0),
          const Offset(150.0, 75.0),
          const Offset(200.0, 0.0),
        ], true);
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFF000000);
          paint.style = PaintingStyle.stroke;
          paint.strokeWidth = 1.0;
          canvas.drawPath(path, paint);
        }
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$PolygonPainter oldDelegate) {
    return fit != oldDelegate.fit;
  }
}
