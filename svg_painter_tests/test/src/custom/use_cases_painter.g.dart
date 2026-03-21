// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'use_cases_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class UseCasesPainterWidget extends StatelessWidget {
  const UseCasesPainterWidget({
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
      size: Size(width ?? 300.0, height ?? 100.0),
      painter: _$UseCasesPainter(fit: fit),
    );
  }
}

class _$UseCasesPainter extends CustomPainter {
  const _$UseCasesPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(300.0, 100.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(300.0, 100.0),
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
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawOval(Rect.fromLTWH(220.0, 30.0, 60.0, 40.0), paint);
    }
    canvas.save();
    canvas.translate(50.0, 50.0);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(0.0, 0.0), 20.0, paint);
    }
    canvas.restore();
    canvas.save();
    canvas.translate(150.0, 50.0);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(-20.0, -20.0, 40.0, 40.0), paint);
    }
    canvas.restore();
    canvas.save();
    canvas.translate(-200.0, 0.0);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawOval(Rect.fromLTWH(220.0, 30.0, 60.0, 40.0), paint);
    }
    canvas.restore();
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
  bool shouldRepaint(covariant _$UseCasesPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
