// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stroke_linejoin_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class StrokeLinejoinPainterWidget extends StatelessWidget {
  const StrokeLinejoinPainterWidget({
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
      size: Size(width ?? 18.0, height ?? 12.0),
      painter: _$StrokeLinejoinPainter(fit: fit),
    );
  }
}

class _$StrokeLinejoinPainter extends CustomPainter {
  const _$StrokeLinejoinPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(18.0, 12.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(18.0, 12.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 18.0, 12.0));

    {
      final Path path = Path()
        ..moveTo(1.0, 5.0)
        ..arcToPoint(
          const Offset(3.0, 2.0),
          radius: const Radius.elliptical(2.0, 2.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: false,
        )
        ..arcToPoint(
          const Offset(5.0, 5.5),
          radius: const Radius.elliptical(3.0, 3.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        );
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
        ..moveTo(7.0, 5.0)
        ..arcToPoint(
          const Offset(9.0, 2.0),
          radius: const Radius.elliptical(2.0, 2.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: false,
        )
        ..arcToPoint(
          const Offset(11.0, 5.5),
          radius: const Radius.elliptical(3.0, 3.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        );
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        paint.strokeJoin = StrokeJoin.round;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(13.0, 5.0)
        ..arcToPoint(
          const Offset(15.0, 2.0),
          radius: const Radius.elliptical(2.0, 2.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: false,
        )
        ..arcToPoint(
          const Offset(17.0, 5.5),
          radius: const Radius.elliptical(3.0, 3.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        );
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        paint.strokeJoin = StrokeJoin.bevel;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(3.0, 11.0)
        ..arcToPoint(
          const Offset(5.0, 8.0),
          radius: const Radius.elliptical(2.0, 2.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: false,
        )
        ..arcToPoint(
          const Offset(7.0, 11.5),
          radius: const Radius.elliptical(3.0, 3.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        );
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
        ..moveTo(9.0, 11.0)
        ..arcToPoint(
          const Offset(11.0, 8.0),
          radius: const Radius.elliptical(2.0, 2.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: false,
        )
        ..arcToPoint(
          const Offset(13.0, 11.5),
          radius: const Radius.elliptical(3.0, 3.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        );
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
        ..moveTo(1.0, 5.0)
        ..arcToPoint(
          const Offset(3.0, 2.0),
          radius: const Radius.elliptical(2.0, 2.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: false,
        )
        ..arcToPoint(
          const Offset(5.0, 5.5),
          radius: const Radius.elliptical(3.0, 3.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        );
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFC0CB);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 0.05;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(1.0, 5.0), 0.1, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(3.0, 2.0), 0.1, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(5.0, 5.5), 0.1, paint);
    }
    canvas.save();
    canvas.translate(6.0, 0.0);
    {
      final Path path = Path()
        ..moveTo(1.0, 5.0)
        ..arcToPoint(
          const Offset(3.0, 2.0),
          radius: const Radius.elliptical(2.0, 2.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: false,
        )
        ..arcToPoint(
          const Offset(5.0, 5.5),
          radius: const Radius.elliptical(3.0, 3.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        );
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFC0CB);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 0.05;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(1.0, 5.0), 0.1, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(3.0, 2.0), 0.1, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(5.0, 5.5), 0.1, paint);
    }
    canvas.restore();
    canvas.save();
    canvas.translate(12.0, 0.0);
    {
      final Path path = Path()
        ..moveTo(1.0, 5.0)
        ..arcToPoint(
          const Offset(3.0, 2.0),
          radius: const Radius.elliptical(2.0, 2.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: false,
        )
        ..arcToPoint(
          const Offset(5.0, 5.5),
          radius: const Radius.elliptical(3.0, 3.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        );
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFC0CB);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 0.05;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(1.0, 5.0), 0.1, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(3.0, 2.0), 0.1, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(5.0, 5.5), 0.1, paint);
    }
    canvas.restore();
    canvas.save();
    canvas.translate(2.0, 6.0);
    {
      final Path path = Path()
        ..moveTo(1.0, 5.0)
        ..arcToPoint(
          const Offset(3.0, 2.0),
          radius: const Radius.elliptical(2.0, 2.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: false,
        )
        ..arcToPoint(
          const Offset(5.0, 5.5),
          radius: const Radius.elliptical(3.0, 3.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        );
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFC0CB);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 0.05;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(1.0, 5.0), 0.1, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(3.0, 2.0), 0.1, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(5.0, 5.5), 0.1, paint);
    }
    canvas.restore();
    canvas.save();
    canvas.translate(8.0, 6.0);
    {
      final Path path = Path()
        ..moveTo(1.0, 5.0)
        ..arcToPoint(
          const Offset(3.0, 2.0),
          radius: const Radius.elliptical(2.0, 2.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: false,
        )
        ..arcToPoint(
          const Offset(5.0, 5.5),
          radius: const Radius.elliptical(3.0, 3.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        );
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFC0CB);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 0.05;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(1.0, 5.0), 0.1, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(3.0, 2.0), 0.1, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(5.0, 5.5), 0.1, paint);
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
  bool shouldRepaint(covariant _$StrokeLinejoinPainter oldDelegate) {
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

class StrokeLinejoinArcsPainterWidget extends StatelessWidget {
  const StrokeLinejoinArcsPainterWidget({
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
      painter: _$StrokeLinejoinArcsPainter(fit: fit),
    );
  }
}

class _$StrokeLinejoinArcsPainter extends CustomPainter {
  const _$StrokeLinejoinArcsPainter({this.fit = BoxFit.contain});

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
      final Path path = Path()
        ..moveTo(1.0, 5.0)
        ..arcToPoint(
          const Offset(3.0, 2.0),
          radius: const Radius.elliptical(2.0, 2.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: false,
        )
        ..arcToPoint(
          const Offset(5.0, 5.0),
          radius: const Radius.elliptical(3.0, 3.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        );
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
        ..moveTo(1.0, 5.0)
        ..arcToPoint(
          const Offset(3.0, 2.0),
          radius: const Radius.elliptical(2.0, 2.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: false,
        )
        ..arcToPoint(
          const Offset(5.0, 5.0),
          radius: const Radius.elliptical(3.0, 3.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        );
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
      canvas.drawCircle(const Offset(1.0, 5.0), 0.05, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(3.0, 2.0), 0.05, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(5.0, 5.0), 0.05, paint);
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
  bool shouldRepaint(covariant _$StrokeLinejoinArcsPainter oldDelegate) {
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

class StrokeLinejoinBevelPainterWidget extends StatelessWidget {
  const StrokeLinejoinBevelPainterWidget({
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
      painter: _$StrokeLinejoinBevelPainter(fit: fit),
    );
  }
}

class _$StrokeLinejoinBevelPainter extends CustomPainter {
  const _$StrokeLinejoinBevelPainter({this.fit = BoxFit.contain});

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
      final Path path = Path()
        ..moveTo(1.0, 5.0)
        ..lineTo(3.0, 2.0)
        ..lineTo(5.0, 5.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        paint.strokeJoin = StrokeJoin.bevel;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(1.0, 5.0)
        ..lineTo(3.0, 2.0)
        ..lineTo(5.0, 5.0);
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
      canvas.drawCircle(const Offset(1.0, 5.0), 0.05, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(3.0, 2.0), 0.05, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(5.0, 5.0), 0.05, paint);
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
  bool shouldRepaint(covariant _$StrokeLinejoinBevelPainter oldDelegate) {
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

class StrokeLinejoinMiterPainterWidget extends StatelessWidget {
  const StrokeLinejoinMiterPainterWidget({
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
      size: Size(width ?? 10.0, height ?? 7.0),
      painter: _$StrokeLinejoinMiterPainter(fit: fit),
    );
  }
}

class _$StrokeLinejoinMiterPainter extends CustomPainter {
  const _$StrokeLinejoinMiterPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(10.0, 7.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(10.0, 7.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 10.0, 7.0));

    canvas.save();
    canvas.translate(-0.0, 1.0);
    {
      final Path path = Path()
        ..moveTo(1.0, 5.0)
        ..lineTo(3.0, 2.0)
        ..lineTo(5.0, 5.0);
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
        ..moveTo(7.0, 5.0)
        ..lineTo(7.75, 2.0)
        ..lineTo(8.5, 5.0);
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
        ..moveTo(0.0, 0.0)
        ..lineTo(10.0, 0.0);
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
        paint.strokeWidth = 0.025;
        final List<double> dashArray = [0.05, 0.05];
        canvas.drawPath(_dashPath(path, dashArray), paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(1.0, 5.0)
        ..lineTo(3.0, 2.0)
        ..lineTo(5.0, 5.0);
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
      canvas.drawCircle(const Offset(1.0, 5.0), 0.05, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(3.0, 2.0), 0.05, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(5.0, 5.0), 0.05, paint);
    }
    {
      final Path path = Path()
        ..moveTo(7.0, 5.0)
        ..lineTo(7.75, 2.0)
        ..lineTo(8.5, 5.0);
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
      canvas.drawCircle(const Offset(7.0, 5.0), 0.05, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(7.75, 2.0), 0.05, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(8.5, 5.0), 0.05, paint);
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

  Path _dashPath(Path source, List<double> dashArray, {double? pathLength}) {
    if (dashArray.isEmpty) return source;
    final Path dest = Path();
    for (final metric in source.computeMetrics()) {
      final double scale;
      if (pathLength == null || pathLength <= 0) {
        scale = 1.0;
      } else {
        scale = metric.length / pathLength;
      }
      double distance = 0.0;
      int index = 0;
      bool draw = true;
      while (distance < metric.length) {
        final double len = dashArray[index] * scale;
        if (len > 0) {
          if (draw) {
            final double end = distance + len < metric.length
                ? distance + len
                : metric.length;
            dest.addPath(metric.extractPath(distance, end), Offset.zero);
          }
          distance += len;
        }
        draw = !draw;
        index = (index + 1) % dashArray.length;
      }
    }
    return dest;
  }

  @override
  bool shouldRepaint(covariant _$StrokeLinejoinMiterPainter oldDelegate) {
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

class StrokeLinejoinMiterClipPainterWidget extends StatelessWidget {
  const StrokeLinejoinMiterClipPainterWidget({
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
      size: Size(width ?? 10.0, height ?? 7.0),
      painter: _$StrokeLinejoinMiterClipPainter(fit: fit),
    );
  }
}

class _$StrokeLinejoinMiterClipPainter extends CustomPainter {
  const _$StrokeLinejoinMiterClipPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(10.0, 7.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(10.0, 7.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 10.0, 7.0));

    canvas.save();
    canvas.translate(-0.0, 1.0);
    {
      final Path path = Path()
        ..moveTo(1.0, 5.0)
        ..lineTo(3.0, 2.0)
        ..lineTo(5.0, 5.0);
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
        ..moveTo(7.0, 5.0)
        ..lineTo(7.75, 2.0)
        ..lineTo(8.5, 5.0);
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
        ..moveTo(0.0, 0.0)
        ..lineTo(10.0, 0.0);
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
        paint.strokeWidth = 0.025;
        final List<double> dashArray = [0.05, 0.05];
        canvas.drawPath(_dashPath(path, dashArray), paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(1.0, 5.0)
        ..lineTo(3.0, 2.0)
        ..lineTo(5.0, 5.0);
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
      canvas.drawCircle(const Offset(1.0, 5.0), 0.05, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(3.0, 2.0), 0.05, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(5.0, 5.0), 0.05, paint);
    }
    {
      final Path path = Path()
        ..moveTo(7.0, 5.0)
        ..lineTo(7.75, 2.0)
        ..lineTo(8.5, 5.0);
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
      canvas.drawCircle(const Offset(7.0, 5.0), 0.05, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(7.75, 2.0), 0.05, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(8.5, 5.0), 0.05, paint);
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

  Path _dashPath(Path source, List<double> dashArray, {double? pathLength}) {
    if (dashArray.isEmpty) return source;
    final Path dest = Path();
    for (final metric in source.computeMetrics()) {
      final double scale;
      if (pathLength == null || pathLength <= 0) {
        scale = 1.0;
      } else {
        scale = metric.length / pathLength;
      }
      double distance = 0.0;
      int index = 0;
      bool draw = true;
      while (distance < metric.length) {
        final double len = dashArray[index] * scale;
        if (len > 0) {
          if (draw) {
            final double end = distance + len < metric.length
                ? distance + len
                : metric.length;
            dest.addPath(metric.extractPath(distance, end), Offset.zero);
          }
          distance += len;
        }
        draw = !draw;
        index = (index + 1) % dashArray.length;
      }
    }
    return dest;
  }

  @override
  bool shouldRepaint(covariant _$StrokeLinejoinMiterClipPainter oldDelegate) {
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

class StrokeLinejoinRoundPainterWidget extends StatelessWidget {
  const StrokeLinejoinRoundPainterWidget({
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
      painter: _$StrokeLinejoinRoundPainter(fit: fit),
    );
  }
}

class _$StrokeLinejoinRoundPainter extends CustomPainter {
  const _$StrokeLinejoinRoundPainter({this.fit = BoxFit.contain});

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
      final Path path = Path()
        ..moveTo(1.0, 5.0)
        ..lineTo(3.0, 2.0)
        ..lineTo(5.0, 5.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        paint.strokeJoin = StrokeJoin.round;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(1.0, 5.0)
        ..lineTo(3.0, 2.0)
        ..lineTo(5.0, 5.0);
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
      canvas.drawCircle(const Offset(1.0, 5.0), 0.05, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(3.0, 2.0), 0.05, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFC0CB);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(5.0, 5.0), 0.05, paint);
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
  bool shouldRepaint(covariant _$StrokeLinejoinRoundPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
