// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_color_test.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class CurrentColorPainterWidget extends StatelessWidget {
  const CurrentColorPainterWidget({
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.color,
  });

  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width ?? 100.0, height ?? 100.0),
      painter: _$CurrentColorPainter(
        fit: fit,
        color: color ?? IconTheme.of(context).color,
      ),
    );
  }
}

class _$CurrentColorPainter extends CustomPainter {
  const _$CurrentColorPainter({this.fit = BoxFit.contain, this.color});

  final BoxFit fit;
  final Color? color;

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
        paint.color = color ?? const Color(0xFF000000);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(50.0, 50.0), 40.0, paint);
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$CurrentColorPainter oldDelegate) {
    if (fit == oldDelegate.fit && color == oldDelegate.color) {
      return false;
    } else {
      return true;
    }
  }
}
