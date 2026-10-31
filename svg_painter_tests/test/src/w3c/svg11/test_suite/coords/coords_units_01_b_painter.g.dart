// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coords_units_01_b_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class CoordsUnits01BPainterWidget extends StatelessWidget {
  const CoordsUnits01BPainterWidget({
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
      label: '\$RCSfile: coords-units-01-b.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$CoordsUnits01BPainter(fit: fit),
      ),
    );
  }
}

class _$CoordsUnits01BPainter extends CustomPainter {
  const _$CoordsUnits01BPainter({this.fit = BoxFit.contain});

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
    final Rect viewBoxRect = Rect.fromLTWH(0, 0, 480.0, 360.0);

    canvas.save();
    canvas.translate(destRect.left, destRect.top);
    canvas.scale(
      destRect.width / sourceSize.width,
      destRect.height / sourceSize.height,
    );

    final Gradient _grad_linearBoundingBoxPercentage = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: <Color>[const Color(0xFFFF00FF), const Color(0xFF0000FF)],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp,
    );
    final Gradient _grad_linearBoundingBoxFraction = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, -1.0),
      colors: <Color>[const Color(0xFFFF00FF), const Color(0xFF0000FF)],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp,
    );
    final Gradient _grad_linearUserSpace = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(-0.7916666666666666, -1.0),
      colors: <Color>[const Color(0xFFFF00FF), const Color(0xFF0000FF)],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp,
    );
    final Gradient _grad_radialBoundingBoxPercentage = RadialGradient(
      center: Alignment(-0.5, -0.5),
      radius: 0.25,
      focal: Alignment(-0.5, -0.5),
      focalRadius: 0.0,
      colors: <Color>[const Color(0xFFFF00FF), const Color(0xFF0000FF)],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp,
    );
    final Gradient _grad_radialBoundingBoxFraction = RadialGradient(
      center: Alignment(-0.5, -0.5),
      radius: 0.25,
      focal: Alignment(-0.5, -0.5),
      focalRadius: 0.0,
      colors: <Color>[const Color(0xFFFF00FF), const Color(0xFF0000FF)],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp,
    );
    final Gradient _grad_radialUserSpace = RadialGradient(
      center: Alignment(-0.9375, -0.9166666666666666),
      radius: 0.041666666666666664,
      focal: Alignment(-0.9375, -0.9166666666666666),
      focalRadius: 0.0,
      colors: <Color>[const Color(0xFFFF00FF), const Color(0xFF0000FF)],
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp,
    );
    ImageShader? _createPattern_patternBoundingBoxPercentage(
      Rect targetBounds,
    ) {
      final double tileWidth = targetBounds.width * 0.5;
      final double tileHeight = targetBounds.height * 0.5;
      final double originX = targetBounds.left + targetBounds.width * 0.25;
      final double originY = targetBounds.top + targetBounds.height * 0.25;
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
      canvas.scale(targetBounds.width, targetBounds.height);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF00FF);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(0.5, 0.5), 0.25, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.4, 0.4, 0.2, 0.2), paint);
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

    ImageShader? _createPattern_patternBoundingBoxFraction(Rect targetBounds) {
      final double tileWidth = targetBounds.width * 0.5;
      final double tileHeight = targetBounds.height * 0.5;
      final double originX = targetBounds.left + targetBounds.width * 0.25;
      final double originY = targetBounds.top + targetBounds.height * 0.25;
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
      canvas.scale(targetBounds.width, targetBounds.height);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF00FF);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(0.5, 0.5), 0.25, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.4, 0.4, 0.2, 0.2), paint);
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

    ImageShader? _createPattern_patternUserSpace(Rect targetBounds) {
      final double tileWidth = 25.0;
      final double tileHeight = 15.0;
      final double originX = 12.5;
      final double originY = 7.5;
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
        paint.color = const Color(0xFFFF00FF);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(25.0, 15.0), 10.0, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(20.0, 12.0, 10.0, 6.0), paint);
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
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[
              TextSpan(
                text:
                    'Bounding box relative coordinates (percentage and fraction)',
              ),
            ],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            30.0,
            30.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.translate(30.0, 40.0);
    {
      final Paint paint = Paint();
      paint.shader = _grad_linearBoundingBoxPercentage.createShader(
        Rect.fromLTWH(0.0, 0.0, 50.0, 20.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 50.0, 20.0), paint);
    }
    canvas.save();
    canvas.translate(0.0, 20.0);
    {
      final Paint paint = Paint();
      paint.shader = _grad_linearBoundingBoxFraction.createShader(
        Rect.fromLTWH(0.0, 0.0, 50.0, 20.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 50.0, 20.0), paint);
    }
    canvas.restore();
    canvas.save();
    canvas.translate(0.0, 40.0);
    {
      final Paint paint = Paint();
      paint.shader = _grad_linearUserSpace.createShader(viewBoxRect);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 50.0, 20.0), paint);
    }
    canvas.restore();
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFCCCCCC);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(const Offset(0.0, 20.0), const Offset(50.0, 20.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFCCCCCC);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(const Offset(0.0, 40.0), const Offset(50.0, 40.0), paint);
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
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'Percentage')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            60.0,
            15.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'Fraction')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            60.0,
            35.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'User Space')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            60.0,
            55.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
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
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[
              TextSpan(
                text: 'Bounding box relative length (percentage and fraction)',
              ),
            ],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            30.0,
            130.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.translate(30.0, 140.0);
    {
      final Paint paint = Paint();
      paint.shader = _grad_radialBoundingBoxPercentage.createShader(
        Rect.fromLTWH(0.0, 0.0, 60.0, 60.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 60.0, 60.0), paint);
    }
    canvas.save();
    canvas.translate(61.0, 0.0);
    {
      final Paint paint = Paint();
      paint.shader = _grad_radialBoundingBoxFraction.createShader(
        Rect.fromLTWH(0.0, 0.0, 60.0, 60.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 60.0, 60.0), paint);
    }
    canvas.restore();
    canvas.save();
    canvas.translate(122.0, 0.0);
    {
      final Paint paint = Paint();
      paint.shader = _grad_radialUserSpace.createShader(viewBoxRect);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 60.0, 60.0), paint);
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
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'Percent.')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            0.0,
            73.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'Fraction')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            61.0,
            73.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'User Space')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            122.0,
            73.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
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
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[
              TextSpan(
                text:
                    'Bounding box relative width/height (percentage and fraction)',
              ),
            ],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            30.0,
            240.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.translate(30.0, 250.0);
    {
      final Paint paint = Paint();
      paint.shader = _createPattern_patternBoundingBoxPercentage(
        Rect.fromLTWH(0.0, 0.0, 50.0, 30.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 50.0, 30.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 50.0, 30.0), paint);
    }
    canvas.save();
    canvas.translate(150.0, 0.0);
    {
      final Paint paint = Paint();
      paint.shader = _createPattern_patternBoundingBoxFraction(
        Rect.fromLTWH(0.0, 0.0, 50.0, 30.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 50.0, 30.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 50.0, 30.0), paint);
    }
    canvas.restore();
    canvas.save();
    canvas.translate(300.0, 0.0);
    {
      final Paint paint = Paint();
      paint.shader = _createPattern_patternUserSpace(
        Rect.fromLTWH(0.0, 0.0, 50.0, 30.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 50.0, 30.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 50.0, 30.0), paint);
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
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'Percentage')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            60.0,
            20.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'Fraction')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            210.0,
            20.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'User Space')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            360.0,
            20.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
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
  bool shouldRepaint(covariant _$CoordsUnits01BPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
