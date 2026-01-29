// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'use_element_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class _$UseElementPainter extends CustomPainter {
  const _$UseElementPainter({this.fit = BoxFit.contain, this.myCircleStroke});

  final BoxFit fit;
  final Color? myCircleStroke;

  Size get viewBox => const Size(30.0, 10.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(30.0, 10.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 30.0, 10.0));

    {
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(5.0, 5.0), 4.0, paint);
      }
      {
        final Paint paint = Paint();
        final Color? localStroke = myCircleStroke;
        if (localStroke == null) {
          paint.color = const Color(0xFF0000FF);
        } else {
          paint.color = localStroke;
        }
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawCircle(const Offset(5.0, 5.0), 4.0, paint);
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(15.0, 5.0), 4.0, paint);
      }
      {
        final Paint paint = Paint();
        final Color? localStroke = myCircleStroke;
        if (localStroke == null) {
          paint.color = const Color(0xFF0000FF);
        } else {
          paint.color = localStroke;
        }
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawCircle(const Offset(15.0, 5.0), 4.0, paint);
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = Colors.white;
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(25.0, 5.0), 4.0, paint);
      }
      {
        final Paint paint = Paint();
        final Color? localStroke = myCircleStroke;
        if (localStroke == null) {
          paint.color = const Color(0xFF0000FF);
        } else {
          paint.color = localStroke;
        }
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawCircle(const Offset(25.0, 5.0), 4.0, paint);
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$UseElementPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      if (myCircleStroke != oldDelegate.myCircleStroke) return true;
      return false;
    } else {
      return true;
    }
  }
}
