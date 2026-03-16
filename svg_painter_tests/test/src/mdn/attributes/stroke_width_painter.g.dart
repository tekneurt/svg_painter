// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stroke_width_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class StrokeWidthPainterWidget extends StatelessWidget {
  const StrokeWidthPainterWidget({
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
      size: Size(width ?? 30.0, height ?? 10.0),
      painter: _$StrokeWidthPainter(fit: fit),
    );
  }
}

class _$StrokeWidthPainter extends CustomPainter {
  const _$StrokeWidthPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(30.0, 10.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(30.0, 10.0),
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
      canvas.drawCircle(const Offset(5.0, 5.0), 3.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF008000);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawCircle(const Offset(5.0, 5.0), 3.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(15.0, 5.0), 3.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF008000);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 3.0;
      canvas.drawCircle(const Offset(15.0, 5.0), 3.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(25.0, 5.0), 3.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF008000);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 0.44721359549995787;
      canvas.drawCircle(const Offset(25.0, 5.0), 3.0, paint);
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
  bool shouldRepaint(covariant _$StrokeWidthPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
