// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rx_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class _$RxPainter extends CustomPainter {
  const _$RxPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(300.0, 200.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 300.0, 200.0));

    {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF000000);
        paint.style = PaintingStyle.fill;
        canvas.drawOval(
          Rect.fromCenter(
            center: const Offset(150.0, 50.0),
            width: 50.0,
            height: 50.0,
          ),
          paint,
        );
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF000000);
        paint.style = PaintingStyle.fill;
        canvas.drawOval(
          Rect.fromCenter(
            center: const Offset(250.0, 50.0),
            width: 100.0,
            height: 50.0,
          ),
          paint,
        );
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF000000);
        paint.style = PaintingStyle.fill;
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(20.0, 120.0, 60.0, 60.0),
            Radius.elliptical(0.0, 15.0),
          ),
          paint,
        );
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF000000);
        paint.style = PaintingStyle.fill;
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(120.0, 120.0, 60.0, 60.0),
            Radius.elliptical(15.0, 15.0),
          ),
          paint,
        );
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF000000);
        paint.style = PaintingStyle.fill;
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(220.0, 120.0, 60.0, 60.0),
            Radius.elliptical(30.0, 15.0),
          ),
          paint,
        );
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$RxPainter oldDelegate) {
    return fit != oldDelegate.fit;
  }
}
