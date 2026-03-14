// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stroke_linecap_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class StrokeLinecapPainterWidget extends StatelessWidget {
  const StrokeLinecapPainterWidget({
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
      size: Size(width ?? 6.0, height ?? 6.0),
      painter: _$StrokeLinecapPainter(fit: fit),
    );
  }
}

class _$StrokeLinecapPainter extends CustomPainter {
  const _$StrokeLinecapPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(6.0, 6.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(6.0, 6.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 6.0, 6.0));

    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawLine(const Offset(1.0, 1.0), const Offset(5.0, 1.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(const Offset(1.0, 1.0), const Offset(5.0, 1.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawLine(const Offset(1.0, 3.0), const Offset(5.0, 3.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      paint.strokeCap = StrokeCap.round;
      canvas.drawLine(const Offset(1.0, 3.0), const Offset(5.0, 3.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawLine(const Offset(1.0, 5.0), const Offset(5.0, 5.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      paint.strokeCap = StrokeCap.square;
      canvas.drawLine(const Offset(1.0, 5.0), const Offset(5.0, 5.0), paint);
    }
    {
      final Path path = Path()
        ..moveTo(1.0, 1.0)
        ..lineTo(5.0, 1.0)
        ..moveTo(1.0, 3.0)
        ..lineTo(5.0, 3.0)
        ..moveTo(1.0, 5.0)
        ..lineTo(5.0, 5.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFC0CB);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 0.025;
        canvas.drawPath(path, paint);
      }
    }
    canvas.restore();
  }

  void _applyOverride(Paint paint, Object? override) {
    if (override == null) return;
    if (override is Color) {
      paint.color = override;
      paint.shader = null;
    } else if (override is Shader) {
      paint.shader = override;
    }
  }

  @override
  bool shouldRepaint(covariant _$StrokeLinecapPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    }

    return true;
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class StrokeLinecapButtPainterWidget extends StatelessWidget {
  const StrokeLinecapButtPainterWidget({
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
      size: Size(width ?? 6.0, height ?? 4.0),
      painter: _$StrokeLinecapButtPainter(fit: fit),
    );
  }
}

class _$StrokeLinecapButtPainter extends CustomPainter {
  const _$StrokeLinecapButtPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(6.0, 4.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(6.0, 4.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 6.0, 4.0));

    {
      final Path path = Path()
        ..moveTo(1.0, 1.0)
        ..lineTo(5.0, 1.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(3.0, 3.0)
        ..lineTo(3.0, 3.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(1.0, 1.0)
        ..lineTo(5.0, 1.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFC0CB);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 0.025;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(1.0, 1.0), 0.05, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(5.0, 1.0), 0.05, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(3.0, 3.0), 0.05, paint);
    }
    canvas.restore();
  }

  void _applyOverride(Paint paint, Object? override) {
    if (override == null) return;
    if (override is Color) {
      paint.color = override;
      paint.shader = null;
    } else if (override is Shader) {
      paint.shader = override;
    }
  }

  @override
  bool shouldRepaint(covariant _$StrokeLinecapButtPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    }

    return true;
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class StrokeLinecapRoundPainterWidget extends StatelessWidget {
  const StrokeLinecapRoundPainterWidget({
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
      size: Size(width ?? 6.0, height ?? 4.0),
      painter: _$StrokeLinecapRoundPainter(fit: fit),
    );
  }
}

class _$StrokeLinecapRoundPainter extends CustomPainter {
  const _$StrokeLinecapRoundPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(6.0, 4.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(6.0, 4.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 6.0, 4.0));

    {
      final Path path = Path()
        ..moveTo(1.0, 1.0)
        ..lineTo(5.0, 1.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        paint.strokeCap = StrokeCap.round;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(3.0, 3.0)
        ..lineTo(3.0, 3.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        paint.strokeCap = StrokeCap.round;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(1.0, 1.0)
        ..lineTo(5.0, 1.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFC0CB);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 0.025;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(1.0, 1.0), 0.05, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(5.0, 1.0), 0.05, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(3.0, 3.0), 0.05, paint);
    }
    canvas.restore();
  }

  void _applyOverride(Paint paint, Object? override) {
    if (override == null) return;
    if (override is Color) {
      paint.color = override;
      paint.shader = null;
    } else if (override is Shader) {
      paint.shader = override;
    }
  }

  @override
  bool shouldRepaint(covariant _$StrokeLinecapRoundPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    }

    return true;
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class StrokeLinecapSquarePainterWidget extends StatelessWidget {
  const StrokeLinecapSquarePainterWidget({
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
      size: Size(width ?? 6.0, height ?? 4.0),
      painter: _$StrokeLinecapSquarePainter(fit: fit),
    );
  }
}

class _$StrokeLinecapSquarePainter extends CustomPainter {
  const _$StrokeLinecapSquarePainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(6.0, 4.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(6.0, 4.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 6.0, 4.0));

    {
      final Path path = Path()
        ..moveTo(1.0, 1.0)
        ..lineTo(5.0, 1.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        paint.strokeCap = StrokeCap.square;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(3.0, 3.0)
        ..lineTo(3.0, 3.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        paint.strokeCap = StrokeCap.square;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(1.0, 1.0)
        ..lineTo(5.0, 1.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFC0CB);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 0.025;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(1.0, 1.0), 0.05, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(5.0, 1.0), 0.05, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(3.0, 3.0), 0.05, paint);
    }
    canvas.restore();
  }

  void _applyOverride(Paint paint, Object? override) {
    if (override == null) return;
    if (override is Color) {
      paint.color = override;
      paint.shader = null;
    } else if (override is Shader) {
      paint.shader = override;
    }
  }

  @override
  bool shouldRepaint(covariant _$StrokeLinecapSquarePainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    }

    return true;
  }
}
