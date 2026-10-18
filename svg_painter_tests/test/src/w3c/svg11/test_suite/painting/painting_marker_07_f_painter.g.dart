// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'painting_marker_07_f_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class PaintingMarker07FPainterWidget extends StatelessWidget {
  const PaintingMarker07FPainterWidget({
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
      label: '\$RCSfile: painting-marker-07-f.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$PaintingMarker07FPainter(fit: fit),
      ),
    );
  }
}

class _$PaintingMarker07FPainter extends CustomPainter {
  const _$PaintingMarker07FPainter({this.fit = BoxFit.contain});

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

    void _marker_testMarker(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 100.0, 100.0));
      canvas.restore();
    }

    void _marker_testMarker2(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 100.0, 100.0));
      canvas.restore();
    }

    {
      final Path path = Path()
        ..moveTo(0.0, 0.0)
        ..lineTo(25.0, 25.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      _marker_testMarker(
        canvas,
        const Offset(25.0, 25.0),
        0.7853981633974483,
        1.0,
      );
    }
    {
      final Path path = Path()
        ..moveTo(100.0, 0.0)
        ..lineTo(125.0, 25.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      _marker_testMarker2(
        canvas,
        const Offset(125.0, 25.0),
        0.7853981633974483,
        1.0,
      );
    }
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
            children: <InlineSpan>[TextSpan(text: '\$Revision: 1.1 \$')],
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
  bool shouldRepaint(covariant _$PaintingMarker07FPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
