// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_polygon01_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class ExamplePolygon01PainterWidget extends StatelessWidget {
  const ExamplePolygon01PainterWidget({
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
      painter: _$ExamplePolygon01Painter(fit: fit),
    );
  }
}

class _$ExamplePolygon01Painter extends CustomPainter {
  const _$ExamplePolygon01Painter({this.fit = BoxFit.contain});

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
      final Path path = Path()
        ..moveTo(350.0, 75.0)
        ..lineTo(379.0, 161.0)
        ..lineTo(469.0, 161.0)
        ..lineTo(397.0, 215.0)
        ..lineTo(423.0, 301.0)
        ..lineTo(350.0, 250.0)
        ..lineTo(277.0, 301.0)
        ..lineTo(303.0, 215.0)
        ..lineTo(231.0, 161.0)
        ..lineTo(321.0, 161.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(850.0, 75.0)
        ..lineTo(958.0, 137.5)
        ..lineTo(958.0, 262.5)
        ..lineTo(850.0, 325.0)
        ..lineTo(742.0, 262.6)
        ..lineTo(742.0, 137.5)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF00FF00);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 10.0;
        canvas.drawPath(path, paint);
      }
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
  bool shouldRepaint(covariant _$ExamplePolygon01Painter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
