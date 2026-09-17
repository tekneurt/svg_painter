// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hex_color_mapping_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class HexColorMappingPainterWidget extends StatelessWidget {
  const HexColorMappingPainterWidget({
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
      size: Size(width ?? 120.0, height ?? 60.0),
      painter: _$HexColorMappingPainter(fit: fit),
    );
  }
}

class _$HexColorMappingPainter extends CustomPainter {
  const _$HexColorMappingPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

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
      colors: <Color>[const Color(0xFF000000), const Color(0xFFF44336)],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp,
    );
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF000000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(5.0, 5.0, 30.0, 50.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFF44336);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(45.0, 5.0, 30.0, 50.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF000000);
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
  bool shouldRepaint(covariant _$HexColorMappingPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
