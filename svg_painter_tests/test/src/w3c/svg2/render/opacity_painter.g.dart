// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opacity_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class OpacityPainterWidget extends StatelessWidget {
  const OpacityPainterWidget({
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
      size: Size(width ?? 600.0, height ?? 175.0),
      painter: _$OpacityPainter(fit: fit),
    );
  }
}

class _$OpacityPainter extends CustomPainter {
  const _$OpacityPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(600.0, 175.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(600.0, 175.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 600.0, 175.0));

    canvas.save();
    canvas.scale(0.5, 0.5);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(100.0, 100.0, 1000.0, 150.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(200.0, 100.0), 50.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xCCFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(400.0, 100.0), 50.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0x99FF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(600.0, 100.0), 50.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0x66FF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(800.0, 100.0), 50.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0x33FF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(1000.0, 100.0), 50.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(182.5, 250.0), 50.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF008000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(217.5, 250.0), 50.0, paint);
    }
    canvas.saveLayer(null, Paint()..color = const Color(0x80FFFFFF));
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(382.5, 250.0), 50.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF008000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(417.5, 250.0), 50.0, paint);
    }
    canvas.restore();
    {
      final Paint paint = Paint();
      paint.color = const Color(0x80FF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(582.5, 250.0), 50.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0x80008000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(617.5, 250.0), 50.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0x80008000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(817.5, 250.0), 50.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0x80FF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(782.5, 250.0), 50.0, paint);
    }
    canvas.saveLayer(null, Paint()..color = const Color(0x80FFFFFF));
    {
      final Paint paint = Paint();
      paint.color = const Color(0x80FF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(982.5, 250.0), 50.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0x80008000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(1017.5, 250.0), 50.0, paint);
    }
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
  bool shouldRepaint(covariant _$OpacityPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
