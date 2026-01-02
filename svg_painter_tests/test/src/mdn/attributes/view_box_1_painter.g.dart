// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_box_1_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class _$ViewBox1Painter extends CustomPainter {
  const _$ViewBox1Painter({this.fit = BoxFit.contain});

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
    canvas.clipRect(Rect.fromLTWH(0, 0, 100.0, 100.0));

    {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF000000);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 100.0, 100.0), paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0x00000000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 100.0, 100.0), paint);
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFFFFF);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(50.0, 50.0), 4.0, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0x00000000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawCircle(const Offset(50.0, 50.0), 4.0, paint);
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$ViewBox1Painter oldDelegate) {
    return fit != oldDelegate.fit;
  }
}
