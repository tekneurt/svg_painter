// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_circle01_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class _$ExampleCircle01Painter extends CustomPainter {
  const _$ExampleCircle01Painter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(453.54330708661416, 151.1811023622047);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(453.54330708661416, 151.1811023622047),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 453.54330708661416, 151.1811023622047));

    {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 0.7559055118110235;
        canvas.drawRect(
          Rect.fromLTWH(
            0.3779527559055118,
            0.3779527559055118,
            452.78740157480314,
            150.4251968503937,
          ),
          paint,
        );
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(
          const Offset(226.77165354330708, 75.59055118110236),
          37.79527559055118,
          paint,
        );
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 3.7795275590551176;
        canvas.drawCircle(
          const Offset(226.77165354330708, 75.59055118110236),
          37.79527559055118,
          paint,
        );
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$ExampleCircle01Painter oldDelegate) {
    return fit != oldDelegate.fit;
  }
}
