// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preserve_aspect_ratio_2_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class PreserveAspectRatio2PainterWidget extends StatelessWidget {
  const PreserveAspectRatio2PainterWidget({
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
      size: Size(width ?? 202.0, height ?? 57.0),
      painter: _$PreserveAspectRatio2Painter(fit: fit),
    );
  }
}

class _$PreserveAspectRatio2Painter extends CustomPainter {
  const _$PreserveAspectRatio2Painter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(202.0, 57.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(202.0, 57.0),
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
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 202.0, 57.0));
    canvas.save();
    canvas.translate(1.0, 1.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 15.0, 60.0, 30.0), paint);
    }
    canvas.save();
    canvas.translate(0.0, 15.0);
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 60.0, 30.0));
    canvas.save();
    canvas.scale(0.6, 0.6);
    {
      final Path path = Path()
        ..moveTo(50.0, 10.0)
        ..arcToPoint(
          const Offset(50.0, 90.0),
          radius: const Radius.elliptical(40.0, 40.0),
          rotation: 1.0,
          largeArc: true,
          clockwise: true,
        )
        ..arcToPoint(
          const Offset(50.0, 10.0),
          radius: const Radius.elliptical(40.0, 40.0),
          rotation: 1.0,
          largeArc: true,
          clockwise: true,
        )
        ..moveTo(30.0, 40.0)
        ..quadraticBezierTo(36.0, 35.0, 42.0, 40.0)
        ..moveTo(58.0, 40.0)
        ..quadraticBezierTo(64.0, 35.0, 70.0, 40.0)
        ..moveTo(30.0, 60.0)
        ..quadraticBezierTo(50.0, 75.0, 70.0, 60.0)
        ..quadraticBezierTo(50.0, 75.0, 30.0, 60.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFFF00);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 8.0;
        paint.strokeCap = StrokeCap.round;
        paint.strokeJoin = StrokeJoin.round;
        canvas.drawPath(path, paint);
      }
    }
    canvas.restore();
    canvas.restore();
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(70.0, 15.0, 60.0, 30.0), paint);
    }
    canvas.save();
    canvas.translate(70.0, 15.0);
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 60.0, 30.0));
    canvas.save();
    canvas.translate(0.0, -15.0);
    canvas.scale(0.6, 0.6);
    {
      final Path path = Path()
        ..moveTo(50.0, 10.0)
        ..arcToPoint(
          const Offset(50.0, 90.0),
          radius: const Radius.elliptical(40.0, 40.0),
          rotation: 1.0,
          largeArc: true,
          clockwise: true,
        )
        ..arcToPoint(
          const Offset(50.0, 10.0),
          radius: const Radius.elliptical(40.0, 40.0),
          rotation: 1.0,
          largeArc: true,
          clockwise: true,
        )
        ..moveTo(30.0, 40.0)
        ..quadraticBezierTo(36.0, 35.0, 42.0, 40.0)
        ..moveTo(58.0, 40.0)
        ..quadraticBezierTo(64.0, 35.0, 70.0, 40.0)
        ..moveTo(30.0, 60.0)
        ..quadraticBezierTo(50.0, 75.0, 70.0, 60.0)
        ..quadraticBezierTo(50.0, 75.0, 30.0, 60.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFFF00);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 8.0;
        paint.strokeCap = StrokeCap.round;
        paint.strokeJoin = StrokeJoin.round;
        canvas.drawPath(path, paint);
      }
    }
    canvas.restore();
    canvas.restore();
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(140.0, 15.0, 60.0, 30.0), paint);
    }
    canvas.save();
    canvas.translate(140.0, 15.0);
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 60.0, 30.0));
    canvas.save();
    canvas.translate(0.0, -30.0);
    canvas.scale(0.6, 0.6);
    {
      final Path path = Path()
        ..moveTo(50.0, 10.0)
        ..arcToPoint(
          const Offset(50.0, 90.0),
          radius: const Radius.elliptical(40.0, 40.0),
          rotation: 1.0,
          largeArc: true,
          clockwise: true,
        )
        ..arcToPoint(
          const Offset(50.0, 10.0),
          radius: const Radius.elliptical(40.0, 40.0),
          rotation: 1.0,
          largeArc: true,
          clockwise: true,
        )
        ..moveTo(30.0, 40.0)
        ..quadraticBezierTo(36.0, 35.0, 42.0, 40.0)
        ..moveTo(58.0, 40.0)
        ..quadraticBezierTo(64.0, 35.0, 70.0, 40.0)
        ..moveTo(30.0, 60.0)
        ..quadraticBezierTo(50.0, 75.0, 70.0, 60.0)
        ..quadraticBezierTo(50.0, 75.0, 30.0, 60.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFFF00);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 8.0;
        paint.strokeCap = StrokeCap.round;
        paint.strokeJoin = StrokeJoin.round;
        canvas.drawPath(path, paint);
      }
    }
    canvas.restore();
    canvas.restore();
    canvas.restore();
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
  bool shouldRepaint(covariant _$PreserveAspectRatio2Painter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
