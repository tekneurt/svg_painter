// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'french_flag_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class _$FrenchFlagPainter extends CustomPainter {
  const _$FrenchFlagPainter({
    this.fit = BoxFit.contain,
    this.leftColor,
    this.rightColor,
    this.middleColor,
  });

  final BoxFit fit;
  final Color? leftColor;
  final Color? rightColor;
  final Color? middleColor;

  Size get viewBox => const Size(900.0, 600.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(900.0, 600.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 900.0, 600.0));

    {
      {
        final Paint paint = Paint();
        final Color? localFill = leftColor;
        if (localFill == null) {
          paint.color = const Color(0xFF0055A4);
        } else {
          paint.color = localFill;
        }
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 900.0, 600.0), paint);
      }
    }
    {
      {
        final Paint paint = Paint();
        final Color? localFill = middleColor;
        if (localFill == null) {
          paint.color = Colors.white;
        } else {
          paint.color = localFill;
        }
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(300.0, 0.0, 600.0, 600.0), paint);
      }
    }
    {
      {
        final Paint paint = Paint();
        final Color? localFill = rightColor;
        if (localFill == null) {
          paint.color = const Color(0xFFEF4135);
        } else {
          paint.color = localFill;
        }
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(600.0, 0.0, 300.0, 600.0), paint);
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$FrenchFlagPainter oldDelegate) {
    if (fit == oldDelegate.fit &&
        leftColor == oldDelegate.leftColor &&
        rightColor == oldDelegate.rightColor &&
        middleColor == oldDelegate.middleColor) {
      return false;
    } else {
      return true;
    }
  }
}
