// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stick_figure_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, unused_local_variable, deprecated_member_use_from_same_package

class StickFigurePainterWidget extends StatelessWidget {
  const StickFigurePainterWidget({
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
    return Semantics(
      label: 'svg/stick_figure',
      hint: 'Created with Sketch.',
      child: CustomPaint(
        size: Size(width ?? 27.0, height ?? 90.0),
        painter: _$StickFigurePainter(fit: fit),
      ),
    );
  }
}

class _$StickFigurePainter extends CustomPainter {
  const _$StickFigurePainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(27.0, 90.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(27.0, 90.0),
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

    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 27.0, 90.0));
    canvas.save();
    canvas.translate(1.928571428571427, 0.0);
    canvas.scale(1.2857142857142858, 1.2857142857142858);
    canvas.translate(-5.0, -10.0);
    canvas.save();
    canvas.translate(-53.0, -359.0);
    canvas.save();
    canvas.translate(53.0, 359.0);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFD8D8D8);
      paint.style = PaintingStyle.fill;
      canvas.drawOval(Rect.fromLTWH(1.5, 0.5, 24.0, 23.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF979797);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawOval(Rect.fromLTWH(1.5, 0.5, 24.0, 23.0), paint);
    }
    {
      final Path path = Path()
        ..moveTo(13.5, 24.0)
        ..lineTo(13.5, 71.5);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF979797);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        paint.strokeCap = StrokeCap.square;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(13.5, 71.5)
        ..lineTo(1.0, 89.5);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF979797);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        paint.strokeCap = StrokeCap.square;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(13.5, 37.5)
        ..lineTo(1.0, 55.5);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF979797);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        paint.strokeCap = StrokeCap.square;
        canvas.drawPath(path, paint);
      }
    }
    canvas.save();
    canvas.translate(20.0, 80.5);
    canvas.scale(-1.0, 1.0);
    canvas.translate(-20.0, -80.5);
    {
      final Path path = Path()
        ..moveTo(26.5, 71.5)
        ..lineTo(14.0, 89.5);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF979797);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        paint.strokeCap = StrokeCap.square;
        canvas.drawPath(path, paint);
      }
    }
    canvas.restore();
    canvas.save();
    canvas.translate(20.0, 46.5);
    canvas.scale(-1.0, 1.0);
    canvas.translate(-20.0, -46.5);
    {
      final Path path = Path()
        ..moveTo(26.5, 37.5)
        ..lineTo(14.0, 55.5);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF979797);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        paint.strokeCap = StrokeCap.square;
        canvas.drawPath(path, paint);
      }
    }
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.restore();
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
  bool shouldRepaint(covariant _$StickFigurePainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
