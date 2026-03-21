// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'r_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class RPainterWidget extends StatelessWidget {
  const RPainterWidget({
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
      size: Size(width ?? 300.0, height ?? 200.0),
      painter: _$RPainter(fit: fit),
    );
  }
}

class _$RPainter extends CustomPainter {
  const _$RPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(300.0, 200.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(300.0, 200.0),
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

    final Gradient _grad_myGradient000 = RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.0,
      focal: Alignment(0.0, 0.0),
      focalRadius: 0.0,
      colors: <Color>[Colors.white, Colors.black],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp,
    );
    final Gradient _grad_myGradient050 = RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.5,
      focal: Alignment(0.0, 0.0),
      focalRadius: 0.0,
      colors: <Color>[Colors.white, Colors.black],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp,
    );
    final Gradient _grad_myGradient100 = RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 1.0,
      focal: Alignment(0.0, 0.0),
      focalRadius: 0.0,
      colors: <Color>[Colors.white, Colors.black],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp,
    );
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(150.0, 50.0), 25.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(250.0, 50.0), 50.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_myGradient000.createShader(
        Rect.fromLTWH(20.0, 120.0, 60.0, 60.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(20.0, 120.0, 60.0, 60.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_myGradient050.createShader(
        Rect.fromLTWH(120.0, 120.0, 60.0, 60.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(120.0, 120.0, 60.0, 60.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_myGradient100.createShader(
        Rect.fromLTWH(220.0, 120.0, 60.0, 60.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(220.0, 120.0, 60.0, 60.0), paint);
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
  bool shouldRepaint(covariant _$RPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
