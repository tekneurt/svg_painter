// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'painting_marker_05_f_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class PaintingMarker05FPainterWidget extends StatelessWidget {
  const PaintingMarker05FPainterWidget({
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
      label: '\$RCSfile: painting-marker-05-f.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$PaintingMarker05FPainter(fit: fit),
      ),
    );
  }
}

class _$PaintingMarker05FPainter extends CustomPainter {
  const _$PaintingMarker05FPainter({this.fit = BoxFit.contain});

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
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-1.5, -1.5);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 2.0, 2.0));
      canvas.scale(0.2, 0.2);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF800080);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 15.0, 15.0), paint);
      }
      canvas.restore();
    }

    void _marker_marker2(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      canvas.rotate(tangentAngle);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-2.0, -2.0);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 2.0, 2.0));
      canvas.scale(0.2, 0.2);
      {
        final Path path = Path()
          ..moveTo(10.0, 0.0)
          ..lineTo(20.0, 20.0)
          ..lineTo(0.0, 20.0)
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
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-1.5, -1.5);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 2.0, 2.0));
      canvas.scale(0.2, 0.2);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF800080);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 15.0, 15.0), paint);
      }
      canvas.restore();
    }

    void _marker_markerMiddle(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
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
        canvas.drawCircle(const Offset(5.0, 5.0), 7.0, paint);
      }
      canvas.restore();
    }

    void _marker_markerEnd(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-2.0, -2.0);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 2.0, 2.0));
      canvas.scale(0.2, 0.2);
      {
        final Path path = Path()
          ..moveTo(10.0, 0.0)
          ..lineTo(20.0, 20.0)
          ..lineTo(0.0, 20.0)
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

    void _marker_vmarker1(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-1.5, -1.5);
      canvas.scale(0.2, 0.2);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF800080);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 15.0, 15.0), paint);
      }
      canvas.restore();
    }

    void _marker_vmarker2(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      canvas.rotate(tangentAngle);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-2.0, -2.0);
      canvas.scale(0.2, 0.2);
      {
        final Path path = Path()
          ..moveTo(10.0, 0.0)
          ..lineTo(20.0, 20.0)
          ..lineTo(0.0, 20.0)
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

    void _marker_vmarkerStart(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-1.5, -1.5);
      canvas.scale(0.2, 0.2);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF800080);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 15.0, 15.0), paint);
      }
      canvas.restore();
    }

    void _marker_vmarkerMiddle(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-1.0, -1.0);
      canvas.scale(0.2, 0.2);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF008000);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(5.0, 5.0), 7.0, paint);
      }
      canvas.restore();
    }

    void _marker_vmarkerEnd(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-2.0, -2.0);
      canvas.scale(0.2, 0.2);
      {
        final Path path = Path()
          ..moveTo(10.0, 0.0)
          ..lineTo(20.0, 20.0)
          ..lineTo(0.0, 20.0)
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

    void _marker_amarker1(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-1.5, -1.5);
      canvas.scale(0.2, 0.2);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF800080);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 15.0, 15.0), paint);
      }
      canvas.restore();
    }

    void _marker_amarker2(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      canvas.rotate(tangentAngle);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-2.0, -2.0);
      canvas.scale(0.2, 0.2);
      {
        final Path path = Path()
          ..moveTo(10.0, 0.0)
          ..lineTo(20.0, 20.0)
          ..lineTo(0.0, 20.0)
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

    void _marker_amarkerStart(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-1.5, -1.5);
      canvas.scale(0.2, 0.2);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF800080);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 15.0, 15.0), paint);
      }
      canvas.restore();
    }

    void _marker_amarkerMiddle(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-1.0, -1.0);
      canvas.scale(0.2, 0.2);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF008000);
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(5.0, 5.0), 7.0, paint);
      }
      canvas.restore();
    }

    void _marker_amarkerEnd(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-2.0, -2.0);
      canvas.scale(0.2, 0.2);
      {
        final Path path = Path()
          ..moveTo(10.0, 0.0)
          ..lineTo(20.0, 20.0)
          ..lineTo(0.0, 20.0)
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

    void _marker_smarker1(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-1.5, -1.5);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 2.0, 2.0));
      canvas.scale(0.2, 0.2);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF800080);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 15.0, 15.0), paint);
      }
      canvas.restore();
    }

    void _marker_smarker2(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      canvas.rotate(tangentAngle);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-2.0, -2.0);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 2.0, 2.0));
      canvas.scale(0.2, 0.2);
      {
        final Path path = Path()
          ..moveTo(10.0, 0.0)
          ..lineTo(20.0, 20.0)
          ..lineTo(0.0, 20.0)
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

    void _marker_smarkerStart(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-1.5, -1.5);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 2.0, 2.0));
      canvas.scale(0.2, 0.2);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF800080);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 15.0, 15.0), paint);
      }
      canvas.restore();
    }

    void _marker_smarkerMiddle(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
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
        canvas.drawCircle(const Offset(5.0, 5.0), 7.0, paint);
      }
      canvas.restore();
    }

    void _marker_smarkerEnd(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-2.0, -2.0);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 2.0, 2.0));
      canvas.scale(0.2, 0.2);
      {
        final Path path = Path()
          ..moveTo(10.0, 0.0)
          ..lineTo(20.0, 20.0)
          ..lineTo(0.0, 20.0)
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

    void _marker_hmarker1(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-1.5, -1.5);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 2.0, 2.0));
      canvas.scale(0.2, 0.2);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF800080);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 15.0, 15.0), paint);
      }
      canvas.restore();
    }

    void _marker_hmarker2(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      canvas.rotate(tangentAngle);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-2.0, -2.0);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 2.0, 2.0));
      canvas.scale(0.2, 0.2);
      {
        final Path path = Path()
          ..moveTo(10.0, 0.0)
          ..lineTo(20.0, 20.0)
          ..lineTo(0.0, 20.0)
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

    void _marker_hmarkerStart(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-1.5, -1.5);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 2.0, 2.0));
      canvas.scale(0.2, 0.2);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF800080);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 15.0, 15.0), paint);
      }
      canvas.restore();
    }

    void _marker_hmarkerMiddle(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
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
        canvas.drawCircle(const Offset(5.0, 5.0), 7.0, paint);
      }
      canvas.restore();
    }

    void _marker_hmarkerEnd(
      Canvas canvas,
      Offset position,
      double tangentAngle,
      double strokeWidth, {
      bool isStart = false,
      Paint? contextFill,
      Paint? contextStroke,
    }) {
      canvas.save();
      canvas.translate(position.dx, position.dy);
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-2.0, -2.0);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 2.0, 2.0));
      canvas.scale(0.2, 0.2);
      {
        final Path path = Path()
          ..moveTo(10.0, 0.0)
          ..lineTo(20.0, 20.0)
          ..lineTo(0.0, 20.0)
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
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
            ),
            children: <InlineSpan>[TextSpan(text: 'Test marker overflow')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            240.0 - tp.width / 2.0,
            54.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.translate(0.0, 280.0);
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
            ),
            children: <InlineSpan>[TextSpan(text: 'default')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            60.0 - tp.width / 2.0,
            0.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
            ),
            children: <InlineSpan>[TextSpan(text: '\'visible\'')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            155.0 - tp.width / 2.0,
            0.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
            ),
            children: <InlineSpan>[TextSpan(text: '\'auto\'')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            245.0 - tp.width / 2.0,
            0.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
            ),
            children: <InlineSpan>[TextSpan(text: '\'scroll\'')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            340.0 - tp.width / 2.0,
            0.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
            ),
            children: <InlineSpan>[TextSpan(text: '\'hidden\'')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            430.0 - tp.width / 2.0,
            0.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.restore();
    canvas.save();
    canvas.translate(-30.0, 75.0);
    canvas.save();
    canvas.scale(0.6, 0.6);
    {
      final Path path = Path()
        ..moveTo(130.0, 40.0)
        ..lineTo(180.0, 40.0)
        ..lineTo(180.0, 90.0);
      {
        final Paint strokePaint = Paint();
        {
          strokePaint.color = Colors.black;
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 8.0;
        }
        canvas.drawPath(path, strokePaint);
        _marker_marker1(
          canvas,
          const Offset(130.0, 40.0),
          0.0,
          8.0,
          isStart: true,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(180.0, 40.0),
          0.7853981633974483,
          8.0,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(180.0, 90.0),
          1.5707963267948966,
          8.0,
          contextStroke: strokePaint,
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(130.0, 135.0)
        ..lineTo(180.0, 135.0)
        ..lineTo(180.0, 185.0);
      {
        final Paint strokePaint = Paint();
        {
          strokePaint.color = Colors.black;
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 8.0;
        }
        canvas.drawPath(path, strokePaint);
        _marker_markerStart(
          canvas,
          const Offset(130.0, 135.0),
          0.0,
          8.0,
          isStart: true,
          contextStroke: strokePaint,
        );
        _marker_markerMiddle(
          canvas,
          const Offset(180.0, 135.0),
          0.7853981633974483,
          8.0,
          contextStroke: strokePaint,
        );
        _marker_markerEnd(
          canvas,
          const Offset(180.0, 185.0),
          1.5707963267948966,
          8.0,
          contextStroke: strokePaint,
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(130.0, 230.0)
        ..lineTo(180.0, 230.0)
        ..lineTo(180.0, 280.0);
      {
        final Paint strokePaint = Paint();
        {
          strokePaint.color = Colors.black;
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 8.0;
        }
        canvas.drawPath(path, strokePaint);
        _marker_marker2(
          canvas,
          const Offset(130.0, 230.0),
          0.0,
          8.0,
          isStart: true,
          contextStroke: strokePaint,
        );
        _marker_marker2(
          canvas,
          const Offset(180.0, 230.0),
          0.7853981633974483,
          8.0,
          contextStroke: strokePaint,
        );
        _marker_marker2(
          canvas,
          const Offset(180.0, 280.0),
          1.5707963267948966,
          8.0,
          contextStroke: strokePaint,
        );
      }
    }
    canvas.restore();
    canvas.save();
    canvas.scale(0.6, 0.6);
    canvas.translate(150.0, 0.0);
    {
      final Path path = Path()
        ..moveTo(130.0, 40.0)
        ..lineTo(180.0, 40.0)
        ..lineTo(180.0, 90.0);
      {
        final Paint strokePaint = Paint();
        {
          strokePaint.color = Colors.black;
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 8.0;
        }
        canvas.drawPath(path, strokePaint);
        _marker_vmarker1(
          canvas,
          const Offset(130.0, 40.0),
          0.0,
          8.0,
          isStart: true,
          contextStroke: strokePaint,
        );
        _marker_vmarker1(
          canvas,
          const Offset(180.0, 40.0),
          0.7853981633974483,
          8.0,
          contextStroke: strokePaint,
        );
        _marker_vmarker1(
          canvas,
          const Offset(180.0, 90.0),
          1.5707963267948966,
          8.0,
          contextStroke: strokePaint,
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(130.0, 135.0)
        ..lineTo(180.0, 135.0)
        ..lineTo(180.0, 185.0);
      {
        final Paint strokePaint = Paint();
        {
          strokePaint.color = Colors.black;
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 8.0;
        }
        canvas.drawPath(path, strokePaint);
        _marker_vmarkerStart(
          canvas,
          const Offset(130.0, 135.0),
          0.0,
          8.0,
          isStart: true,
          contextStroke: strokePaint,
        );
        _marker_vmarkerMiddle(
          canvas,
          const Offset(180.0, 135.0),
          0.7853981633974483,
          8.0,
          contextStroke: strokePaint,
        );
        _marker_vmarkerEnd(
          canvas,
          const Offset(180.0, 185.0),
          1.5707963267948966,
          8.0,
          contextStroke: strokePaint,
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(130.0, 230.0)
        ..lineTo(180.0, 230.0)
        ..lineTo(180.0, 280.0);
      {
        final Paint strokePaint = Paint();
        {
          strokePaint.color = Colors.black;
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 8.0;
        }
        canvas.drawPath(path, strokePaint);
        _marker_vmarker2(
          canvas,
          const Offset(130.0, 230.0),
          0.0,
          8.0,
          isStart: true,
          contextStroke: strokePaint,
        );
        _marker_vmarker2(
          canvas,
          const Offset(180.0, 230.0),
          0.7853981633974483,
          8.0,
          contextStroke: strokePaint,
        );
        _marker_vmarker2(
          canvas,
          const Offset(180.0, 280.0),
          1.5707963267948966,
          8.0,
          contextStroke: strokePaint,
        );
      }
    }
    canvas.restore();
    canvas.save();
    canvas.scale(0.6, 0.6);
    canvas.translate(300.0, 0.0);
    {
      final Path path = Path()
        ..moveTo(130.0, 40.0)
        ..lineTo(180.0, 40.0)
        ..lineTo(180.0, 90.0);
      {
        final Paint strokePaint = Paint();
        {
          strokePaint.color = Colors.black;
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 8.0;
        }
        canvas.drawPath(path, strokePaint);
        _marker_amarker1(
          canvas,
          const Offset(130.0, 40.0),
          0.0,
          8.0,
          isStart: true,
          contextStroke: strokePaint,
        );
        _marker_amarker1(
          canvas,
          const Offset(180.0, 40.0),
          0.7853981633974483,
          8.0,
          contextStroke: strokePaint,
        );
        _marker_amarker1(
          canvas,
          const Offset(180.0, 90.0),
          1.5707963267948966,
          8.0,
          contextStroke: strokePaint,
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(130.0, 135.0)
        ..lineTo(180.0, 135.0)
        ..lineTo(180.0, 185.0);
      {
        final Paint strokePaint = Paint();
        {
          strokePaint.color = Colors.black;
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 8.0;
        }
        canvas.drawPath(path, strokePaint);
        _marker_amarkerStart(
          canvas,
          const Offset(130.0, 135.0),
          0.0,
          8.0,
          isStart: true,
          contextStroke: strokePaint,
        );
        _marker_amarkerMiddle(
          canvas,
          const Offset(180.0, 135.0),
          0.7853981633974483,
          8.0,
          contextStroke: strokePaint,
        );
        _marker_amarkerEnd(
          canvas,
          const Offset(180.0, 185.0),
          1.5707963267948966,
          8.0,
          contextStroke: strokePaint,
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(130.0, 230.0)
        ..lineTo(180.0, 230.0)
        ..lineTo(180.0, 280.0);
      {
        final Paint strokePaint = Paint();
        {
          strokePaint.color = Colors.black;
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 8.0;
        }
        canvas.drawPath(path, strokePaint);
        _marker_amarker2(
          canvas,
          const Offset(130.0, 230.0),
          0.0,
          8.0,
          isStart: true,
          contextStroke: strokePaint,
        );
        _marker_amarker2(
          canvas,
          const Offset(180.0, 230.0),
          0.7853981633974483,
          8.0,
          contextStroke: strokePaint,
        );
        _marker_amarker2(
          canvas,
          const Offset(180.0, 280.0),
          1.5707963267948966,
          8.0,
          contextStroke: strokePaint,
        );
      }
    }
    canvas.restore();
    canvas.save();
    canvas.scale(0.6, 0.6);
    canvas.translate(450.0, 0.0);
    {
      final Path path = Path()
        ..moveTo(130.0, 40.0)
        ..lineTo(180.0, 40.0)
        ..lineTo(180.0, 90.0);
      {
        final Paint strokePaint = Paint();
        {
          strokePaint.color = Colors.black;
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 8.0;
        }
        canvas.drawPath(path, strokePaint);
        _marker_smarker1(
          canvas,
          const Offset(130.0, 40.0),
          0.0,
          8.0,
          isStart: true,
          contextStroke: strokePaint,
        );
        _marker_smarker1(
          canvas,
          const Offset(180.0, 40.0),
          0.7853981633974483,
          8.0,
          contextStroke: strokePaint,
        );
        _marker_smarker1(
          canvas,
          const Offset(180.0, 90.0),
          1.5707963267948966,
          8.0,
          contextStroke: strokePaint,
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(130.0, 135.0)
        ..lineTo(180.0, 135.0)
        ..lineTo(180.0, 185.0);
      {
        final Paint strokePaint = Paint();
        {
          strokePaint.color = Colors.black;
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 8.0;
        }
        canvas.drawPath(path, strokePaint);
        _marker_smarkerStart(
          canvas,
          const Offset(130.0, 135.0),
          0.0,
          8.0,
          isStart: true,
          contextStroke: strokePaint,
        );
        _marker_smarkerMiddle(
          canvas,
          const Offset(180.0, 135.0),
          0.7853981633974483,
          8.0,
          contextStroke: strokePaint,
        );
        _marker_smarkerEnd(
          canvas,
          const Offset(180.0, 185.0),
          1.5707963267948966,
          8.0,
          contextStroke: strokePaint,
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(130.0, 230.0)
        ..lineTo(180.0, 230.0)
        ..lineTo(180.0, 280.0);
      {
        final Paint strokePaint = Paint();
        {
          strokePaint.color = Colors.black;
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 8.0;
        }
        canvas.drawPath(path, strokePaint);
        _marker_smarker2(
          canvas,
          const Offset(130.0, 230.0),
          0.0,
          8.0,
          isStart: true,
          contextStroke: strokePaint,
        );
        _marker_smarker2(
          canvas,
          const Offset(180.0, 230.0),
          0.7853981633974483,
          8.0,
          contextStroke: strokePaint,
        );
        _marker_smarker2(
          canvas,
          const Offset(180.0, 280.0),
          1.5707963267948966,
          8.0,
          contextStroke: strokePaint,
        );
      }
    }
    canvas.restore();
    canvas.save();
    canvas.scale(0.6, 0.6);
    canvas.translate(600.0, 0.0);
    {
      final Path path = Path()
        ..moveTo(130.0, 40.0)
        ..lineTo(180.0, 40.0)
        ..lineTo(180.0, 90.0);
      {
        final Paint strokePaint = Paint();
        {
          strokePaint.color = Colors.black;
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 8.0;
        }
        canvas.drawPath(path, strokePaint);
        _marker_hmarker1(
          canvas,
          const Offset(130.0, 40.0),
          0.0,
          8.0,
          isStart: true,
          contextStroke: strokePaint,
        );
        _marker_hmarker1(
          canvas,
          const Offset(180.0, 40.0),
          0.7853981633974483,
          8.0,
          contextStroke: strokePaint,
        );
        _marker_hmarker1(
          canvas,
          const Offset(180.0, 90.0),
          1.5707963267948966,
          8.0,
          contextStroke: strokePaint,
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(130.0, 135.0)
        ..lineTo(180.0, 135.0)
        ..lineTo(180.0, 185.0);
      {
        final Paint strokePaint = Paint();
        {
          strokePaint.color = Colors.black;
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 8.0;
        }
        canvas.drawPath(path, strokePaint);
        _marker_hmarkerStart(
          canvas,
          const Offset(130.0, 135.0),
          0.0,
          8.0,
          isStart: true,
          contextStroke: strokePaint,
        );
        _marker_hmarkerMiddle(
          canvas,
          const Offset(180.0, 135.0),
          0.7853981633974483,
          8.0,
          contextStroke: strokePaint,
        );
        _marker_hmarkerEnd(
          canvas,
          const Offset(180.0, 185.0),
          1.5707963267948966,
          8.0,
          contextStroke: strokePaint,
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(130.0, 230.0)
        ..lineTo(180.0, 230.0)
        ..lineTo(180.0, 280.0);
      {
        final Paint strokePaint = Paint();
        {
          strokePaint.color = Colors.black;
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 8.0;
        }
        canvas.drawPath(path, strokePaint);
        _marker_hmarker2(
          canvas,
          const Offset(130.0, 230.0),
          0.0,
          8.0,
          isStart: true,
          contextStroke: strokePaint,
        );
        _marker_hmarker2(
          canvas,
          const Offset(180.0, 230.0),
          0.7853981633974483,
          8.0,
          contextStroke: strokePaint,
        );
        _marker_hmarker2(
          canvas,
          const Offset(180.0, 280.0),
          1.5707963267948966,
          8.0,
          contextStroke: strokePaint,
        );
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
  bool shouldRepaint(covariant _$PaintingMarker05FPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
