// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clip_path_units_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class ClipPathUnitsPainterWidget extends StatelessWidget {
  const ClipPathUnitsPainterWidget({
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
      painter: _$ClipPathUnitsPainter(fit: fit),
    );
  }
}

class _$ClipPathUnitsPainter extends CustomPainter {
  const _$ClipPathUnitsPainter({this.fit = BoxFit.contain});

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

    void _clipPath_myClip1(Canvas canvas, Size size, Rect targetBounds) {
      final Path path = Path();
      path.addOval(
        Rect.fromCircle(center: const Offset(50.0, 50.0), radius: 35.0),
      );
      canvas.clipPath(path);
    }

    void _clipPath_myClip2(Canvas canvas, Size size, Rect targetBounds) {
      final Path path = Path();
      path.addOval(
        Rect.fromCircle(center: const Offset(0.5, 0.5), radius: 0.35),
      );
      {
        final Matrix4 matrix = Matrix4.identity()
          ..translateByDouble(targetBounds.left, targetBounds.top, 0.0, 1.0)
          ..scaleByDouble(targetBounds.width, targetBounds.height, 1.0, 1.0);
        canvas.clipPath(path.transform(matrix.storage));
      }
    }

    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 45.0, 45.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 55.0, 45.0, 45.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(55.0, 55.0, 45.0, 45.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(55.0, 0.0, 45.0, 45.0), paint);
    }
    canvas.save();
    _clipPath_myClip1(canvas, size, Rect.fromLTWH(0.0, 0.0, 45.0, 45.0));
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 45.0, 45.0), paint);
    }
    canvas.restore();
    canvas.save();
    _clipPath_myClip1(canvas, size, Rect.fromLTWH(0.0, 55.0, 45.0, 45.0));
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 55.0, 45.0, 45.0), paint);
    }
    canvas.restore();
    canvas.save();
    _clipPath_myClip1(canvas, size, Rect.fromLTWH(55.0, 55.0, 45.0, 45.0));
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(55.0, 55.0, 45.0, 45.0), paint);
    }
    canvas.restore();
    canvas.save();
    _clipPath_myClip2(canvas, size, Rect.fromLTWH(55.0, 0.0, 45.0, 45.0));
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(55.0, 0.0, 45.0, 45.0), paint);
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
  bool shouldRepaint(covariant _$ClipPathUnitsPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
