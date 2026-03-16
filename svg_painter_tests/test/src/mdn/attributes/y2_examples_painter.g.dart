// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'y2_examples_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class Y2ExamplesPainterWidget extends StatelessWidget {
  const Y2ExamplesPainterWidget({
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
      size: Size(width ?? 25.0, height ?? 25.0),
      painter: _$Y2ExamplesPainter(fit: fit),
    );
  }
}

class _$Y2ExamplesPainter extends CustomPainter {
  const _$Y2ExamplesPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(25.0, 25.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(25.0, 25.0),
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
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(const Offset(2.0, 20.0), const Offset(22.0, 0.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF008000);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(const Offset(2.0, 20.0), const Offset(22.0, 10.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(const Offset(2.0, 20.0), const Offset(22.0, 20.0), paint);
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
  bool shouldRepaint(covariant _$Y2ExamplesPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
