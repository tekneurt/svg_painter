// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ry_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class RyPainterWidget extends StatelessWidget {
  const RyPainterWidget({
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
      painter: _$RyPainter(fit: fit),
    );
  }
}

class _$RyPainter extends CustomPainter {
  const _$RyPainter({this.fit = BoxFit.contain});

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
    canvas.clipRect(Rect.fromLTWH(0, 0, 300.0, 200.0));

    {
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawOval(
          Rect.fromOval(
            Rect.fromCenter(
              center: const Offset(150.0, 50.0),
              width: 50.0,
              height: 50.0,
            ),
          ),
          paint,
        );
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawOval(
          Rect.fromOval(
            Rect.fromCenter(
              center: const Offset(250.0, 50.0),
              width: 50.0,
              height: 100.0,
            ),
          ),
          paint,
        );
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(20.0, 120.0, 60.0, 60.0),
            const Radius.elliptical(15.0, 0.0),
          ),
          paint,
        );
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(120.0, 120.0, 60.0, 60.0),
            const Radius.elliptical(15.0, 15.0),
          ),
          paint,
        );
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(220.0, 120.0, 60.0, 60.0),
            const Radius.elliptical(15.0, 30.0),
          ),
          paint,
        );
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$RyPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
