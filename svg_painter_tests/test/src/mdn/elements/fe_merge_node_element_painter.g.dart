// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fe_merge_node_element_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class FeMergeNodeElementPainterWidget extends StatelessWidget {
  const FeMergeNodeElementPainterWidget({
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
      size: Size(width ?? 200.0, height ?? 200.0),
      painter: _$FeMergeNodeElementPainter(fit: fit),
    );
  }
}

class _$FeMergeNodeElementPainter extends CustomPainter {
  const _$FeMergeNodeElementPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(200.0, 200.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(200.0, 200.0),
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

    void _filter_feOffset(Canvas canvas, void Function() drawGraphic) {
      canvas.saveLayer(
        null,
        Paint()..imageFilter = ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      );
      drawGraphic();
      canvas.restore();
      drawGraphic();
    }

    _filter_feOffset(canvas, () {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF008000);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(40.0, 40.0, 100.0, 100.0), paint);
      }
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawRect(Rect.fromLTWH(40.0, 40.0, 100.0, 100.0), paint);
      }
    });
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF008000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(40.0, 40.0, 100.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(40.0, 40.0, 100.0, 100.0), paint);
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
  bool shouldRepaint(covariant _$FeMergeNodeElementPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
