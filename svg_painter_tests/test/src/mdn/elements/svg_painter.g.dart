// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'svg_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class Svg1PainterWidget extends StatelessWidget {
  const Svg1PainterWidget({
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
      size: Size(width ?? 300.0, height ?? 100.0),
      painter: _$Svg1Painter(fit: fit),
    );
  }
}

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
    canvas.save();
    canvas.translate(200.0, 0.0);
    canvas.save();
    canvas.scale(10.0, 10.0);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF808080);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(5.0, 5.0), 4.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawCircle(const Offset(5.0, 5.0), 4.0, paint);
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
  bool shouldRepaint(covariant _$Svg1Painter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class Svg2PainterWidget extends StatelessWidget {
  const Svg2PainterWidget({
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
      size: Size(width ?? 60.0, height ?? 60.0),
      painter: _$Svg2Painter(fit: fit),
    );
  }
}

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

    canvas.save();
    canvas.scale(0.09, 0.09);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xBFFF6347);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 200.0, 200.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xBF708090);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(100.0, 100.0, 200.0, 200.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xBF808000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(200.0, 200.0, 200.0, 200.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF5F9EA0);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 2.0;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 400.0, 400.0), paint);
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
  bool shouldRepaint(covariant _$Svg2Painter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
