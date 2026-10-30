// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mask_units_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class MaskUnitsPainterWidget extends StatelessWidget {
  const MaskUnitsPainterWidget({
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
      painter: _$MaskUnitsPainter(fit: fit),
    );
  }
}

class _$MaskUnitsPainter extends CustomPainter {
  const _$MaskUnitsPainter({this.fit = BoxFit.contain});

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

    void _mask_myMask1(Canvas canvas, Size size, Rect targetBounds) {
      canvas.clipRect(
        Rect.fromLTWH(
          (0.2 * viewBox.width),
          (0.2 * viewBox.height),
          (0.6 * viewBox.width),
          (0.6 * viewBox.height),
        ),
      );
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 100.0, 100.0), paint);
      }
      {
        final Paint paint = Paint();
        paint.color = Colors.white;
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(50.0, 50.0), 35.0, paint);
      }
    }

    void _mask_myMask2(Canvas canvas, Size size, Rect targetBounds) {
      canvas.clipRect(
        Rect.fromLTWH(
          targetBounds.left + (0.2 * targetBounds.width),
          targetBounds.top + (0.2 * targetBounds.height),
          (0.6 * targetBounds.width),
          (0.6 * targetBounds.height),
        ),
      );
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 100.0, 100.0), paint);
      }
      {
        final Paint paint = Paint();
        paint.color = Colors.white;
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(50.0, 50.0), 35.0, paint);
      }
    }

    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 45.0, 45.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 55.0, 45.0, 45.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(55.0, 55.0, 45.0, 45.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(55.0, 0.0, 45.0, 45.0), paint);
    }
    canvas.saveLayer(null, Paint());
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 45.0, 45.0), paint);
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
    _mask_myMask1(canvas, size, Rect.fromLTWH(0.0, 0.0, 45.0, 45.0));
    canvas.restore();
    canvas.restore();
    canvas.saveLayer(null, Paint());
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 55.0, 45.0, 45.0), paint);
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
    _mask_myMask1(canvas, size, Rect.fromLTWH(0.0, 55.0, 45.0, 45.0));
    canvas.restore();
    canvas.restore();
    canvas.saveLayer(null, Paint());
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(55.0, 55.0, 45.0, 45.0), paint);
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
    _mask_myMask1(canvas, size, Rect.fromLTWH(55.0, 55.0, 45.0, 45.0));
    canvas.restore();
    canvas.restore();
    canvas.saveLayer(null, Paint());
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(55.0, 0.0, 45.0, 45.0), paint);
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
    _mask_myMask2(canvas, size, Rect.fromLTWH(55.0, 0.0, 45.0, 45.0));
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
  bool shouldRepaint(covariant _$MaskUnitsPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
