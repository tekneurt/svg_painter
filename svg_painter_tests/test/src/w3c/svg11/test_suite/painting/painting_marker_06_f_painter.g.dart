// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'painting_marker_06_f_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class PaintingMarker06FPainterWidget extends StatelessWidget {
  const PaintingMarker06FPainterWidget({
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
      label: '\$RCSfile: painting-marker-06-f.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$PaintingMarker06FPainter(fit: fit),
      ),
    );
  }
}

class _$PaintingMarker06FPainter extends CustomPainter {
  const _$PaintingMarker06FPainter({this.fit = BoxFit.contain});

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

    void _marker_marker1(
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
      canvas.translate(-1.0, -1.0);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 2.0, 2.0));
      canvas.scale(0.2, 0.2);
      canvas.translate(-20.0, -20.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF800080);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(20.0, 20.0, 10.0, 10.0), paint);
      }
      canvas.restore();
    }

    void _marker_marker2(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      canvas.rotate(tangentAngle);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-1.0, -1.0);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 2.0, 2.0));
      canvas.scale(0.2, 0.2);
      canvas.translate(5.0, 5.0);
      {
        final Path path = Path()
          ..moveTo(0.0, -5.0)
          ..lineTo(5.0, 5.0)
          ..lineTo(-5.0, 5.0)
          ..close();
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFF0000FF);
          paint.style = PaintingStyle.fill;
          canvas.drawPath(path, paint);
        }
      }
      canvas.restore();
    }

    void _marker_markerStart(
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
      canvas.translate(-1.0, -1.0);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 2.0, 2.0));
      canvas.scale(0.2, 0.2);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF800080);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0), paint);
      }
      canvas.restore();
    }

    void _marker_markerMiddle(
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
      canvas.translate(-1.0, -1.0);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 2.0, 2.0));
      canvas.scale(0.2, 0.2);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF008000);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(5.0, 5.0), 5.0, paint);
      }
      canvas.restore();
    }

    void _marker_markerEnd(
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
      canvas.translate(-1.0, -1.0);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 2.0, 2.0));
      canvas.scale(0.2, 0.2);
      {
        final Path path = Path()
          ..moveTo(5.0, 0.0)
          ..lineTo(10.0, 10.0)
          ..lineTo(0.0, 10.0)
          ..close();
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFF0000FF);
          paint.style = PaintingStyle.fill;
          canvas.drawPath(path, paint);
        }
      }
      canvas.restore();
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
            children: <InlineSpan>[TextSpan(text: 'Basic Markers')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            170.0,
            30.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(130.0, 40.0)
        ..lineTo(180.0, 40.0)
        ..lineTo(180.0, 90.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 8.0;
        canvas.drawPath(path, paint);
      }
      _marker_marker1(
        canvas,
        const Offset(130.0, 40.0),
        0.0,
        8.0,
        isStart: true,
      );
      _marker_marker1(
        canvas,
        const Offset(180.0, 40.0),
        0.7853981633974483,
        8.0,
      );
      _marker_marker1(
        canvas,
        const Offset(180.0, 90.0),
        1.5707963267948966,
        8.0,
      );
    }
    canvas.save();
    canvas.translate(120.0, 0.0);
    {
      final Path path = Path()
        ..moveTo(130.0, 40.0)
        ..lineTo(180.0, 40.0)
        ..lineTo(180.0, 90.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 8.0;
        canvas.drawPath(path, paint);
      }
    }
    canvas.save();
    canvas.translate(130.0, 40.0);
    canvas.scale(8.0, 8.0);
    canvas.scale(0.2, 0.2);
    canvas.translate(-5.0, -5.0);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF800080);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0), paint);
    }
    canvas.restore();
    canvas.save();
    canvas.translate(180.0, 40.0);
    canvas.scale(8.0, 8.0);
    canvas.scale(0.2, 0.2);
    canvas.translate(-5.0, -5.0);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF800080);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0), paint);
    }
    canvas.restore();
    canvas.save();
    canvas.translate(180.0, 90.0);
    canvas.scale(8.0, 8.0);
    canvas.scale(0.2, 0.2);
    canvas.translate(-5.0, -5.0);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF800080);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0), paint);
    }
    canvas.restore();
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
            children: <InlineSpan>[TextSpan(text: 'Start, Middle and End')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            145.0,
            125.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(130.0, 135.0)
        ..lineTo(180.0, 135.0)
        ..lineTo(180.0, 185.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 8.0;
        canvas.drawPath(path, paint);
      }
      _marker_markerStart(
        canvas,
        const Offset(130.0, 135.0),
        0.0,
        8.0,
        isStart: true,
      );
      _marker_markerMiddle(
        canvas,
        const Offset(180.0, 135.0),
        0.7853981633974483,
        8.0,
      );
      _marker_markerEnd(
        canvas,
        const Offset(180.0, 185.0),
        1.5707963267948966,
        8.0,
      );
    }
    canvas.save();
    canvas.translate(120.0, 0.0);
    {
      final Path path = Path()
        ..moveTo(130.0, 135.0)
        ..lineTo(180.0, 135.0)
        ..lineTo(180.0, 185.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 8.0;
        canvas.drawPath(path, paint);
      }
    }
    canvas.save();
    canvas.translate(130.0, 135.0);
    canvas.scale(8.0, 8.0);
    canvas.scale(0.2, 0.2);
    canvas.translate(-5.0, -5.0);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF800080);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0), paint);
    }
    canvas.restore();
    canvas.save();
    canvas.translate(180.0, 135.0);
    canvas.scale(8.0, 8.0);
    canvas.scale(0.2, 0.2);
    canvas.translate(-5.0, -5.0);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF008000);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(5.0, 5.0), 5.0, paint);
    }
    canvas.restore();
    canvas.save();
    canvas.translate(180.0, 185.0);
    canvas.scale(8.0, 8.0);
    canvas.scale(0.2, 0.2);
    canvas.translate(-5.0, -5.0);
    {
      final Path path = Path()
        ..moveTo(5.0, 0.0)
        ..lineTo(10.0, 10.0)
        ..lineTo(0.0, 10.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    canvas.restore();
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
            children: <InlineSpan>[TextSpan(text: 'Automatic Orientation')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            145.0,
            220.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(130.0, 230.0)
        ..lineTo(180.0, 230.0)
        ..lineTo(180.0, 280.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 8.0;
        canvas.drawPath(path, paint);
      }
      _marker_marker2(
        canvas,
        const Offset(130.0, 230.0),
        0.0,
        8.0,
        isStart: true,
      );
      _marker_marker2(
        canvas,
        const Offset(180.0, 230.0),
        0.7853981633974483,
        8.0,
      );
      _marker_marker2(
        canvas,
        const Offset(180.0, 280.0),
        1.5707963267948966,
        8.0,
      );
    }
    canvas.save();
    canvas.translate(120.0, 0.0);
    {
      final Path path = Path()
        ..moveTo(130.0, 230.0)
        ..lineTo(180.0, 230.0)
        ..lineTo(180.0, 280.0);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 8.0;
        canvas.drawPath(path, paint);
      }
    }
    canvas.save();
    canvas.translate(130.0, 230.0);
    canvas.rotate(0.0);
    canvas.scale(8.0, 8.0);
    canvas.scale(0.2, 0.2);
    canvas.translate(-5.0, -5.0);
    {
      final Path path = Path()
        ..moveTo(5.0, 0.0)
        ..lineTo(10.0, 10.0)
        ..lineTo(0.0, 10.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    canvas.restore();
    canvas.save();
    canvas.translate(180.0, 230.0);
    canvas.rotate(0.7853981633974483);
    canvas.scale(8.0, 8.0);
    canvas.scale(0.2, 0.2);
    canvas.translate(-5.0, -5.0);
    {
      final Path path = Path()
        ..moveTo(5.0, 0.0)
        ..lineTo(10.0, 10.0)
        ..lineTo(0.0, 10.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    canvas.restore();
    canvas.save();
    canvas.translate(180.0, 280.0);
    canvas.rotate(1.5707963267948966);
    canvas.scale(8.0, 8.0);
    canvas.scale(0.2, 0.2);
    canvas.translate(-5.0, -5.0);
    {
      final Path path = Path()
        ..moveTo(5.0, 0.0)
        ..lineTo(10.0, 10.0)
        ..lineTo(0.0, 10.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    canvas.restore();
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
  bool shouldRepaint(covariant _$PaintingMarker06FPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
