// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_path_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class TextPathPainterWidget extends StatelessWidget {
  const TextPathPainterWidget({
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
      painter: _$TextPathPainter(fit: fit),
    );
  }
}

class _$TextPathPainter extends CustomPainter {
  const _$TextPathPainter({this.fit = BoxFit.contain});

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

    {
      final Path path = Path()
        ..moveTo(10.0, 90.0)
        ..quadraticBezierTo(90.0, 90.0, 90.0, 45.0)
        ..quadraticBezierTo(90.0, 10.0, 50.0, 10.0)
        ..quadraticBezierTo(10.0, 10.0, 10.0, 40.0)
        ..quadraticBezierTo(10.0, 70.0, 45.0, 70.0)
        ..quadraticBezierTo(70.0, 70.0, 75.0, 50.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(10.0, 90.0)
        ..quadraticBezierTo(90.0, 90.0, 90.0, 45.0)
        ..quadraticBezierTo(90.0, 10.0, 50.0, 10.0)
        ..quadraticBezierTo(10.0, 10.0, 10.0, 40.0)
        ..quadraticBezierTo(10.0, 70.0, 45.0, 70.0)
        ..quadraticBezierTo(70.0, 70.0, 75.0, 50.0);
      for (final metric in path.computeMetrics()) {
        double currentOffset = 0.0;
        final String text = 'Quick brown fox jumps over the lazy dog.';
        TextPainter tp;
        for (final String char in text.split('')) {
          tp = TextPainter(
            text: TextSpan(
              text: char,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                fontFamily: 'Tinos',
                package: 'svg_painter',
              ),
            ),
            textDirection: TextDirection.ltr,
          )..layout();
          final double halfWidth = tp.width / 2.0;
          final double distance = currentOffset + halfWidth;
          if (distance <= metric.length) {
            final tangent = metric.getTangentForOffset(distance);
            if (tangent != null) {
              canvas.save();
              canvas.translate(tangent.position.dx, tangent.position.dy);
              canvas.rotate(-tangent.angle);
              tp.paint(
                canvas,
                Offset(
                  -halfWidth,
                  -tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
                ),
              );
              canvas.restore();
            }
          }
          currentOffset += tp.width;
        }
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
  bool shouldRepaint(covariant _$TextPathPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
