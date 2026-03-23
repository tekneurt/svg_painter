// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fill_opacity_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class FillOpacityPainterWidget extends StatelessWidget {
  const FillOpacityPainterWidget({
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
      size: Size(width ?? 400.0, height ?? 100.0),
      painter: _$FillOpacityPainter(fit: fit),
    );
  }
}

class _$FillOpacityPainter extends CustomPainter {
  const _$FillOpacityPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(400.0, 100.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(400.0, 100.0),
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
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(50.0, 50.0), 40.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xB3000000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(150.0, 50.0), 40.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0x80000000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(250.0, 50.0), 40.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0x40000000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(350.0, 50.0), 40.0, paint);
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
  bool shouldRepaint(covariant _$FillOpacityPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
