// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cx_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class _$CxPainter extends CustomPainter {
  const _$CxPainter({this.fit = BoxFit.contain});

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

    final Gradient _grad_myGradient = RadialGradient(
      center: Alignment(-0.5, 0.0),
      radius: 0.5,
      focal: Alignment(-0.5, 0.0),
      focalRadius: 0.0,
      colors: [Color(0xFFFFFFFF), Color(0xFF000000)],
      stops: [0.0, 1.0],
    );
    {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF000000);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(50.0, 50.0), 45.0, paint);
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF000000);
        paint.style = PaintingStyle.fill;
        canvas.drawOval(
          Rect.fromCenter(
            center: const Offset(150.0, 50.0),
            width: 90.0,
            height: 50.0,
          ),
          paint,
        );
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.shader = _grad_myGradient.createShader(
          Rect.fromLTWH(205.0, 5.0, 90.0, 90.0),
        );
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(205.0, 5.0, 90.0, 90.0), paint);
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$CxPainter oldDelegate) {
    return fit != oldDelegate.fit;
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class _$CxRadialGradientPainter extends CustomPainter {
  const _$CxRadialGradientPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(34.0, 10.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(34.0, 10.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 34.0, 10.0));

    final Gradient _grad_myGradient000 = RadialGradient(
      center: Alignment(-1.0, 0.0),
      radius: 0.5,
      focal: Alignment(-1.0, 0.0),
      focalRadius: 0.0,
      colors: [Color(0xFFFFD700), Color(0xFF008000), Color(0xFFFFFFFF)],
      stops: [0.0, 0.5, 1.0],
    );
    final Gradient _grad_myGradient050 = RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.5,
      focal: Alignment(0.0, 0.0),
      focalRadius: 0.0,
      colors: [Color(0xFFFFD700), Color(0xFF008000), Color(0xFFFFFFFF)],
      stops: [0.0, 0.5, 1.0],
    );
    final Gradient _grad_myGradient100 = RadialGradient(
      center: Alignment(1.0, 0.0),
      radius: 0.5,
      focal: Alignment(1.0, 0.0),
      focalRadius: 0.0,
      colors: [Color(0xFFFFD700), Color(0xFF008000), Color(0xFFFFFFFF)],
      stops: [0.0, 0.5, 1.0],
    );
    {
      {
        final Paint paint = Paint();
        paint.shader = _grad_myGradient000.createShader(
          Rect.fromLTWH(1.0, 1.0, 8.0, 8.0),
        );
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(1.0, 1.0, 8.0, 8.0), paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF000000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawRect(Rect.fromLTWH(1.0, 1.0, 8.0, 8.0), paint);
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.shader = _grad_myGradient050.createShader(
          Rect.fromLTWH(13.0, 1.0, 8.0, 8.0),
        );
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(13.0, 1.0, 8.0, 8.0), paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF000000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawRect(Rect.fromLTWH(13.0, 1.0, 8.0, 8.0), paint);
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.shader = _grad_myGradient100.createShader(
          Rect.fromLTWH(25.0, 1.0, 8.0, 8.0),
        );
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(25.0, 1.0, 8.0, 8.0), paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF000000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawRect(Rect.fromLTWH(25.0, 1.0, 8.0, 8.0), paint);
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$CxRadialGradientPainter oldDelegate) {
    return fit != oldDelegate.fit;
  }
}
