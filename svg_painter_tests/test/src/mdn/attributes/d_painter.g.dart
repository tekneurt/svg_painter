// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'd_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class DExamplePainterWidget extends StatelessWidget {
  const DExamplePainterWidget({
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
      painter: _$DExamplePainter(fit: fit),
    );
  }
}

class _$DExamplePainter extends CustomPainter {
  const _$DExamplePainter({this.fit = BoxFit.contain});

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
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
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
  bool shouldRepaint(covariant _$DExamplePainter oldDelegate) {
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

class DMoveToPainterWidget extends StatelessWidget {
  const DMoveToPainterWidget({
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
      painter: _$DMoveToPainter(fit: fit),
    );
  }
}

class _$DMoveToPainter extends CustomPainter {
  const _$DMoveToPainter({this.fit = BoxFit.contain});

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

    {
      final Path path = Path()
        ..moveTo(10.0, 10.0)
        ..lineTo(20.0, 10.0)
        ..moveTo(20.0, 20.0)
        ..lineTo(30.0, 20.0)
        ..moveTo(30.0, 30.0)
        ..lineTo(40.0, 30.0)
        ..moveTo(40.0, 20.0)
        ..lineTo(50.0, 20.0)
        ..moveTo(50.0, 30.0)
        ..lineTo(60.0, 30.0)
        ..moveTo(60.0, 40.0)
        ..lineTo(70.0, 40.0)
        ..moveTo(70.0, 50.0)
        ..lineTo(80.0, 50.0)
        ..moveTo(50.0, 50.0)
        ..lineTo(60.0, 50.0)
        ..moveTo(40.0, 60.0)
        ..lineTo(50.0, 60.0)
        ..moveTo(30.0, 70.0)
        ..lineTo(40.0, 70.0)
        ..moveTo(20.0, 80.0)
        ..lineTo(30.0, 80.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
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
  bool shouldRepaint(covariant _$DMoveToPainter oldDelegate) {
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

class DLineToPainterWidget extends StatelessWidget {
  const DLineToPainterWidget({
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
      size: Size(width ?? 200.0, height ?? 100.0),
      painter: _$DLineToPainter(fit: fit),
    );
  }
}

class _$DLineToPainter extends CustomPainter {
  const _$DLineToPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(200.0, 100.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(200.0, 100.0),
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
      final Path path = Path()
        ..moveTo(10.0, 10.0)
        ..lineTo(90.0, 90.0)
        ..lineTo(90.0, 10.0)
        ..lineTo(50.0, 10.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(110.0, 10.0)
        ..lineTo(190.0, 90.0)
        ..lineTo(190.0, 10.0)
        ..lineTo(150.0, 10.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
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
  bool shouldRepaint(covariant _$DLineToPainter oldDelegate) {
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

class DCubicBezierPainterWidget extends StatelessWidget {
  const DCubicBezierPainterWidget({
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
      size: Size(width ?? 200.0, height ?? 100.0),
      painter: _$DCubicBezierPainter(fit: fit),
    );
  }
}

class _$DCubicBezierPainter extends CustomPainter {
  const _$DCubicBezierPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(200.0, 100.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(200.0, 100.0),
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
      final Path path = Path()
        ..moveTo(10.0, 90.0)
        ..cubicTo(30.0, 90.0, 25.0, 10.0, 50.0, 10.0)
        ..cubicTo(75.0, 10.0, 70.0, 90.0, 90.0, 90.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(110.0, 90.0)
        ..cubicTo(130.0, 90.0, 125.0, 10.0, 150.0, 10.0)
        ..cubicTo(175.0, 10.0, 170.0, 90.0, 190.0, 90.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFD3D3D3);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(10.0, 90.0),
        const Offset(30.0, 90.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(30.0, 90.0), 1.5, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFD3D3D3);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(50.0, 10.0),
        const Offset(25.0, 10.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(25.0, 10.0), 1.5, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFD3D3D3);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      final List<double> dashArray = [2.0, 2.0];
      {
        final Path path = Path()
          ..moveTo(50.0, 10.0)
          ..lineTo(75.0, 10.0);
        canvas.drawPath(_dashPath(path, dashArray), paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFD3D3D3);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(75.0, 10.0), 1.5, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFD3D3D3);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(90.0, 90.0),
        const Offset(70.0, 90.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(70.0, 90.0), 1.5, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(10.0, 90.0), 1.5, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(50.0, 10.0), 1.5, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(90.0, 90.0), 1.5, paint);
    }
    canvas.save();
    canvas.translate(100.0, 0.0);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFD3D3D3);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(10.0, 90.0),
        const Offset(30.0, 90.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(30.0, 90.0), 1.5, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFD3D3D3);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(50.0, 10.0),
        const Offset(25.0, 10.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(25.0, 10.0), 1.5, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFD3D3D3);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      final List<double> dashArray = [2.0, 2.0];
      {
        final Path path = Path()
          ..moveTo(50.0, 10.0)
          ..lineTo(75.0, 10.0);
        canvas.drawPath(_dashPath(path, dashArray), paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFD3D3D3);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(75.0, 10.0), 1.5, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFD3D3D3);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(90.0, 90.0),
        const Offset(70.0, 90.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(70.0, 90.0), 1.5, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(10.0, 90.0), 1.5, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(50.0, 10.0), 1.5, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(90.0, 90.0), 1.5, paint);
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

  Path _dashPath(
    Path source,
    List<double> dashArray, {
    double? pathLength,
    double? dashOffset,
  }) {
    if (dashArray.isEmpty) return source;
    final Path dest = Path();
    for (final metric in source.computeMetrics()) {
      final double scale;
      if (pathLength == null || pathLength <= 0) {
        scale = 1.0;
      } else {
        scale = metric.length / pathLength;
      }
      final double totalLength = dashArray.fold(
        0.0,
        (sum, d) => sum + d * scale,
      );
      if (totalLength <= 0) return source;
      double offset = (dashOffset ?? 0.0) * scale;
      offset = offset % totalLength;
      if (offset < 0) {
        offset += totalLength;
      }
      double remainingPhase = offset;
      int index = 0;
      bool draw = true;
      while (remainingPhase >= dashArray[index] * scale) {
        remainingPhase -= dashArray[index] * scale;
        draw = !draw;
        index = (index + 1) % dashArray.length;
      }
      double distance = 0.0;
      double segmentLen = (dashArray[index] * scale) - remainingPhase;
      while (distance < metric.length) {
        final double len = segmentLen;
        if (len > 0) {
          if (draw) {
            final double end = distance + len < metric.length ? distance + len : metric.length;
            dest.addPath(metric.extractPath(distance, end), Offset.zero);
          }
          distance += len;
        }
        draw = !draw;
        index = (index + 1) % dashArray.length;
        segmentLen = dashArray[index] * scale;
      }
    }
    return dest;
  }

  @override
  bool shouldRepaint(covariant _$DCubicBezierPainter oldDelegate) {
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

class DQuadraticBezierPainterWidget extends StatelessWidget {
  const DQuadraticBezierPainterWidget({
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
      size: Size(width ?? 200.0, height ?? 100.0),
      painter: _$DQuadraticBezierPainter(fit: fit),
    );
  }
}

class _$DQuadraticBezierPainter extends CustomPainter {
  const _$DQuadraticBezierPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(200.0, 100.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(200.0, 100.0),
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
      final Path path = Path()
        ..moveTo(10.0, 50.0)
        ..quadraticBezierTo(25.0, 25.0, 40.0, 50.0)
        ..quadraticBezierTo(55.0, 75.0, 70.0, 50.0)
        ..quadraticBezierTo(85.0, 25.0, 100.0, 50.0)
        ..quadraticBezierTo(115.0, 75.0, 130.0, 50.0)
        ..quadraticBezierTo(145.0, 25.0, 160.0, 50.0)
        ..quadraticBezierTo(175.0, 75.0, 190.0, 50.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(10.0, 50.0)
        ..lineTo(25.0, 25.0)
        ..lineTo(40.0, 50.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0x33000000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(25.0, 25.0), 1.5, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(10.0, 50.0), 1.5, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(40.0, 50.0), 1.5, paint);
    }
    {
      final Path path = Path()
        ..moveTo(40.0, 50.0)
        ..lineTo(55.0, 75.0)
        ..lineTo(70.0, 50.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0x33000000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        final List<double> dashArray = [2.0, 2.0];
        canvas.drawPath(_dashPath(path, dashArray), paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFD3D3D3);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(55.0, 75.0), 1.5, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(70.0, 50.0), 1.5, paint);
    }
    {
      final Path path = Path()
        ..moveTo(70.0, 50.0)
        ..lineTo(85.0, 25.0)
        ..lineTo(100.0, 50.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0x33000000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        final List<double> dashArray = [2.0, 2.0];
        canvas.drawPath(_dashPath(path, dashArray), paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFD3D3D3);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(85.0, 25.0), 1.5, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(100.0, 50.0), 1.5, paint);
    }
    canvas.save();
    canvas.translate(60.0, 0.0);
    {
      final Path path = Path()
        ..moveTo(40.0, 50.0)
        ..lineTo(55.0, 75.0)
        ..lineTo(70.0, 50.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0x33000000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        final List<double> dashArray = [2.0, 2.0];
        canvas.drawPath(_dashPath(path, dashArray), paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFD3D3D3);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(55.0, 75.0), 1.5, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(70.0, 50.0), 1.5, paint);
    }
    canvas.restore();
    canvas.save();
    canvas.translate(60.0, 0.0);
    {
      final Path path = Path()
        ..moveTo(70.0, 50.0)
        ..lineTo(85.0, 25.0)
        ..lineTo(100.0, 50.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0x33000000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        final List<double> dashArray = [2.0, 2.0];
        canvas.drawPath(_dashPath(path, dashArray), paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFD3D3D3);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(85.0, 25.0), 1.5, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(100.0, 50.0), 1.5, paint);
    }
    canvas.restore();
    canvas.save();
    canvas.translate(120.0, 0.0);
    {
      final Path path = Path()
        ..moveTo(40.0, 50.0)
        ..lineTo(55.0, 75.0)
        ..lineTo(70.0, 50.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0x33000000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        final List<double> dashArray = [2.0, 2.0];
        canvas.drawPath(_dashPath(path, dashArray), paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFD3D3D3);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(55.0, 75.0), 1.5, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(70.0, 50.0), 1.5, paint);
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

  Path _dashPath(
    Path source,
    List<double> dashArray, {
    double? pathLength,
    double? dashOffset,
  }) {
    if (dashArray.isEmpty) return source;
    final Path dest = Path();
    for (final metric in source.computeMetrics()) {
      final double scale;
      if (pathLength == null || pathLength <= 0) {
        scale = 1.0;
      } else {
        scale = metric.length / pathLength;
      }
      final double totalLength = dashArray.fold(
        0.0,
        (sum, d) => sum + d * scale,
      );
      if (totalLength <= 0) return source;
      double offset = (dashOffset ?? 0.0) * scale;
      offset = offset % totalLength;
      if (offset < 0) {
        offset += totalLength;
      }
      double remainingPhase = offset;
      int index = 0;
      bool draw = true;
      while (remainingPhase >= dashArray[index] * scale) {
        remainingPhase -= dashArray[index] * scale;
        draw = !draw;
        index = (index + 1) % dashArray.length;
      }
      double distance = 0.0;
      double segmentLen = (dashArray[index] * scale) - remainingPhase;
      while (distance < metric.length) {
        final double len = segmentLen;
        if (len > 0) {
          if (draw) {
            final double end = distance + len < metric.length ? distance + len : metric.length;
            dest.addPath(metric.extractPath(distance, end), Offset.zero);
          }
          distance += len;
        }
        draw = !draw;
        index = (index + 1) % dashArray.length;
        segmentLen = dashArray[index] * scale;
      }
    }
    return dest;
  }

  @override
  bool shouldRepaint(covariant _$DQuadraticBezierPainter oldDelegate) {
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

class DEllipticalArcPainterWidget extends StatelessWidget {
  const DEllipticalArcPainterWidget({
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
      size: Size(width ?? 20.0, height ?? 20.0),
      painter: _$DEllipticalArcPainter(fit: fit),
    );
  }
}

class _$DEllipticalArcPainter extends CustomPainter {
  const _$DEllipticalArcPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(20.0, 20.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(20.0, 20.0),
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
      final Path path = Path()
        ..moveTo(6.0, 10.0)
        ..arcToPoint(
          const Offset(14.0, 10.0),
          radius: const Radius.elliptical(6.0, 4.0),
          rotation: 10.0,
          largeArc: true,
          clockwise: false,
        );
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(6.0, 10.0)
        ..arcToPoint(
          const Offset(14.0, 10.0),
          radius: const Radius.elliptical(6.0, 4.0),
          rotation: 10.0,
          largeArc: true,
          clockwise: true,
        );
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF00FF00);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(6.0, 10.0)
        ..arcToPoint(
          const Offset(14.0, 10.0),
          radius: const Radius.elliptical(6.0, 4.0),
          rotation: 10.0,
          largeArc: false,
          clockwise: true,
        );
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF800080);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(6.0, 10.0)
        ..arcToPoint(
          const Offset(14.0, 10.0),
          radius: const Radius.elliptical(6.0, 4.0),
          rotation: 10.0,
          largeArc: false,
          clockwise: false,
        );
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFC0CB);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
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
  bool shouldRepaint(covariant _$DEllipticalArcPainter oldDelegate) {
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

class DClosePathPainterWidget extends StatelessWidget {
  const DClosePathPainterWidget({
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
      size: Size(width ?? 30.0, height ?? 11.0),
      painter: _$DClosePathPainter(fit: fit),
    );
  }
}

class _$DClosePathPainter extends CustomPainter {
  const _$DClosePathPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(30.0, 11.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(30.0, 11.0),
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
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 30.0, 11.0));
    canvas.save();
    canvas.translate(-0.0, 1.0);
    {
      final Path path = Path()
        ..moveTo(5.0, 1.0)
        ..lineTo(1.0, 9.0)
        ..lineTo(9.0, 9.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(15.0, 1.0)
        ..lineTo(11.0, 9.0)
        ..lineTo(19.0, 9.0)
        ..lineTo(15.0, 1.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(25.0, 1.0)
        ..lineTo(21.0, 9.0)
        ..lineTo(29.0, 9.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
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
  bool shouldRepaint(covariant _$DClosePathPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
