// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradients_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, unused_local_variable, deprecated_member_use_from_same_package

class GradientsPainterWidget extends StatelessWidget {
  const GradientsPainterWidget({
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
      size: Size(width ?? 120.0, height ?? 240.0),
      painter: _$GradientsPainter(fit: fit),
    );
  }
}

class _$GradientsPainter extends CustomPainter {
  const _$GradientsPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(120.0, 240.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(120.0, 240.0),
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

    final Gradient _grad_Gradient1 = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: <Color>[
        const Color(0xFFFF0000),
        Colors.transparent,
        const Color(0xFF0000FF),
      ],
      stops: <double>[0.0, 0.5, 1.0],
      tileMode: TileMode.clamp,
    );
    final Gradient _grad_Gradient2 = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(-1.0, 1.0),
      colors: <Color>[
        const Color(0xFFFF0000),
        Colors.transparent,
        const Color(0xFF0000FF),
      ],
      stops: <double>[0.0, 0.5, 1.0],
      tileMode: TileMode.clamp,
    );
    {
      final Paint paint = Paint();
      paint.shader = _grad_Gradient1.createShader(
        Rect.fromLTWH(10.0, 10.0, 100.0, 100.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(10.0, 10.0, 100.0, 100.0),
          const Radius.elliptical(15.0, 15.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_Gradient2.createShader(
        Rect.fromLTWH(10.0, 120.0, 100.0, 100.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(10.0, 120.0, 100.0, 100.0),
          const Radius.elliptical(15.0, 15.0),
        ),
        paint,
      );
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
  bool shouldRepaint(covariant _$GradientsPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
