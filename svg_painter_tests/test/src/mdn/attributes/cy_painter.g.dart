// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cy_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class CyPainterWidget extends StatelessWidget {
  const CyPainterWidget({
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
      size: Size(width ?? 100.0, height ?? 300.0),
      painter: _$CyPainter(fit: fit),
    );
  }
}

class _$CyPainter extends CustomPainter {
  const _$CyPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(100.0, 300.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(100.0, 300.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 100.0, 300.0));

    final Gradient _grad_myGradient = RadialGradient(
      center: Alignment(0.0, -0.5),
      radius: 0.5,
      focal: Alignment(0.0, -0.5),
      colors: <Color>[Colors.white, Colors.black],
      stops: <double>[0.0, 1.0],
    );
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(50.0, 50.0), 45.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawOval(Rect.fromLTWH(25.0, 105.0, 50.0, 90.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_myGradient.createShader(
        Rect.fromLTWH(5.0, 205.0, 90.0, 90.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(5.0, 205.0, 90.0, 90.0), paint);
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
  bool shouldRepaint(covariant _$CyPainter oldDelegate) {
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

class CyRadialGradientPainterWidget extends StatelessWidget {
  const CyRadialGradientPainterWidget({
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
      size: Size(width ?? 34.0, height ?? 10.0),
      painter: _$CyRadialGradientPainter(fit: fit),
    );
  }
}

class _$CyRadialGradientPainter extends CustomPainter {
  const _$CyRadialGradientPainter({this.fit = BoxFit.contain});

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
      center: Alignment(0.0, -1.0),
      radius: 0.5,
      focal: Alignment(0.0, -1.0),
      colors: <Color>[
        const Color(0xFFFFD700),
        const Color(0xFF008000),
        Colors.white,
      ],
      stops: <double>[0.0, 0.5, 1.0],
    );
    final Gradient _grad_myGradient050 = RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.5,
      focal: Alignment(0.0, 0.0),
      colors: <Color>[
        const Color(0xFFFFD700),
        const Color(0xFF008000),
        Colors.white,
      ],
      stops: <double>[0.0, 0.5, 1.0],
    );
    final Gradient _grad_myGradient100 = RadialGradient(
      center: Alignment(0.0, 1.0),
      radius: 0.5,
      focal: Alignment(0.0, 1.0),
      colors: <Color>[
        const Color(0xFFFFD700),
        const Color(0xFF008000),
        Colors.white,
      ],
      stops: <double>[0.0, 0.5, 1.0],
    );
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
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(1.0, 1.0, 8.0, 8.0), paint);
    }
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
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(13.0, 1.0, 8.0, 8.0), paint);
    }
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
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(25.0, 1.0, 8.0, 8.0), paint);
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
  bool shouldRepaint(covariant _$CyRadialGradientPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
