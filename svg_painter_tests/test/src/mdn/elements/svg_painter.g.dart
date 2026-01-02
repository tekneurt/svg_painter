// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'svg_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class _$Svg1Painter extends CustomPainter {
  const _$Svg1Painter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(300.0, 100.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(300.0, 100.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 300.0, 100.0));

    {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF808080);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(50.0, 50.0), 40.0, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawCircle(const Offset(50.0, 50.0), 40.0, paint);
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF808080);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(150.0, 50.0), 4.0, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawCircle(const Offset(150.0, 50.0), 4.0, paint);
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF808080);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(250.0, 50.0), 40.0, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
        canvas.drawCircle(const Offset(250.0, 50.0), 40.0, paint);
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$Svg1Painter oldDelegate) {
    return fit != oldDelegate.fit;
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class _$Svg2Painter extends CustomPainter {
  const _$Svg2Painter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(60.0, 60.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(60.0, 60.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 60.0, 60.0));

    {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xBFFF6347);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 18.0, 18.0), paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0x00000000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 0.08999999999999998;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 18.0, 18.0), paint);
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xBF708090);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(9.0, 9.0, 18.0, 18.0), paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0x00000000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 0.08999999999999998;
        canvas.drawRect(Rect.fromLTWH(9.0, 9.0, 18.0, 18.0), paint);
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xBF808000);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(18.0, 18.0, 18.0, 18.0), paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0x00000000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 0.08999999999999998;
        canvas.drawRect(Rect.fromLTWH(18.0, 18.0, 18.0, 18.0), paint);
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF5F9EA0);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 0.17999999999999997;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 36.0, 36.0), paint);
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$Svg2Painter oldDelegate) {
    return fit != oldDelegate.fit;
  }
}
