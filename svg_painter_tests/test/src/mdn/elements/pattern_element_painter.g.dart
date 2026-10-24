// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pattern_element_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class PatternElementPainterWidget extends StatelessWidget {
  const PatternElementPainterWidget({
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
      size: Size(width ?? 230.0, height ?? 100.0),
      painter: _$PatternElementPainter(fit: fit),
    );
  }
}

class _$PatternElementPainter extends CustomPainter {
  const _$PatternElementPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(230.0, 100.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(230.0, 100.0),
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

    ImageShader? _createPattern_star(Rect targetBounds) {
      final double tileWidth = targetBounds.width * 0.1;
      final double tileHeight = targetBounds.height * 0.1;
      final double originX = targetBounds.left;
      final double originY = targetBounds.top;
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
        final Path path = Path()
          ..moveTo(0.0, 0.0)
          ..lineTo(2.0, 5.0)
          ..lineTo(0.0, 10.0)
          ..lineTo(5.0, 8.0)
          ..lineTo(10.0, 10.0)
          ..lineTo(8.0, 5.0)
          ..lineTo(10.0, 0.0)
          ..lineTo(5.0, 2.0)
          ..close();
        {
          final Paint paint = Paint();
          paint.color = Colors.black;
          paint.style = PaintingStyle.fill;
          canvas.drawPath(path, paint);
        }
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
      paint.shader = _createPattern_star(
        Rect.fromCircle(center: const Offset(50.0, 50.0), radius: 50.0),
      );
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(50.0, 50.0), 50.0, paint);
    }
    {
      final Paint paint = Paint();
      paint.shader = _createPattern_star(
        Rect.fromCircle(center: const Offset(180.0, 50.0), radius: 40.0),
      );
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 20.0;
      canvas.drawCircle(const Offset(180.0, 50.0), 40.0, paint);
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
  bool shouldRepaint(covariant _$PatternElementPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
