// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mask_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class MaskPainterWidget extends StatelessWidget {
  const MaskPainterWidget({
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
      size: Size(width ?? 120.0, height ?? 120.0),
      painter: _$MaskPainter(fit: fit),
    );
  }
}

class _$MaskPainter extends CustomPainter {
  const _$MaskPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(120.0, 120.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(120.0, 120.0),
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
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 120.0, 120.0));
    canvas.save();
    canvas.translate(10.0, 10.0);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(-10.0, -10.0, 120.0, 120.0), paint);
    }
    void _mask_myMask(Canvas canvas, Size size, Rect targetBounds) {
      canvas.clipRect(
        Rect.fromLTWH(
          targetBounds.left + (-0.1 * targetBounds.width),
          targetBounds.top + (-0.1 * targetBounds.height),
          (1.2 * targetBounds.width),
          (1.2 * targetBounds.height),
        ),
      );
      {
        final Paint paint = Paint();
        paint.color = Colors.white;
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 100.0, 100.0), paint);
      }
      {
        final Path path = Path()
          ..moveTo(10.0, 35.0)
          ..arcToPoint(
            const Offset(50.0, 35.0),
            radius: const Radius.elliptical(20.0, 20.0),
            rotation: 0.0,
            largeArc: false,
            clockwise: true,
          )
          ..arcToPoint(
            const Offset(90.0, 35.0),
            radius: const Radius.elliptical(20.0, 20.0),
            rotation: 0.0,
            largeArc: false,
            clockwise: true,
          )
          ..quadraticBezierTo(90.0, 65.0, 50.0, 95.0)
          ..quadraticBezierTo(10.0, 65.0, 10.0, 35.0)
          ..close();
        {
          final Paint paint = Paint();
          paint.color = Colors.black;
          paint.style = PaintingStyle.fill;
          canvas.drawPath(path, paint);
        }
      }
    }

    {
      final Path path = Path()
        ..moveTo(-10.0, 110.0)
        ..lineTo(110.0, 110.0)
        ..lineTo(110.0, -10.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFA500);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    canvas.saveLayer(null, Paint());
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF800080);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(50.0, 50.0), 50.0, paint);
    }
    canvas.saveLayer(
      null,
      Paint()
        ..blendMode = BlendMode.dstIn
        ..colorFilter = const ColorFilter.matrix(<double>[
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0.2126,
          0.7152,
          0.0722,
          0,
          0,
        ]),
    );
    _mask_myMask(
      canvas,
      size,
      Rect.fromCircle(center: const Offset(50.0, 50.0), radius: 50.0),
    );
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
  bool shouldRepaint(covariant _$MaskPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
