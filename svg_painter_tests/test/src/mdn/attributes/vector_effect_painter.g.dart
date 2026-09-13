// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vector_effect_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class VectorEffectPainterWidget extends StatelessWidget {
  const VectorEffectPainterWidget({
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
      size: Size(width ?? 500.0, height ?? 240.0),
      painter: _$VectorEffectPainter(fit: fit),
    );
  }
}

class _$VectorEffectPainter extends CustomPainter {
  const _$VectorEffectPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(500.0, 240.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(500.0, 240.0),
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
        ..moveTo(10.0, 20.0)
        ..lineTo(40.0, 100.0)
        ..lineTo(39.0, 200.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 2.0;
        canvas.drawPath(path, paint);
      }
    }
    canvas.save();
    canvas.translate(100.0, 0.0);
    canvas.scale(4.0, 1.0);
    {
      final Path path = Path()
        ..moveTo(10.0, 20.0)
        ..lineTo(40.0, 100.0)
        ..lineTo(39.0, 200.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 2.0;
        canvas.drawPath(path, paint);
      }
    }
    canvas.restore();
    canvas.save();
    canvas.translate(300.0, 0.0);
    canvas.scale(4.0, 1.0);
    {
      final Path path = Path()
        ..moveTo(10.0, 20.0)
        ..lineTo(40.0, 100.0)
        ..lineTo(39.0, 200.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 2.0;
        final Matrix4 ctm = Matrix4.fromFloat64List(canvas.getTransform());
        final Path nonScalingPath = path.transform(ctm.storage);
        canvas.save();
        canvas.transform(Matrix4.inverted(ctm).storage);
        canvas.drawPath(nonScalingPath, paint);
        canvas.restore();
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
  bool shouldRepaint(covariant _$VectorEffectPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
