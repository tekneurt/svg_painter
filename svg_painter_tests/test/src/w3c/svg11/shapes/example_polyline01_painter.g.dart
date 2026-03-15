// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_polyline01_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class ExamplePolyline01PainterWidget extends StatelessWidget {
  const ExamplePolyline01PainterWidget({
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
      painter: _$ExamplePolyline01Painter(fit: fit),
    );
  }
}

class _$ExamplePolyline01Painter extends CustomPainter {
  const _$ExamplePolyline01Painter({this.fit = BoxFit.contain});

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
    canvas.clipRect(Rect.fromLTWH(0, 0, 453.54330708661416, 151.1811023622047));

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
        ..moveTo(50.0, 375.0)
        ..lineTo(150.0, 375.0)
        ..lineTo(150.0, 325.0)
        ..lineTo(250.0, 325.0)
        ..lineTo(250.0, 375.0)
        ..lineTo(350.0, 375.0)
        ..lineTo(350.0, 250.0)
        ..lineTo(450.0, 250.0)
        ..lineTo(450.0, 375.0)
        ..lineTo(550.0, 375.0)
        ..lineTo(550.0, 175.0)
        ..lineTo(650.0, 175.0)
        ..lineTo(650.0, 375.0)
        ..lineTo(750.0, 375.0)
        ..lineTo(750.0, 100.0)
        ..lineTo(850.0, 100.0)
        ..lineTo(850.0, 375.0)
        ..lineTo(950.0, 375.0)
        ..lineTo(950.0, 25.0)
        ..lineTo(1050.0, 25.0)
        ..lineTo(1050.0, 375.0)
        ..lineTo(1150.0, 375.0);
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
  bool shouldRepaint(covariant _$ExamplePolyline01Painter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
