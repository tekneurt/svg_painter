// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class GPainterWidget extends StatelessWidget {
  const GPainterWidget({
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
      size: Size(width ?? 100.0, height ?? 100.0),
      painter: _$GPainter(fit: fit),
    );
  }
}

class _$GPainter extends CustomPainter {
  const _$GPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(100.0, 100.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(100.0, 100.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 100.0, 100.0));

    {
      {
        {
          final Paint paint = Paint();
          paint.color = Colors.white;
          paint.style = PaintingStyle.fill;
          canvas.drawCircle(const Offset(40.0, 40.0), 25.0, paint);
        }
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFF008000);
          paint.style = PaintingStyle.stroke;
          paint.strokeWidth = 5.0;
          canvas.drawCircle(const Offset(40.0, 40.0), 25.0, paint);
        }
      }
      {
        {
          final Paint paint = Paint();
          paint.color = Colors.white;
          paint.style = PaintingStyle.fill;
          canvas.drawCircle(const Offset(60.0, 60.0), 25.0, paint);
        }
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFF008000);
          paint.style = PaintingStyle.stroke;
          paint.strokeWidth = 5.0;
          canvas.drawCircle(const Offset(60.0, 60.0), 25.0, paint);
        }
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$GPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
