// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_lingrad01_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, unused_local_variable, deprecated_member_use_from_same_package

class ExampleLingrad01PainterWidget extends StatelessWidget {
  const ExampleLingrad01PainterWidget({
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
    return Semantics(
      hint:
          'Example lingrad01 - fill a rectangle using a \n           linear gradient paint server',
      child: CustomPaint(
        size: Size(width ?? 302.3622047244094, height ?? 151.1811023622047),
        painter: _$ExampleLingrad01Painter(fit: fit),
      ),
    );
  }
}

class _$ExampleLingrad01Painter extends CustomPainter {
  const _$ExampleLingrad01Painter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(302.3622047244094, 151.1811023622047);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(302.3622047244094, 151.1811023622047),
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

    final Gradient _grad_MyGradient = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: <Color>[const Color(0xFFFF6600), const Color(0xFFFFFF66)],
      stops: <double>[0.05, 0.95],
      tileMode: TileMode.clamp,
    );
    canvas.save();
    canvas.scale(0.3779527559055118, 0.3779527559055118);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(1.0, 1.0, 798.0, 398.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_MyGradient.createShader(
        Rect.fromLTWH(100.0, 100.0, 600.0, 200.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(100.0, 100.0, 600.0, 200.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 5.0;
      canvas.drawRect(Rect.fromLTWH(100.0, 100.0, 600.0, 200.0), paint);
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
  bool shouldRepaint(covariant _$ExampleLingrad01Painter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
