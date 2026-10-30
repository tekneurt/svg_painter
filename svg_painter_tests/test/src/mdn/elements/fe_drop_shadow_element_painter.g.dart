// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fe_drop_shadow_element_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class FeDropShadowElementPainterWidget extends StatelessWidget {
  const FeDropShadowElementPainterWidget({
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
      painter: _$FeDropShadowElementPainter(fit: fit),
    );
  }
}

class _$FeDropShadowElementPainter extends CustomPainter {
  const _$FeDropShadowElementPainter({this.fit = BoxFit.contain});

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

    void _filter_shadow(Canvas canvas, void Function() drawGraphic) {
      canvas.save();
      canvas.translate(0.2, 0.4);
      canvas.saveLayer(
        null,
        Paint()
          ..imageFilter = ui.ImageFilter.blur(sigmaX: 0.2, sigmaY: 0.2)
          ..colorFilter = const ColorFilter.mode(
            Color(0xFF000000),
            BlendMode.srcIn,
          ),
      );
      drawGraphic();
      canvas.restore();
      canvas.restore();
      drawGraphic();
    }

    void _filter_shadow2(Canvas canvas, void Function() drawGraphic) {
      canvas.saveLayer(
        null,
        Paint()
          ..imageFilter = ui.ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5)
          ..colorFilter = const ColorFilter.mode(
            Color(0xFF00FFFF),
            BlendMode.srcIn,
          ),
      );
      drawGraphic();
      canvas.restore();
      drawGraphic();
    }

    void _filter_shadow3(Canvas canvas, void Function() drawGraphic) {
      canvas.save();
      canvas.translate(-0.8, -0.8);
      canvas.saveLayer(
        null,
        Paint()
          ..colorFilter = const ColorFilter.mode(
            Color(0x80FFC0CB),
            BlendMode.srcIn,
          ),
      );
      drawGraphic();
      canvas.restore();
      canvas.restore();
      drawGraphic();
    }

    _filter_shadow(canvas, () {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFC0CB);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(5.0, 5.0), 4.0, paint);
      }
    });
    _filter_shadow2(canvas, () {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFC0CB);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(15.0, 5.0), 4.0, paint);
      }
    });
    _filter_shadow3(canvas, () {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFC0CB);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(25.0, 5.0), 4.0, paint);
      }
    });
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
  bool shouldRepaint(covariant _$FeDropShadowElementPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
