// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fe_gaussian_blur_element_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class FeGaussianBlurElement1PainterWidget extends StatelessWidget {
  const FeGaussianBlurElement1PainterWidget({
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
      size: Size(width ?? 230.0, height ?? 120.0),
      painter: _$FeGaussianBlurElement1Painter(fit: fit),
    );
  }
}

class _$FeGaussianBlurElement1Painter extends CustomPainter {
  const _$FeGaussianBlurElement1Painter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(230.0, 120.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(230.0, 120.0),
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

    void _filter_blurMe(Canvas canvas, void Function() drawGraphic) {
      canvas.saveLayer(
        null,
        Paint()..imageFilter = ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      );
      drawGraphic();
      canvas.restore();
    }

    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF008000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(60.0, 60.0), 50.0, paint);
    }
    _filter_blurMe(canvas, () {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF008000);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(170.0, 60.0), 50.0, paint);
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
  bool shouldRepaint(covariant _$FeGaussianBlurElement1Painter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class FeGaussianBlurElement2PainterWidget extends StatelessWidget {
  const FeGaussianBlurElement2PainterWidget({
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
      painter: _$FeGaussianBlurElement2Painter(fit: fit),
    );
  }
}

class _$FeGaussianBlurElement2Painter extends CustomPainter {
  const _$FeGaussianBlurElement2Painter({this.fit = BoxFit.contain});

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

    void _filter_dropShadow(Canvas canvas, void Function() drawGraphic) {
      canvas.save();
      canvas.translate(2.0, 4.0);
      canvas.saveLayer(
        null,
        Paint()
          ..imageFilter = ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0)
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

    _filter_dropShadow(canvas, () {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF008000);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(60.0, 60.0), 50.0, paint);
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
  bool shouldRepaint(covariant _$FeGaussianBlurElement2Painter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
