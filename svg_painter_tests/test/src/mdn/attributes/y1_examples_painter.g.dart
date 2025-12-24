// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'y1_examples_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class _$Y1ExamplesPainter extends CustomPainter {
  const _$Y1ExamplesPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(fit, const Size(25.0, 25.0), size);
    final Size sourceSize = fittedSizes.source;
    final Rect destRect = Alignment.center.inscribe(fittedSizes.destination, Offset.zero & size);

    canvas.save();
    canvas.translate(destRect.left, destRect.top);
    canvas.scale(destRect.width / sourceSize.width, destRect.height / sourceSize.height);
    canvas.clipRect(Rect.fromLTWH(0, 0, 25.0, 25.0));

    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(Offset(2.0, 0.0), Offset(22.0, 20.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF008000);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(Offset(2.0, 10.0), Offset(22.0, 20.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(Offset(2.0, 20.0), Offset(22.0, 20.0), paint);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$Y1ExamplesPainter oldDelegate) {
    return fit != oldDelegate.fit;
  }
}
