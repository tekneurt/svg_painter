// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radial_gradient_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class RadialGradientPainterWidget extends StatelessWidget {
  const RadialGradientPainterWidget({
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
      painter: _$RadialGradientPainter(fit: fit),
    );
  }
}

class _$RadialGradientPainter extends CustomPainter {
  const _$RadialGradientPainter({this.fit = BoxFit.contain});

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
    canvas.clipRect(Rect.fromLTWH(0, 0, 100.0, 100.0));

    final Gradient _grad_myGradient = RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.5,
      focal: Alignment(0.0, 0.0),
      focalRadius: 0.0,
      colors: [const Color(0xFFFFD700), const Color(0xFFFF0000)],
      stops: [0.1, 0.95],
    );
    {
      {
        final Paint paint = Paint();
        paint.shader = _grad_myGradient.createShader(
          Rect.fromCircle(center: const Offset(50.0, 50.0), radius: 50.0),
        );
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(50.0, 50.0), 50.0, paint);
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$RadialGradientPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
