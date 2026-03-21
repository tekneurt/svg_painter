// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spread_method_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class SpreadMethod1PainterWidget extends StatelessWidget {
  const SpreadMethod1PainterWidget({
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
      size: Size(width ?? 220.0, height ?? 150.0),
      painter: _$SpreadMethod1Painter(fit: fit),
    );
  }
}

class _$SpreadMethod1Painter extends CustomPainter {
  const _$SpreadMethod1Painter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(220.0, 150.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(220.0, 150.0),
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

    final Gradient _grad_PadGradient = LinearGradient(
      begin: Alignment(-0.33999999999999997, -1.0),
      end: Alignment(0.3400000000000001, -1.0),
      colors: <Color>[const Color(0xFFFF00FF), const Color(0xFFFFA500)],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp,
    );
    final Gradient _grad_ReflectGradient = LinearGradient(
      begin: Alignment(-0.33999999999999997, -1.0),
      end: Alignment(0.3400000000000001, -1.0),
      colors: <Color>[const Color(0xFFFF00FF), const Color(0xFFFFA500)],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.mirror,
    );
    final Gradient _grad_RepeatGradient = LinearGradient(
      begin: Alignment(-0.33999999999999997, -1.0),
      end: Alignment(0.3400000000000001, -1.0),
      colors: <Color>[const Color(0xFFFF00FF), const Color(0xFFFFA500)],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.repeated,
    );
    {
      final Paint paint = Paint();
      paint.shader = _grad_PadGradient.createShader(
        Rect.fromLTWH(10.0, 0.0, 200.0, 40.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(10.0, 0.0, 200.0, 40.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_ReflectGradient.createShader(
        Rect.fromLTWH(10.0, 50.0, 200.0, 40.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(10.0, 50.0, 200.0, 40.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_RepeatGradient.createShader(
        Rect.fromLTWH(10.0, 100.0, 200.0, 40.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(10.0, 100.0, 200.0, 40.0), paint);
    }
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
  bool shouldRepaint(covariant _$SpreadMethod1Painter oldDelegate) {
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

class SpreadMethod2PainterWidget extends StatelessWidget {
  const SpreadMethod2PainterWidget({
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
      size: Size(width ?? 340.0, height ?? 120.0),
      painter: _$SpreadMethod2Painter(fit: fit),
    );
  }
}

class _$SpreadMethod2Painter extends CustomPainter {
  const _$SpreadMethod2Painter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(340.0, 120.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(340.0, 120.0),
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

    final Gradient _grad_RadialPadGradient = RadialGradient(
      center: Alignment(0.5, -0.5),
      radius: 0.33,
      focal: Alignment(0.28, -0.64),
      focalRadius: 0.17,
      colors: <Color>[const Color(0xFFFF00FF), const Color(0xFFFFA500)],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp,
    );
    final Gradient _grad_RadialReflectGradient = RadialGradient(
      center: Alignment(0.5, -0.5),
      radius: 0.33,
      focal: Alignment(0.28, -0.64),
      focalRadius: 0.17,
      colors: <Color>[const Color(0xFFFF00FF), const Color(0xFFFFA500)],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.mirror,
    );
    final Gradient _grad_RadialRepeatGradient = RadialGradient(
      center: Alignment(0.5, -0.5),
      radius: 0.33,
      focal: Alignment(0.28, -0.64),
      focalRadius: 0.17,
      colors: <Color>[const Color(0xFFFF00FF), const Color(0xFFFFA500)],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.repeated,
    );
    {
      final Paint paint = Paint();
      paint.shader = _grad_RadialPadGradient.createShader(
        Rect.fromLTWH(10.0, 10.0, 100.0, 100.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(10.0, 10.0, 100.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_RadialReflectGradient.createShader(
        Rect.fromLTWH(120.0, 10.0, 100.0, 100.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(120.0, 10.0, 100.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_RadialRepeatGradient.createShader(
        Rect.fromLTWH(230.0, 10.0, 100.0, 100.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(230.0, 10.0, 100.0, 100.0), paint);
    }
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
  bool shouldRepaint(covariant _$SpreadMethod2Painter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
