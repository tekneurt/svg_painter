// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class _$_CirclePainter extends CustomPainter {
  const _$_CirclePainter({this.fit = BoxFit.contain});

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
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(50.0, 50.0), 40.0, paint);
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$_CirclePainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
