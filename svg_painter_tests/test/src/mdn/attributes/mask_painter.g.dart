// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mask_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class MaskAttributePainterWidget extends StatelessWidget {
  const MaskAttributePainterWidget({
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
      painter: _$MaskAttributePainter(fit: fit),
    );
  }
}

class _$MaskAttributePainter extends CustomPainter {
  const _$MaskAttributePainter({this.fit = BoxFit.contain});

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

    void _mask_myMask(Canvas canvas, Size size, Rect targetBounds) {
      canvas.clipRect(
        Rect.fromLTWH(
          targetBounds.left + (-0.1 * targetBounds.width),
          targetBounds.top + (-0.1 * targetBounds.height),
          (1.2 * targetBounds.width),
          (1.2 * targetBounds.height),
        ),
      );
      canvas.save();
      canvas.translate(targetBounds.left, targetBounds.top);
      canvas.scale(targetBounds.width, targetBounds.height);
      {
        final Paint paint = Paint();
        paint.color = Colors.white;
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 1.0, 1.0), paint);
      }
      {
        final Path path = Path()
          ..moveTo(0.5, 0.2)
          ..lineTo(0.68, 0.74)
          ..lineTo(0.21, 0.41)
          ..lineTo(0.79, 0.41)
          ..lineTo(0.32, 0.74)
          ..close();
        {
          final Paint paint = Paint();
          paint.color = Colors.black;
          paint.style = PaintingStyle.fill;
          canvas.drawPath(path, paint);
        }
      }
      canvas.restore();
    }

    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(50.0, 50.0), 20.0, paint);
    }
    canvas.saveLayer(null, Paint());
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(50.0, 50.0), 45.0, paint);
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
      Rect.fromCircle(center: const Offset(50.0, 50.0), radius: 45.0),
    );
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
  bool shouldRepaint(covariant _$MaskAttributePainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
