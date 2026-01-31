// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'y2_line_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class Y2LinePainterWidget extends StatelessWidget {
  const Y2LinePainterWidget({
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
      size: Size(width ?? 10.0, height ?? 10.0),
      painter: _$Y2LinePainter(fit: fit),
    );
  }
}

class _$Y2LinePainter extends CustomPainter {
  const _$Y2LinePainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(10.0, 10.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(10.0, 10.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 10.0, 10.0));

    {
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawLine(const Offset(1.0, 5.0), const Offset(9.0, 1.0), paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawLine(const Offset(1.0, 5.0), const Offset(9.0, 1.0), paint);
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawLine(const Offset(1.0, 5.0), const Offset(9.0, 5.0), paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF008000);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawLine(const Offset(1.0, 5.0), const Offset(9.0, 5.0), paint);
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawLine(const Offset(1.0, 5.0), const Offset(9.0, 9.0), paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawLine(const Offset(1.0, 5.0), const Offset(9.0, 9.0), paint);
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$Y2LinePainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
