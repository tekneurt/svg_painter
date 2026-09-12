// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fill_rule_evenodd_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class FillRuleEvenoddPainterWidget extends StatelessWidget {
  const FillRuleEvenoddPainterWidget({
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
      size: Size(width ?? 320.0, height ?? 120.0),
      painter: _$FillRuleEvenoddPainter(fit: fit),
    );
  }
}

class _$FillRuleEvenoddPainter extends CustomPainter {
  const _$FillRuleEvenoddPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(320.0, 120.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(320.0, 120.0),
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
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 320.0, 120.0));
    canvas.save();
    canvas.translate(10.0, 10.0);
    {
      final Path path = Path()
        ..moveTo(50.0, 0.0)
        ..lineTo(21.0, 90.0)
        ..lineTo(98.0, 35.0)
        ..lineTo(2.0, 35.0)
        ..lineTo(79.0, 90.0)
        ..close();
      path.fillType = PathFillType.evenOdd;
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(110.0, 0.0)
        ..lineTo(200.0, 0.0)
        ..lineTo(200.0, 90.0)
        ..lineTo(110.0, 90.0)
        ..close()
        ..moveTo(130.0, 20.0)
        ..lineTo(180.0, 20.0)
        ..lineTo(180.0, 70.0)
        ..lineTo(130.0, 70.0)
        ..close();
      path.fillType = PathFillType.evenOdd;
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(210.0, 0.0)
        ..lineTo(300.0, 0.0)
        ..lineTo(300.0, 90.0)
        ..lineTo(210.0, 90.0)
        ..close()
        ..moveTo(230.0, 20.0)
        ..lineTo(230.0, 70.0)
        ..lineTo(280.0, 70.0)
        ..lineTo(280.0, 20.0)
        ..close();
      path.fillType = PathFillType.evenOdd;
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
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
  bool shouldRepaint(covariant _$FillRuleEvenoddPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
