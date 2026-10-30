// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flood_color_attribute_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class FloodColorAttributePainterWidget extends StatelessWidget {
  const FloodColorAttributePainterWidget({
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
      size: Size(width ?? 420.0, height ?? 200.0),
      painter: _$FloodColorAttributePainter(fit: fit),
    );
  }
}

class _$FloodColorAttributePainter extends CustomPainter {
  const _$FloodColorAttributePainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(420.0, 200.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(420.0, 200.0),
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

    void _filter_flood1(Canvas canvas, void Function() drawGraphic) {
      canvas.saveLayer(
        null,
        Paint()
          ..colorFilter = const ColorFilter.mode(
            Color(0xFF87CEEB),
            BlendMode.srcIn,
          ),
      );
      drawGraphic();
      canvas.restore();
    }

    void _filter_flood2(Canvas canvas, void Function() drawGraphic) {
      canvas.saveLayer(
        null,
        Paint()
          ..colorFilter = const ColorFilter.mode(
            Color(0xFF2E8B57),
            BlendMode.srcIn,
          ),
      );
      drawGraphic();
      canvas.restore();
    }

    _filter_flood1(canvas, () {
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 200.0, 200.0), paint);
      }
    });
    _filter_flood2(canvas, () {
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(220.0, 0.0, 200.0, 200.0), paint);
      }
    });
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
  bool shouldRepaint(covariant _$FloodColorAttributePainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
