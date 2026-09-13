// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clip_path_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class ClipPathPainterWidget extends StatelessWidget {
  const ClipPathPainterWidget({
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
      size: Size(width ?? 100.0, height ?? 100.0),
      painter: _$ClipPathPainter(fit: fit),
    );
  }
}

class _$ClipPathPainter extends CustomPainter {
  const _$ClipPathPainter({this.fit = BoxFit.contain});

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

    void _clipPath_myClip(Canvas canvas, Size size, Rect targetBounds) {
      final Path path = Path();
      path.addOval(
        Rect.fromCircle(center: const Offset(40.0, 35.0), radius: 35.0),
      );
      canvas.clipPath(path);
    }

    {
      final Path path = Path()
        ..moveTo(10.0, 30.0)
        ..arcToPoint(
          const Offset(50.0, 30.0),
          radius: const Radius.elliptical(20.0, 20.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        )
        ..arcToPoint(
          const Offset(90.0, 30.0),
          radius: const Radius.elliptical(20.0, 20.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        )
        ..quadraticBezierTo(90.0, 60.0, 50.0, 90.0)
        ..quadraticBezierTo(10.0, 60.0, 10.0, 30.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    canvas.save();
    _clipPath_myClip(canvas, size, Offset.zero & viewBox);
    {
      final Path path = Path()
        ..moveTo(10.0, 30.0)
        ..arcToPoint(
          const Offset(50.0, 30.0),
          radius: const Radius.elliptical(20.0, 20.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        )
        ..arcToPoint(
          const Offset(90.0, 30.0),
          radius: const Radius.elliptical(20.0, 20.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        )
        ..quadraticBezierTo(90.0, 60.0, 50.0, 90.0)
        ..quadraticBezierTo(10.0, 60.0, 10.0, 30.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.fill;
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
  bool shouldRepaint(covariant _$ClipPathPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
