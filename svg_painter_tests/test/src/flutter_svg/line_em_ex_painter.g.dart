// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_em_ex_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, unused_local_variable, deprecated_member_use_from_same_package

class LineEmExPainterWidget extends StatelessWidget {
  const LineEmExPainterWidget({
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
      size: Size(width ?? 800.0, height ?? 600.0),
      painter: _$LineEmExPainter(fit: fit),
    );
  }
}

class _$LineEmExPainter extends CustomPainter {
  const _$LineEmExPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(800.0, 600.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(800.0, 600.0),
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
      paint.color = const Color(0xFFFFA500);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(0.0, 600.0),
        const Offset(400.0, 0.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFA500);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(400.0, 0.0),
        const Offset(800.0, 600.0),
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
  bool shouldRepaint(covariant _$LineEmExPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
