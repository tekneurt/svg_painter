// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'painting_control_05_f_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class PaintingControl05FPainterWidget extends StatelessWidget {
  const PaintingControl05FPainterWidget({
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
      label: '\$RCSfile: painting-control-05-f.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$PaintingControl05FPainter(fit: fit),
      ),
    );
  }
}

class _$PaintingControl05FPainter extends CustomPainter {
  const _$PaintingControl05FPainter({this.fit = BoxFit.contain});

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

    void _mask_testMask1(Canvas canvas, Size size, Rect targetBounds) {
      canvas.clipRect(
        Rect.fromLTWH(
          targetBounds.left + (-0.1 * targetBounds.width),
          targetBounds.top + (-0.1 * targetBounds.height),
          (1.2 * targetBounds.width),
          (1.2 * targetBounds.height),
        ),
      );
    }

    void _mask_testMask2(Canvas canvas, Size size, Rect targetBounds) {
      canvas.clipRect(
        Rect.fromLTWH(
          targetBounds.left + (-0.1 * targetBounds.width),
          targetBounds.top + (-0.1 * targetBounds.height),
          (1.2 * targetBounds.width),
          (1.2 * targetBounds.height),
        ),
      );
    }

    void _mask_testMask3(Canvas canvas, Size size, Rect targetBounds) {
      canvas.clipRect(
        Rect.fromLTWH(
          targetBounds.left + (-0.1 * targetBounds.width),
          targetBounds.top + (-0.1 * targetBounds.height),
          (1.2 * targetBounds.width),
          (1.2 * targetBounds.height),
        ),
      );
    }

    void _mask_testMask4(Canvas canvas, Size size, Rect targetBounds) {
      canvas.clipRect(
        Rect.fromLTWH(
          targetBounds.left + (-0.1 * targetBounds.width),
          targetBounds.top + (-0.1 * targetBounds.height),
          (1.2 * targetBounds.width),
          (1.2 * targetBounds.height),
        ),
      );
    }

    void _clipPath_testClip1(Canvas canvas, Size size, Rect targetBounds) {
      final Path path = Path();
      canvas.clipPath(path);
    }

    void _clipPath_testClip2(Canvas canvas, Size size, Rect targetBounds) {
      final Path path = Path();
      canvas.clipPath(path);
    }

    void _clipPath_testClip3(Canvas canvas, Size size, Rect targetBounds) {
      final Path path = Path();
      canvas.clipPath(path);
    }

    void _clipPath_testClip4(Canvas canvas, Size size, Rect targetBounds) {
      final Path path = Path();
      canvas.clipPath(path);
    }

    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(50.0, 50.0, 100.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(50.0, 50.0, 100.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(150.0, 50.0, 100.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(150.0, 50.0, 100.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(250.0, 50.0, 100.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(250.0, 50.0, 100.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(350.0, 50.0, 100.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(350.0, 50.0, 100.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(50.0, 200.0, 100.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(50.0, 200.0, 100.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(150.0, 200.0, 100.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(150.0, 200.0, 100.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(250.0, 200.0, 100.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(250.0, 200.0, 100.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(350.0, 200.0, 100.0, 100.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(350.0, 200.0, 100.0, 100.0), paint);
    }
    canvas.saveLayer(null, Paint());
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(50.0, 50.0, 100.0, 100.0), paint);
    }
    canvas.saveLayer(
      null,
      Paint()
        ..blendMode = BlendMode.dstIn
        ..colorFilter = const ColorFilter.matrix(<double>[
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0.2126,
          0.7152,
          0.0722,
          0,
          0,
        ]),
    );
    _mask_testMask1(canvas, size, Rect.fromLTWH(50.0, 50.0, 100.0, 100.0));
    canvas.restore();
    canvas.restore();
    canvas.saveLayer(null, Paint());
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(150.0, 50.0, 100.0, 100.0), paint);
    }
    canvas.saveLayer(
      null,
      Paint()
        ..blendMode = BlendMode.dstIn
        ..colorFilter = const ColorFilter.matrix(<double>[
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0.2126,
          0.7152,
          0.0722,
          0,
          0,
        ]),
    );
    _mask_testMask2(canvas, size, Rect.fromLTWH(150.0, 50.0, 100.0, 100.0));
    canvas.restore();
    canvas.restore();
    canvas.saveLayer(null, Paint());
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(250.0, 50.0, 100.0, 100.0), paint);
    }
    canvas.saveLayer(
      null,
      Paint()
        ..blendMode = BlendMode.dstIn
        ..colorFilter = const ColorFilter.matrix(<double>[
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0.2126,
          0.7152,
          0.0722,
          0,
          0,
        ]),
    );
    _mask_testMask3(canvas, size, Rect.fromLTWH(250.0, 50.0, 100.0, 100.0));
    canvas.restore();
    canvas.restore();
    canvas.saveLayer(null, Paint());
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(350.0, 50.0, 100.0, 100.0), paint);
    }
    canvas.saveLayer(
      null,
      Paint()
        ..blendMode = BlendMode.dstIn
        ..colorFilter = const ColorFilter.matrix(<double>[
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0.2126,
          0.7152,
          0.0722,
          0,
          0,
        ]),
    );
    _mask_testMask4(canvas, size, Rect.fromLTWH(350.0, 50.0, 100.0, 100.0));
    canvas.restore();
    canvas.restore();
    canvas.save();
    _clipPath_testClip1(canvas, size, Rect.fromLTWH(50.0, 200.0, 100.0, 100.0));
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(50.0, 200.0, 100.0, 100.0), paint);
    }
    canvas.restore();
    canvas.save();
    _clipPath_testClip2(
      canvas,
      size,
      Rect.fromLTWH(150.0, 200.0, 100.0, 100.0),
    );
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(150.0, 200.0, 100.0, 100.0), paint);
    }
    canvas.restore();
    canvas.save();
    _clipPath_testClip3(
      canvas,
      size,
      Rect.fromLTWH(250.0, 200.0, 100.0, 100.0),
    );
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(250.0, 200.0, 100.0, 100.0), paint);
    }
    canvas.restore();
    canvas.save();
    _clipPath_testClip4(
      canvas,
      size,
      Rect.fromLTWH(350.0, 200.0, 100.0, 100.0),
    );
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF0000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(350.0, 200.0, 100.0, 100.0), paint);
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
  bool shouldRepaint(covariant _$PaintingControl05FPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
