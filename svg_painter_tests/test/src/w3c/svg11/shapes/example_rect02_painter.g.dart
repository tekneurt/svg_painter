// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_rect02_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class ExampleRect02PainterWidget extends StatelessWidget {
  const ExampleRect02PainterWidget({
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
      size: Size(width ?? 453.54330708661416, height ?? 151.1811023622047),
      painter: _$ExampleRect02Painter(fit: fit),
    );
  }
}

class _$ExampleRect02Painter extends CustomPainter {
  const _$ExampleRect02Painter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(453.54330708661416, 151.1811023622047);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(453.54330708661416, 151.1811023622047),
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
    canvas.scale(0.3779527559055118, 0.3779527559055118);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 2.0;
      canvas.drawRect(Rect.fromLTWH(1.0, 1.0, 1198.0, 398.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF008000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(100.0, 100.0, 400.0, 200.0),
          const Radius.elliptical(50.0, 50.0),
        ),
        paint,
      );
    }
    canvas.save();
    canvas.translate(700.0, 210.0);
    canvas.rotate(-0.5235987755982988);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF800080);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 30.0;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0.0, 0.0, 400.0, 200.0),
          const Radius.elliptical(50.0, 50.0),
        ),
        paint,
      );
    }
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
  bool shouldRepaint(covariant _$ExampleRect02Painter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
