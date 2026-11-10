// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flutter_logo_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, unused_local_variable, deprecated_member_use_from_same_package

class FlutterLogoPainterWidget extends StatelessWidget {
  const FlutterLogoPainterWidget({
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
      size: Size(width ?? 166.0, height ?? 202.0),
      painter: _$FlutterLogoPainter(fit: fit),
    );
  }
}

class _$FlutterLogoPainter extends CustomPainter {
  const _$FlutterLogoPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(166.0, 202.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(166.0, 202.0),
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

    final Gradient _grad_triangleGradient = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: <Color>[const Color(0x8C000000), const Color(0x03616161)],
      stops: <double>[0.2, 0.85],
      tileMode: TileMode.clamp,
    );
    final Gradient _grad_rectangleGradient = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(-1.0, 1.0),
      colors: <Color>[const Color(0x26000000), const Color(0x03616161)],
      stops: <double>[0.2, 0.85],
      tileMode: TileMode.clamp,
    );
    {
      final Path path = Path()
        ..moveTo(37.7, 128.9)
        ..lineTo(9.8, 101.0)
        ..lineTo(100.4, 10.4)
        ..lineTo(156.2, 10.4);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xCC42A5F5);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(156.2, 94.0)
        ..lineTo(100.4, 94.0)
        ..lineTo(79.5, 114.9)
        ..lineTo(107.4, 142.8);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xCC42A5F5);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(79.5, 170.7)
        ..lineTo(100.4, 191.6)
        ..lineTo(156.2, 191.6)
        ..lineTo(156.2, 191.6)
        ..lineTo(107.4, 142.8);
      {
        final Paint paint = Paint();
        paint.color = Colors.blue.shade900;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    canvas.save();
    canvas.transform(
      Matrix4.fromList(<double>[
        0.7071,
        -0.7071,
        0,
        0,
        0.7071,
        0.7071,
        0,
        0,
        0,
        0,
        1,
        0,
        -77.667,
        98.057,
        0,
        1,
      ]).storage,
    );
    {
      final Paint paint = Paint();
      paint.color = Colors.blue.shade400;
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(59.8, 123.1, 39.4, 39.4), paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_rectangleGradient.createShader(
        Rect.fromLTWH(59.8, 162.5, 39.4, 5.5),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(59.8, 162.5, 39.4, 5.5), paint);
    }
    canvas.restore();
    {
      final Path path = Path()
        ..moveTo(79.5, 170.7)
        ..lineTo(120.9, 156.4)
        ..lineTo(107.4, 142.8);
      {
        final Paint paint = Paint();
        paint.shader = _grad_triangleGradient.createShader(path.getBounds());
        paint.style = PaintingStyle.fill;
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
  bool shouldRepaint(covariant _$FlutterLogoPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
