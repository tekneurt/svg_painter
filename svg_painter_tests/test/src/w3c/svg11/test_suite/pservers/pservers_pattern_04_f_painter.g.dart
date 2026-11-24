// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pservers_pattern_04_f_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, unused_local_variable, deprecated_member_use_from_same_package

class PserversPattern04FPainterWidget extends StatelessWidget {
  const PserversPattern04FPainterWidget({
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
      label: '\$RCSfile: pservers-pattern-04-f.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$PserversPattern04FPainter(fit: fit),
      ),
    );
  }
}

class _$PserversPattern04FPainter extends CustomPainter {
  const _$PserversPattern04FPainter({this.fit = BoxFit.contain});

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

    ImageShader? _createPattern_pattern1(Rect targetBounds) {
      final double tileWidth = 100.0;
      final double tileHeight = 100.0;
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
      final double scaleX = tileWidth / 10.0;
      final double scaleY = tileHeight / 10.0;
      final double s = scaleX < scaleY ? scaleX : scaleY;
      canvas.translate(
        (tileWidth - 10.0 * s) * 0.5,
        (tileHeight - 10.0 * s) * 0.5,
      );
      canvas.scale(s, s);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(5.0, 5.0), 1.9, paint);
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

    ImageShader? _createPattern_pattern2(Rect targetBounds) {
      final double tileWidth = 100.0;
      final double tileHeight = 100.0;
      final double originX = 0.0;
      final double originY = 30.0;
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
      final double scaleX = tileWidth / 10.0;
      final double scaleY = tileHeight / 10.0;
      final double s = scaleX < scaleY ? scaleX : scaleY;
      canvas.translate(
        (tileWidth - 10.0 * s) * 0.5,
        (tileHeight - 10.0 * s) * 0.5,
      );
      canvas.scale(s, s);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF00FF00);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(5.0, 2.0), 2.0, paint);
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
      paint.shader = _createPattern_pattern1(
        Rect.fromLTWH(1.0, 1.0, 200.0, 200.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(1.0, 1.0, 200.0, 200.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _createPattern_pattern2(
        Rect.fromLTWH(1.0, 1.0, 200.0, 200.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(1.0, 1.0, 200.0, 200.0), paint);
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
  bool shouldRepaint(covariant _$PserversPattern04FPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
