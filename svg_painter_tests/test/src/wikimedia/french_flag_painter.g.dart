// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'french_flag_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class FrenchFlagPainterWidget extends StatelessWidget {
  const FrenchFlagPainterWidget({
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.defaultFill,
    this.leftColor,
    this.rightColor,
    this.middleColor,
  });

  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final Object? defaultFill;
  final Object? leftColor;
  final Object? rightColor;
  final Object? middleColor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width ?? 900.0, height ?? 600.0),
      painter: _$FrenchFlagPainter(
        fit: fit,
        defaultFill: defaultFill,
        leftColor: leftColor,
        rightColor: rightColor,
        middleColor: middleColor,
      ),
    );
  }
}

class _$FrenchFlagPainter extends CustomPainter {
  const _$FrenchFlagPainter({
    this.fit = BoxFit.contain,
    this.defaultFill,
    this.leftColor,
    this.rightColor,
    this.middleColor,
  });

  final BoxFit fit;
  final Object? defaultFill;
  final Object? leftColor;
  final Object? rightColor;
  final Object? middleColor;

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

    canvas.save();
    canvas.scale(300.0, 300.0);
    {
      final Paint paint = Paint();
      final Object? localFill = leftColor;
      if (localFill == null) {
        paint.color = const Color(0xFF0055A4);
      } else {
        _applyOverride(paint, localFill);
      }
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 3.0, 2.0), paint);
    }
    {
      final Paint paint = Paint();
      final Object? localFill = middleColor;
      if (localFill == null) {
        paint.color = Colors.white;
      } else {
        _applyOverride(paint, localFill);
      }
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(1.0, 0.0, 2.0, 2.0), paint);
    }
    {
      final Paint paint = Paint();
      final Object? localFill = rightColor;
      if (localFill == null) {
        paint.color = const Color(0xFFEF4135);
      } else {
        _applyOverride(paint, localFill);
      }
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(2.0, 0.0, 1.0, 2.0), paint);
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
  bool shouldRepaint(covariant _$FrenchFlagPainter oldDelegate) {
    if (fit == oldDelegate.fit &&
        defaultFill == oldDelegate.defaultFill &&
        leftColor == oldDelegate.leftColor &&
        rightColor == oldDelegate.rightColor &&
        middleColor == oldDelegate.middleColor) {
      return false;
    } else {
      return true;
    }
  }
}
