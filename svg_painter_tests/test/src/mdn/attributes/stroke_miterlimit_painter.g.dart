// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stroke_miterlimit_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class StrokeMiterlimitPainterWidget extends StatelessWidget {
  const StrokeMiterlimitPainterWidget({
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
      size: Size(width ?? 38.0, height ?? 30.0),
      painter: _$StrokeMiterlimitPainter(fit: fit),
    );
  }
}

class _$StrokeMiterlimitPainter extends CustomPainter {
  const _$StrokeMiterlimitPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(38.0, 30.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(38.0, 30.0),
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
      final Path path = Path()
        ..moveTo(1.0, 9.0)
        ..lineTo(8.0, 6.0)
        ..lineTo(15.0, 9.0)
        ..moveTo(17.0, 9.0)
        ..lineTo(20.5, 6.0)
        ..lineTo(24.0, 9.0)
        ..moveTo(26.0, 9.0)
        ..lineTo(28.0, 6.0)
        ..lineTo(30.0, 9.0)
        ..moveTo(32.0, 9.0)
        ..lineTo(32.75, 6.0)
        ..lineTo(33.5, 9.0)
        ..moveTo(35.5, 9.0)
        ..lineTo(36.0, 6.0)
        ..lineTo(36.5, 9.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(1.0, 19.0)
        ..lineTo(8.0, 16.0)
        ..lineTo(15.0, 19.0)
        ..moveTo(17.0, 19.0)
        ..lineTo(20.5, 16.0)
        ..lineTo(24.0, 19.0)
        ..moveTo(26.0, 19.0)
        ..lineTo(28.0, 16.0)
        ..lineTo(30.0, 19.0)
        ..moveTo(32.0, 19.0)
        ..lineTo(32.75, 16.0)
        ..lineTo(33.5, 19.0)
        ..moveTo(35.5, 19.0)
        ..lineTo(36.0, 16.0)
        ..lineTo(36.5, 19.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(1.0, 29.0)
        ..lineTo(8.0, 26.0)
        ..lineTo(15.0, 29.0)
        ..moveTo(17.0, 29.0)
        ..lineTo(20.5, 26.0)
        ..lineTo(24.0, 29.0)
        ..moveTo(26.0, 29.0)
        ..lineTo(28.0, 26.0)
        ..lineTo(30.0, 29.0)
        ..moveTo(32.0, 29.0)
        ..lineTo(32.75, 26.0)
        ..lineTo(33.5, 29.0)
        ..moveTo(35.5, 29.0)
        ..lineTo(36.0, 26.0)
        ..lineTo(36.5, 29.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(1.0, 9.0)
        ..lineTo(8.0, 6.0)
        ..lineTo(15.0, 9.0)
        ..moveTo(17.0, 9.0)
        ..lineTo(20.5, 6.0)
        ..lineTo(24.0, 9.0)
        ..moveTo(26.0, 9.0)
        ..lineTo(28.0, 6.0)
        ..lineTo(30.0, 9.0)
        ..moveTo(32.0, 9.0)
        ..lineTo(32.75, 6.0)
        ..lineTo(33.5, 9.0)
        ..moveTo(35.5, 9.0)
        ..lineTo(36.0, 6.0)
        ..lineTo(36.5, 9.0)
        ..moveTo(1.0, 19.0)
        ..lineTo(8.0, 16.0)
        ..lineTo(15.0, 19.0)
        ..moveTo(17.0, 19.0)
        ..lineTo(20.5, 16.0)
        ..lineTo(24.0, 19.0)
        ..moveTo(26.0, 19.0)
        ..lineTo(28.0, 16.0)
        ..lineTo(30.0, 19.0)
        ..moveTo(32.0, 19.0)
        ..lineTo(32.75, 16.0)
        ..lineTo(33.5, 19.0)
        ..moveTo(35.5, 19.0)
        ..lineTo(36.0, 16.0)
        ..lineTo(36.5, 19.0)
        ..moveTo(1.0, 29.0)
        ..lineTo(8.0, 26.0)
        ..lineTo(15.0, 29.0)
        ..moveTo(17.0, 29.0)
        ..lineTo(20.5, 26.0)
        ..lineTo(24.0, 29.0)
        ..moveTo(26.0, 29.0)
        ..lineTo(28.0, 26.0)
        ..lineTo(30.0, 29.0)
        ..moveTo(32.0, 29.0)
        ..lineTo(32.75, 26.0)
        ..lineTo(33.5, 29.0)
        ..moveTo(35.5, 29.0)
        ..lineTo(36.0, 26.0)
        ..lineTo(36.5, 29.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFC0CB);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 0.05;
        canvas.drawPath(path, paint);
      }
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
  bool shouldRepaint(covariant _$StrokeMiterlimitPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
