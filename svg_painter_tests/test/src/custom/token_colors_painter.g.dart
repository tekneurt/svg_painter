// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_colors_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class TokenColorsPainterWidget extends StatelessWidget {
  const TokenColorsPainterWidget({
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.black,
    this.red,
  });

  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final Color? black;
  final Color? red;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width ?? 120.0, height ?? 60.0),
      painter: _$TokenColorsPainter(fit: fit, black: black, red: red),
    );
  }
}

class _$TokenColorsPainter extends CustomPainter {
  const _$TokenColorsPainter({this.fit = BoxFit.contain, this.black, this.red});

  final BoxFit fit;
  final Color? black;
  final Color? red;

  Size get viewBox => const Size(120.0, 60.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(120.0, 60.0),
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

    final Gradient _grad_tokenGrad = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: <Color>[black ?? Colors.black, red ?? Colors.red],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp,
    );
    {
      final Paint paint = Paint();
      final Color? localBlack = black;
      if (localBlack == null) {
        paint.color = Colors.black;
      } else {
        paint.color = localBlack;
      }
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(5.0, 5.0, 30.0, 50.0), paint);
    }
    {
      final Paint paint = Paint();
      final Color? localRed = red;
      if (localRed == null) {
        paint.color = Colors.red;
      } else {
        paint.color = localRed;
      }
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(45.0, 5.0, 30.0, 50.0), paint);
    }
    {
      final Paint paint = Paint();
      final Color? localBlack = black;
      if (localBlack == null) {
        paint.color = Colors.black;
      } else {
        paint.color = localBlack;
      }
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 4.0;
      canvas.drawRect(Rect.fromLTWH(45.0, 5.0, 30.0, 50.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _grad_tokenGrad.createShader(
        Rect.fromLTWH(85.0, 5.0, 30.0, 50.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(85.0, 5.0, 30.0, 50.0), paint);
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
  bool shouldRepaint(covariant _$TokenColorsPainter oldDelegate) {
    if (fit == oldDelegate.fit &&
        black == oldDelegate.black &&
        red == oldDelegate.red) {
      return false;
    } else {
      return true;
    }
  }
}
