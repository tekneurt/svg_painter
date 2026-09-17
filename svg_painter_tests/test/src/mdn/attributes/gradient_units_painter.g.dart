// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradient_units_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class GradientUnitsPainterWidget extends StatelessWidget {
  const GradientUnitsPainterWidget({
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
      size: Size(width ?? 420.0, height ?? 200.0),
      painter: _$GradientUnitsPainter(fit: fit),
    );
  }
}

class _$GradientUnitsPainter extends CustomPainter {
  const _$GradientUnitsPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(420.0, 200.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(420.0, 200.0),
      size,
    );
    final Size sourceSize = fittedSizes.source;
    final Rect destRect = Alignment.center.inscribe(
      fittedSizes.destination,
      Offset.zero & size,
    );
    final Rect viewBoxRect = Rect.fromLTWH(0, 0, 420.0, 200.0);

    canvas.save();
    canvas.translate(destRect.left, destRect.top);
    canvas.scale(
      destRect.width / sourceSize.width,
      destRect.height / sourceSize.height,
    );

    final Gradient _grad_gradient1 = RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.5,
      focal: Alignment(0.0, 0.0),
      focalRadius: 0.0,
      colors: <Color>[
        const Color(0xFF00008B),
        const Color(0xFF87CEEB),
        const Color(0xFF00008B),
      ],
      stops: <double>[0.0, 0.5, 1.0],
      tileMode: TileMode.clamp,
    );
    final Gradient _grad_gradient2 = RadialGradient(
      center: Alignment(0.5238095238095237, 0.0),
      radius: 0.3040089501552408,
      focal: Alignment(0.5238095238095237, 0.0),
      focalRadius: 0.0,
      colors: <Color>[
        const Color(0xFF00008B),
        const Color(0xFF87CEEB),
        const Color(0xFF00008B),
      ],
      stops: <double>[0.0, 0.5, 1.0],
      tileMode: TileMode.clamp,
    );
    {
      final Paint paint = Paint();
      paint.shader = _grad_gradient1.createShader(
        Rect.fromLTWH(0.0, 0.0, 200.0, 200.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 200.0, 200.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_gradient2.createShader(viewBoxRect);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(220.0, 0.0, 200.0, 200.0), paint);
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
  bool shouldRepaint(covariant _$GradientUnitsPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
