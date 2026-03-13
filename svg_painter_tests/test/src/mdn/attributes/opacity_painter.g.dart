// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opacity_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class OpacityPainterWidget extends StatelessWidget {
  const OpacityPainterWidget({
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
      painter: _$OpacityPainter(fit: fit),
    );
  }
}

class _$OpacityPainter extends CustomPainter {
  const _$OpacityPainter({this.fit = BoxFit.contain});

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
    canvas.clipRect(Rect.fromLTWH(0, 0, 200.0, 100.0));

    final Gradient _grad_gradient = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(-1.0, 1.0),
      colors: <Color>[const Color(0xFF87CEEB), const Color(0xFF2E8B57)],
      stops: <double>[0.0, 1.0],
    );
    {
      final Paint paint = Paint();
      paint.shader = _grad_gradient.createShader(
        Rect.fromLTWH(0.0, 0.0, 200.0, 100.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 200.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(50.0, 50.0), 40.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0x4D000000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(150.0, 50.0), 40.0, paint);
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
  bool shouldRepaint(covariant _$OpacityPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    }

    return true;
  }
}
