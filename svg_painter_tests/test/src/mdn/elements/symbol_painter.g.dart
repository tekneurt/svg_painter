// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symbol_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class SymbolPainterWidget extends StatelessWidget {
  const SymbolPainterWidget({
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
      size: Size(width ?? 80.0, height ?? 20.0),
      painter: _$SymbolPainter(fit: fit),
    );
  }
}

class _$SymbolPainter extends CustomPainter {
  const _$SymbolPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(80.0, 20.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(80.0, 20.0),
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

    {
      final Path path = Path()
        ..moveTo(0.0, 10.0)
        ..lineTo(80.0, 10.0)
        ..moveTo(10.0, 0.0)
        ..lineTo(10.0, 20.0)
        ..moveTo(25.0, 0.0)
        ..lineTo(25.0, 20.0)
        ..moveTo(40.0, 0.0)
        ..lineTo(40.0, 20.0)
        ..moveTo(55.0, 0.0)
        ..lineTo(55.0, 20.0)
        ..moveTo(70.0, 0.0)
        ..lineTo(70.0, 20.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFC0CB);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    canvas.save();
    canvas.translate(5.0, 5.0);
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0));
    canvas.save();
    canvas.scale(5.0, 5.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(1.0, 1.0), 1.0, paint);
    }
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(20.0, 5.0);
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0));
    canvas.save();
    canvas.scale(5.0, 5.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(1.0, 1.0), 1.0, paint);
    }
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(35.0, 5.0);
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0));
    canvas.save();
    canvas.scale(5.0, 5.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(1.0, 1.0), 1.0, paint);
    }
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(50.0, 5.0);
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0));
    canvas.save();
    canvas.scale(5.0, 5.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(1.0, 1.0), 1.0, paint);
    }
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(65.0, 5.0);
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0));
    canvas.save();
    canvas.scale(5.0, 5.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(1.0, 1.0), 1.0, paint);
    }
    canvas.restore();
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
  bool shouldRepaint(covariant _$SymbolPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
