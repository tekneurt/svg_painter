// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'masking_path_02_b_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, unused_local_variable, deprecated_member_use_from_same_package

class MaskingPath02BPainterWidget extends StatelessWidget {
  const MaskingPath02BPainterWidget({
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
      label: '\$RCSfile: masking-path-02-b.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$MaskingPath02BPainter(fit: fit),
      ),
    );
  }
}

class _$MaskingPath02BPainter extends CustomPainter {
  const _$MaskingPath02BPainter({this.fit = BoxFit.contain});

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

    void _clipPath_clip1(Canvas canvas, Size size, Rect targetBounds) {
      final Path path = Path();
      path.addRect(Rect.fromLTWH(0.25, 0.5, 0.6, 1.0));
      {
        final Matrix4 matrix = Matrix4.identity()
          ..translateByDouble(targetBounds.left, targetBounds.top, 0.0, 1.0)
          ..scaleByDouble(targetBounds.width, targetBounds.height, 1.0, 1.0);
        canvas.clipPath(path.transform(matrix.storage));
      }
    }

    void _clipPath_clip2(Canvas canvas, Size size, Rect targetBounds) {
      final Path path = Path();
      path.addRect(Rect.fromLTWH(60.0, 60.0, 80.0, 80.0));
      canvas.clipPath(path);
    }

    canvas.save();
    _clipPath_clip1(canvas, size, Rect.fromLTWH(10.0, 10.0, 430.0, 80.0));
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0088);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(10.0, 10.0, 430.0, 80.0), paint);
    }
    canvas.restore();
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 4.0;
      canvas.drawRect(Rect.fromLTWH(117.0, 50.0, 258.0, 40.0), paint);
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
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[
              TextSpan(text: 'clipPathUnits=objectBoundingBox'),
            ],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            20.0,
            130.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.translate(100.0, 200.0);
    canvas.rotate(-0.7853981633974483);
    _clipPath_clip2(canvas, size, Rect.fromLTWH(0.0, 0.0, 120.0, 120.0));
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 120.0, 120.0), paint);
    }
    canvas.restore();
    canvas.save();
    canvas.translate(100.0, 200.0);
    canvas.rotate(-0.7853981633974483);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 4.0;
      canvas.drawRect(Rect.fromLTWH(60.0, 60.0, 60.0, 60.0), paint);
    }
    canvas.restore();
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[
              TextSpan(text: 'clipPathUnits=userSpaceOnUse'),
            ],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            20.0,
            280.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
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
  bool shouldRepaint(covariant _$MaskingPath02BPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
