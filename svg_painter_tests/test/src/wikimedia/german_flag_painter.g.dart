// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'german_flag_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class GermanFlagPainterWidget extends StatelessWidget {
  const GermanFlagPainterWidget({
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.topColor,
    this.middleColor,
    this.bottomColor,
  });

  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final Object? topColor;
  final Object? middleColor;
  final Object? bottomColor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width ?? 1000.0, height ?? 600.0),
      painter: _$GermanFlagPainter(
        fit: fit,
        topColor: topColor,
        middleColor: middleColor,
        bottomColor: bottomColor,
      ),
    );
  }
}

class _$GermanFlagPainter extends CustomPainter {
  const _$GermanFlagPainter({
    this.fit = BoxFit.contain,
    this.topColor,
    this.middleColor,
    this.bottomColor,
  });

  final BoxFit fit;
  final Object? topColor;
  final Object? middleColor;
  final Object? bottomColor;

  Size get viewBox => const Size(1000.0, 600.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(1000.0, 600.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 1000.0, 600.0));

    canvas.save();
    canvas.scale(200.0, 200.0);
    {
      final Paint paint = Paint();
      final Object? localFill = topColor;
      if (localFill == null) {
        paint.color = Colors.black;
      } else {
        _applyOverride(paint, localFill);
      }
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 5.0, 3.0), paint);
    }
    {
      final Paint paint = Paint();
      final Object? localFill = middleColor;
      if (localFill == null) {
        paint.color = const Color(0xFFDD0000);
      } else {
        _applyOverride(paint, localFill);
      }
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 1.0, 5.0, 2.0), paint);
    }
    {
      final Paint paint = Paint();
      final Object? localFill = bottomColor;
      if (localFill == null) {
        paint.color = const Color(0xFFFFCE00);
      } else {
        _applyOverride(paint, localFill);
      }
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 2.0, 5.0, 1.0), paint);
    }
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
  bool shouldRepaint(covariant _$GermanFlagPainter oldDelegate) {
    if (fit == oldDelegate.fit &&
        topColor == oldDelegate.topColor &&
        middleColor == oldDelegate.middleColor &&
        bottomColor == oldDelegate.bottomColor) {
      return false;
    } else {
      return true;
    }
  }
}
