// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pservers_grad_03_b_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, unused_local_variable, deprecated_member_use_from_same_package

class PserversGrad03BPainterWidget extends StatelessWidget {
  const PserversGrad03BPainterWidget({
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
      label: '\$RCSfile: pservers-grad-03-b.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$PserversGrad03BPainter(fit: fit),
      ),
    );
  }
}

class _$PserversGrad03BPainter extends CustomPainter {
  const _$PserversGrad03BPainter({this.fit = BoxFit.contain});

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

    ImageShader? _createPattern_Pat3a(Rect targetBounds) {
      final double tileWidth = 20.0;
      final double tileHeight = 20.0;
      final double originX = 0.0;
      final double originY = 0.0;
      if (tileWidth <= 0.0 || tileHeight <= 0.0) {
        return null;
      }
      final int imgWidth = tileWidth.round().clamp(1, 2048);
      final int imgHeight = tileHeight.round().clamp(1, 2048);
      final ui.PictureRecorder recorder = ui.PictureRecorder();
      final Canvas canvas = Canvas(
        recorder,
        Rect.fromLTWH(0.0, 0.0, tileWidth, tileHeight),
      );
      canvas.scale(imgWidth / tileWidth, imgHeight / tileHeight);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF9933DD);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0), paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF008000);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(10.0, 0.0, 10.0, 10.0), paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 10.0, 10.0, 10.0), paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFFF00);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(10.0, 10.0, 10.0, 10.0), paint);
      }
      final ui.Picture picture = recorder.endRecording();
      final image = picture.toImageSync(imgWidth, imgHeight);
      final Matrix4 matrix = Matrix4.identity()
        ..translateByDouble(originX, originY, 0.0, 1.0)
        ..scaleByDouble(tileWidth / imgWidth, tileHeight / imgHeight, 1.0, 1.0);
      return ImageShader(
        image,
        TileMode.repeated,
        TileMode.repeated,
        matrix.storage,
      );
    }

    ImageShader? _createPattern_Pat3b(Rect targetBounds) {
      final double tileWidth = 20.0;
      final double tileHeight = 20.0;
      final double originX = 0.0;
      final double originY = 0.0;
      if (tileWidth <= 0.0 || tileHeight <= 0.0) {
        return null;
      }
      final int imgWidth = tileWidth.round().clamp(1, 2048);
      final int imgHeight = tileHeight.round().clamp(1, 2048);
      final ui.PictureRecorder recorder = ui.PictureRecorder();
      final Canvas canvas = Canvas(
        recorder,
        Rect.fromLTWH(0.0, 0.0, tileWidth, tileHeight),
      );
      canvas.scale(imgWidth / tileWidth, imgHeight / tileHeight);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF9933DD);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0), paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF008000);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(10.0, 0.0, 10.0, 10.0), paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 10.0, 10.0, 10.0), paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFFF00);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(10.0, 10.0, 10.0, 10.0), paint);
      }
      final ui.Picture picture = recorder.endRecording();
      final image = picture.toImageSync(imgWidth, imgHeight);
      final Matrix4 matrix = Matrix4.identity()
        ..translateByDouble(originX, originY, 0.0, 1.0)
        ..scaleByDouble(tileWidth / imgWidth, tileHeight / imgHeight, 1.0, 1.0);
      return ImageShader(
        image,
        TileMode.repeated,
        TileMode.repeated,
        matrix.storage,
      );
    }

    {
      final Paint paint = Paint();
      paint.shader = _createPattern_Pat3a(
        Rect.fromLTWH(20.0, 20.0, 440.0, 80.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(20.0, 20.0, 440.0, 80.0), paint);
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
            children: <InlineSpan>[TextSpan(text: 'Pattern fill.')],
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
    {
      final Paint paint = Paint();
      paint.shader = _createPattern_Pat3b(
        Rect.fromLTWH(20.0, 160.0, 440.0, 80.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(20.0, 160.0, 440.0, 80.0), paint);
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
              TextSpan(text: 'Referencing pattern fill below.'),
            ],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            20.0,
            270.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
  bool shouldRepaint(covariant _$PserversGrad03BPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
