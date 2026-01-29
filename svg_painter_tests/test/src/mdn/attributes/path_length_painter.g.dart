// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_length_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class _$PathLengthPainter extends CustomPainter {
  const _$PathLengthPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(100.0, 60.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(100.0, 60.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 100.0, 60.0));

    {
      // Path
      {
        final Path path = Path();
        path.moveTo(0.0, 10.0);
        path.lineTo(100.0, 10.0);
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFF000000);
          paint.style = PaintingStyle.stroke;
          paint.strokeWidth = 2.0;
          final List<double> dashArray = [10.0];
          canvas.drawPath(_dashPath(path, dashArray), paint);
        }
      }
    }
    {
      // Path
      {
        final Path path = Path();
        path.moveTo(0.0, 20.0);
        path.lineTo(100.0, 20.0);
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFF000000);
          paint.style = PaintingStyle.stroke;
          paint.strokeWidth = 2.0;
          final List<double> dashArray = [10.0];
          canvas.drawPath(_dashPath(path, dashArray, pathLength: 90.0), paint);
        }
      }
    }
    {
      // Path
      {
        final Path path = Path();
        path.moveTo(0.0, 30.0);
        path.lineTo(100.0, 30.0);
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFF000000);
          paint.style = PaintingStyle.stroke;
          paint.strokeWidth = 2.0;
          final List<double> dashArray = [10.0];
          canvas.drawPath(_dashPath(path, dashArray, pathLength: 50.0), paint);
        }
      }
    }
    {
      // Path
      {
        final Path path = Path();
        path.moveTo(0.0, 40.0);
        path.lineTo(100.0, 40.0);
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFF000000);
          paint.style = PaintingStyle.stroke;
          paint.strokeWidth = 2.0;
          final List<double> dashArray = [10.0];
          canvas.drawPath(_dashPath(path, dashArray, pathLength: 30.0), paint);
        }
      }
    }
    {
      // Path
      {
        final Path path = Path();
        path.moveTo(0.0, 50.0);
        path.lineTo(100.0, 50.0);
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFF000000);
          paint.style = PaintingStyle.stroke;
          paint.strokeWidth = 2.0;
          final List<double> dashArray = [10.0];
          canvas.drawPath(_dashPath(path, dashArray, pathLength: 10.0), paint);
        }
      }
    }
    canvas.restore();
  }

  Path _dashPath(Path source, List<double> dashArray, {double? pathLength}) {
    if (dashArray.isEmpty) return source;
    final Path dest = Path();
    for (final metric in source.computeMetrics()) {
      final double scale = (pathLength != null && pathLength > 0)
          ? (metric.length / pathLength)
          : 1.0;
      double distance = 0.0;
      int index = 0;
      bool draw = true;
      while (distance < metric.length) {
        final double len = dashArray[index] * scale;
        if (draw) {
          final double end = distance + len < metric.length
              ? distance + len
              : metric.length;
          dest.addPath(metric.extractPath(distance, end), Offset.zero);
        }
        distance += len;
        draw = !draw;
        index = (index + 1) % dashArray.length;
      }
    }
    return dest;
  }

  @override
  bool shouldRepaint(covariant _$PathLengthPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
