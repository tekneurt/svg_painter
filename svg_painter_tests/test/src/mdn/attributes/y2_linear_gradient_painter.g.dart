// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'y2_linear_gradient_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class Y2LinearGradientPainterWidget extends StatelessWidget {
  const Y2LinearGradientPainterWidget({
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
      size: Size(width ?? 20.0, height ?? 10.0),
      painter: _$Y2LinearGradientPainter(fit: fit),
    );
  }
}

class _$Y2LinearGradientPainter extends CustomPainter {
  const _$Y2LinearGradientPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(20.0, 10.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(20.0, 10.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 20.0, 10.0));

    final Gradient _grad_g0 = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: [Colors.black, const Color(0xFFFF0000), Colors.black],
      stops: [0.05, 0.5, 0.95],
    );
    final Gradient _grad_g1 = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, 1.0),
      colors: [Colors.black, const Color(0xFFFF0000), Colors.black],
      stops: [0.05, 0.5, 0.95],
    );
    {
      {
        final Paint paint = Paint();
        paint.shader = _grad_g0.createShader(Rect.fromLTWH(1.0, 1.0, 8.0, 8.0));
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(1.0, 1.0, 8.0, 8.0), paint);
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.shader = _grad_g1.createShader(
          Rect.fromLTWH(11.0, 1.0, 8.0, 8.0),
        );
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(11.0, 1.0, 8.0, 8.0), paint);
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$Y2LinearGradientPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
