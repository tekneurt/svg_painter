// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shapes_rect_03_t_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class ShapesRect03TPainterWidget extends StatelessWidget {
  const ShapesRect03TPainterWidget({
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
      label: '\$RCSfile: shapes-rect-03-t.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$ShapesRect03TPainter(fit: fit),
      ),
    );
  }
}

class _$ShapesRect03TPainter extends CustomPainter {
  const _$ShapesRect03TPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(480.0, 360.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(480.0, 360.0),
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
    canvas.translate(0.0, 30.0);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(100.0, 0.0, 20.0, 100.0),
          const Radius.elliptical(10.0, 20.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(130.0, 0.0, 20.0, 100.0),
          const Radius.elliptical(10.0, 20.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(160.0, 0.0, 20.0, 100.0),
          const Radius.elliptical(10.0, 20.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(190.0, 0.0, 20.0, 100.0),
          const Radius.elliptical(10.0, 50.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(220.0, 0.0, 20.0, 100.0),
          const Radius.elliptical(10.0, 20.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(250.0, 0.0, 20.0, 100.0),
          const Radius.elliptical(10.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(280.0, 0.0, 20.0, 100.0),
          const Radius.elliptical(5.0, 5.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(310.0, 0.0, 20.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(340.0, 0.0, 20.0, 100.0), paint);
    }
    canvas.save();
    canvas.translate(45.0, 0.0);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(10.0, 120.0, 100.0, 20.0),
          const Radius.elliptical(50.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(10.0, 150.0, 100.0, 20.0),
          const Radius.elliptical(15.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(10.0, 180.0, 100.0, 20.0),
          const Radius.elliptical(10.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(130.0, 120.0, 100.0, 20.0),
          const Radius.elliptical(50.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(130.0, 150.0, 100.0, 20.0),
          const Radius.elliptical(20.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(130.0, 180.0, 100.0, 20.0),
          const Radius.elliptical(10.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(250.0, 120.0, 100.0, 20.0),
          const Radius.elliptical(5.0, 5.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(250.0, 150.0, 100.0, 20.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(250.0, 180.0, 100.0, 20.0), paint);
    }
    canvas.restore();
    canvas.save();
    canvas.translate(100.0, 100.0);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(10.0, 120.0, 50.0, 20.0),
          const Radius.elliptical(25.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(80.0, 120.0, 20.0, 50.0),
          const Radius.elliptical(10.0, 25.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(120.0, 120.0, 50.0, 20.0),
          const Radius.elliptical(25.0, 10.0),
        ),
        paint,
      );
    }
    canvas.save();
    canvas.translate(-10.0, -15.0);
    canvas.scale(2.0, 2.0);
    canvas.translate(10.0, 15.0);
    canvas.translate(85.0, 52.5);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0.0, 0.0, 20.0, 30.0),
          const Radius.elliptical(10.0, 15.0),
        ),
        paint,
      );
    }
    canvas.restore();
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(230.0, 120.0, 20.0, 30.0),
          const Radius.elliptical(10.0, 15.0),
        ),
        paint,
      );
    }
    canvas.restore();
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(100.0, 0.0, 20.0, 100.0),
          const Radius.elliptical(10.0, 20.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(130.0, 0.0, 20.0, 100.0),
          const Radius.elliptical(10.0, 20.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(160.0, 0.0, 20.0, 100.0),
          const Radius.elliptical(10.0, 20.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(190.0, 0.0, 20.0, 100.0),
          const Radius.elliptical(10.0, 50.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(220.0, 0.0, 20.0, 100.0),
          const Radius.elliptical(10.0, 20.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(250.0, 0.0, 20.0, 100.0),
          const Radius.elliptical(10.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(280.0, 0.0, 20.0, 100.0),
          const Radius.elliptical(5.0, 5.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(310.0, 0.0, 20.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(340.0, 0.0, 20.0, 100.0), paint);
    }
    canvas.save();
    canvas.translate(45.0, 0.0);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(10.0, 120.0, 100.0, 20.0),
          const Radius.elliptical(50.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(10.0, 150.0, 100.0, 20.0),
          const Radius.elliptical(15.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(10.0, 180.0, 100.0, 20.0),
          const Radius.elliptical(10.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(130.0, 120.0, 100.0, 20.0),
          const Radius.elliptical(50.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(130.0, 150.0, 100.0, 20.0),
          const Radius.elliptical(20.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(130.0, 180.0, 100.0, 20.0),
          const Radius.elliptical(10.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(250.0, 120.0, 100.0, 20.0),
          const Radius.elliptical(5.0, 5.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(250.0, 150.0, 100.0, 20.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(250.0, 180.0, 100.0, 20.0), paint);
    }
    canvas.restore();
    canvas.save();
    canvas.translate(100.0, 100.0);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(10.0, 120.0, 50.0, 20.0),
          const Radius.elliptical(25.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(80.0, 120.0, 20.0, 50.0),
          const Radius.elliptical(10.0, 25.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(120.0, 120.0, 50.0, 20.0),
          const Radius.elliptical(25.0, 10.0),
        ),
        paint,
      );
    }
    canvas.save();
    canvas.translate(-10.0, -15.0);
    canvas.scale(2.0, 2.0);
    canvas.translate(10.0, 15.0);
    canvas.translate(85.0, 52.5);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0.0, 0.0, 20.0, 30.0),
          const Radius.elliptical(10.0, 15.0),
        ),
        paint,
      );
    }
    canvas.restore();
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(230.0, 120.0, 20.0, 30.0),
          const Radius.elliptical(10.0, 15.0),
        ),
        paint,
      );
    }
    canvas.restore();
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(100.0, 0.0, 20.0, 100.0),
          const Radius.elliptical(10.0, 20.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(130.0, 0.0, 20.0, 100.0),
          const Radius.elliptical(10.0, 20.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(160.0, 0.0, 20.0, 100.0),
          const Radius.elliptical(10.0, 20.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(190.0, 0.0, 20.0, 100.0),
          const Radius.elliptical(10.0, 50.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(220.0, 0.0, 20.0, 100.0),
          const Radius.elliptical(10.0, 20.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(250.0, 0.0, 20.0, 100.0),
          const Radius.elliptical(10.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(280.0, 0.0, 20.0, 100.0),
          const Radius.elliptical(5.0, 5.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(310.0, 0.0, 20.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(340.0, 0.0, 20.0, 100.0), paint);
    }
    canvas.save();
    canvas.translate(45.0, 0.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(10.0, 120.0, 100.0, 20.0),
          const Radius.elliptical(50.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(10.0, 150.0, 100.0, 20.0),
          const Radius.elliptical(15.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(10.0, 180.0, 100.0, 20.0),
          const Radius.elliptical(10.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(130.0, 120.0, 100.0, 20.0),
          const Radius.elliptical(50.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(130.0, 150.0, 100.0, 20.0),
          const Radius.elliptical(20.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(130.0, 180.0, 100.0, 20.0),
          const Radius.elliptical(10.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(250.0, 120.0, 100.0, 20.0),
          const Radius.elliptical(5.0, 5.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(250.0, 150.0, 100.0, 20.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(250.0, 180.0, 100.0, 20.0), paint);
    }
    canvas.restore();
    canvas.save();
    canvas.translate(100.0, 100.0);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(10.0, 120.0, 50.0, 20.0),
          const Radius.elliptical(25.0, 10.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(80.0, 120.0, 20.0, 50.0),
          const Radius.elliptical(10.0, 25.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(120.0, 120.0, 50.0, 20.0),
          const Radius.elliptical(25.0, 10.0),
        ),
        paint,
      );
    }
    canvas.save();
    canvas.translate(-10.0, -15.0);
    canvas.scale(2.0, 2.0);
    canvas.translate(10.0, 15.0);
    canvas.translate(85.0, 52.5);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 0.5;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0.0, 0.0, 20.0, 30.0),
          const Radius.elliptical(10.0, 15.0),
        ),
        paint,
      );
    }
    canvas.restore();
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(230.0, 120.0, 20.0, 30.0),
          const Radius.elliptical(10.0, 15.0),
        ),
        paint,
      );
    }
    canvas.restore();
    canvas.restore();
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 32.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: '\$Revision: 1.9 \$')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            10.0,
            340.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(1.0, 1.0, 478.0, 358.0), paint);
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
  bool shouldRepaint(covariant _$ShapesRect03TPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
