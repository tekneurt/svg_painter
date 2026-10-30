// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'painting_marker_02_f_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class PaintingMarker02FPainterWidget extends StatelessWidget {
  const PaintingMarker02FPainterWidget({
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
      label: '\$RCSfile: painting-marker-02-f.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$PaintingMarker02FPainter(fit: fit),
      ),
    );
  }
}

class _$PaintingMarker02FPainter extends CustomPainter {
  const _$PaintingMarker02FPainter({this.fit = BoxFit.contain});

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

    void _clipPath_overflowHiddenClip1(
      Canvas canvas,
      Size size,
      Rect targetBounds,
    ) {
      final Path path = Path();
      path.addRect(Rect.fromLTWH(0.0, 0.0, 2.0, 2.0));
      canvas.clipPath(path);
    }

    void _clipPath_overflowHiddenClip(
      Canvas canvas,
      Size size,
      Rect targetBounds,
    ) {
      final Path path = Path();
      path.addRect(Rect.fromLTWH(0.0, 0.0, 4.0, 4.0));
      canvas.clipPath(path);
    }

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
      canvas.translate(-1.0, -1.0);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 2.0, 2.0));
      canvas.scale(0.2, 0.2);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0), paint);
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
      if (strokeWidth != 1.0) {
        canvas.scale(strokeWidth, strokeWidth);
      }
      canvas.translate(-2.0, -2.0);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 4.0, 4.0));
      canvas.scale(0.2, 0.2);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 4.0;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 20.0, 20.0), paint);
      }
      canvas.restore();
    }

    void _marker_marker3(
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
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 4.0, 4.0));
      canvas.scale(0.2, 0.2);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF008000);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 20.0, 20.0), paint);
      }
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 8.0;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 20.0, 20.0), paint);
      }
      canvas.restore();
    }

    void _marker_marker4(
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
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 4.0, 4.0));
      canvas.scale(0.4, 0.4);
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0), paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 4.0;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0), paint);
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
            children: <InlineSpan>[
              TextSpan(text: 'Marker Rendering Properties'),
            ],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            125.0,
            30.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 10.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'Fill Property')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            100.0,
            140.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(30.0, 60.0)
        ..lineTo(80.0, 60.0)
        ..lineTo(80.0, 110.0)
        ..close();
      {
        final Paint fillPaint = Paint();
        {
          fillPaint.color = Colors.black;
          fillPaint.style = PaintingStyle.fill;
        }
        canvas.drawPath(path, fillPaint);
        _marker_marker1(
          canvas,
          const Offset(30.0, 60.0),
          0.0,
          8.0,
          isStart: true,
          contextFill: fillPaint,
        );
        _marker_marker1(
          canvas,
          const Offset(80.0, 60.0),
          0.7853981633974483,
          8.0,
          contextFill: fillPaint,
        );
        _marker_marker1(
          canvas,
          const Offset(80.0, 110.0),
          2.748893571891069,
          8.0,
          contextFill: fillPaint,
        );
        _marker_marker1(
          canvas,
          const Offset(30.0, 60.0),
          -2.356194490192345,
          8.0,
          contextFill: fillPaint,
        );
      }
    }
    canvas.save();
    canvas.translate(120.0, 0.0);
    {
      final Path path = Path()
        ..moveTo(30.0, 60.0)
        ..lineTo(80.0, 60.0)
        ..lineTo(80.0, 110.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
    }
    canvas.save();
    canvas.translate(30.0, 60.0);
    canvas.scale(8.0, 8.0);
    canvas.translate(-1.0, -1.0);
    canvas.save();
    _clipPath_overflowHiddenClip1(canvas, size, Offset.zero & viewBox);
    canvas.save();
    canvas.scale(0.2, 0.2);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0), paint);
    }
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(80.0, 60.0);
    canvas.scale(8.0, 8.0);
    canvas.translate(-1.0, -1.0);
    canvas.save();
    _clipPath_overflowHiddenClip1(canvas, size, Offset.zero & viewBox);
    canvas.save();
    canvas.scale(0.2, 0.2);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0), paint);
    }
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(80.0, 110.0);
    canvas.scale(8.0, 8.0);
    canvas.translate(-1.0, -1.0);
    canvas.save();
    _clipPath_overflowHiddenClip1(canvas, size, Offset.zero & viewBox);
    canvas.save();
    canvas.scale(0.2, 0.2);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0), paint);
    }
    canvas.restore();
    canvas.restore();
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
              fontSize: 10.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'Stroke Property')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            340.0,
            140.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(270.0, 60.0)
        ..lineTo(320.0, 60.0)
        ..lineTo(320.0, 110.0)
        ..close();
      {
        final Paint strokePaint = Paint();
        {
          strokePaint.color = Colors.black;
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 4.0;
        }
        canvas.drawPath(path, strokePaint);
        _marker_marker2(
          canvas,
          const Offset(270.0, 60.0),
          0.0,
          4.0,
          isStart: true,
          contextStroke: strokePaint,
        );
        _marker_marker2(
          canvas,
          const Offset(320.0, 60.0),
          0.7853981633974483,
          4.0,
          contextStroke: strokePaint,
        );
        _marker_marker2(
          canvas,
          const Offset(320.0, 110.0),
          2.748893571891069,
          4.0,
          contextStroke: strokePaint,
        );
        _marker_marker2(
          canvas,
          const Offset(270.0, 60.0),
          -2.356194490192345,
          4.0,
          contextStroke: strokePaint,
        );
      }
    }
    canvas.save();
    canvas.translate(120.0, 0.0);
    {
      final Path path = Path()
        ..moveTo(270.0, 60.0)
        ..lineTo(320.0, 60.0)
        ..lineTo(320.0, 110.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 4.0;
        canvas.drawPath(path, paint);
      }
    }
    canvas.save();
    canvas.translate(270.0, 60.0);
    canvas.scale(4.0, 4.0);
    canvas.translate(-2.0, -2.0);
    canvas.save();
    _clipPath_overflowHiddenClip(canvas, size, Offset.zero & viewBox);
    canvas.save();
    canvas.scale(0.2, 0.2);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 4.0;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 20.0, 20.0), paint);
    }
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(320.0, 60.0);
    canvas.scale(4.0, 4.0);
    canvas.translate(-2.0, -2.0);
    canvas.save();
    _clipPath_overflowHiddenClip(canvas, size, Offset.zero & viewBox);
    canvas.save();
    canvas.scale(0.2, 0.2);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 4.0;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 20.0, 20.0), paint);
    }
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(320.0, 110.0);
    canvas.scale(4.0, 4.0);
    canvas.translate(-2.0, -2.0);
    canvas.save();
    _clipPath_overflowHiddenClip(canvas, size, Offset.zero & viewBox);
    canvas.save();
    canvas.scale(0.2, 0.2);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 4.0;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 20.0, 20.0), paint);
    }
    canvas.restore();
    canvas.restore();
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
              fontSize: 10.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'Mixed Properties')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            90.0,
            270.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(30.0, 190.0)
        ..lineTo(80.0, 190.0)
        ..lineTo(80.0, 240.0)
        ..close();
      {
        final Paint fillPaint = Paint();
        {
          fillPaint.color = const Color(0xFFFFA500);
          fillPaint.style = PaintingStyle.fill;
        }
        final Paint strokePaint = Paint();
        {
          strokePaint.color = const Color(0xFF800080);
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 4.0;
        }
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, strokePaint);
        _marker_marker3(
          canvas,
          const Offset(30.0, 190.0),
          0.0,
          4.0,
          isStart: true,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker3(
          canvas,
          const Offset(80.0, 190.0),
          0.7853981633974483,
          4.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker3(
          canvas,
          const Offset(80.0, 240.0),
          2.748893571891069,
          4.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker3(
          canvas,
          const Offset(30.0, 190.0),
          -2.356194490192345,
          4.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
      }
    }
    canvas.save();
    canvas.translate(120.0, 0.0);
    {
      final Path path = Path()
        ..moveTo(30.0, 190.0)
        ..lineTo(80.0, 190.0)
        ..lineTo(80.0, 240.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFA500);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF800080);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 4.0;
        canvas.drawPath(path, paint);
      }
    }
    canvas.save();
    canvas.translate(30.0, 190.0);
    canvas.scale(4.0, 4.0);
    canvas.translate(-2.0, -2.0);
    canvas.save();
    _clipPath_overflowHiddenClip(canvas, size, Offset.zero & viewBox);
    canvas.save();
    canvas.scale(0.2, 0.2);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF008000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 20.0, 20.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 8.0;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 20.0, 20.0), paint);
    }
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(80.0, 190.0);
    canvas.scale(4.0, 4.0);
    canvas.translate(-2.0, -2.0);
    canvas.save();
    _clipPath_overflowHiddenClip(canvas, size, Offset.zero & viewBox);
    canvas.save();
    canvas.scale(0.2, 0.2);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF008000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 20.0, 20.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 8.0;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 20.0, 20.0), paint);
    }
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(80.0, 240.0);
    canvas.scale(4.0, 4.0);
    canvas.translate(-2.0, -2.0);
    canvas.save();
    _clipPath_overflowHiddenClip(canvas, size, Offset.zero & viewBox);
    canvas.save();
    canvas.scale(0.2, 0.2);
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF008000);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 20.0, 20.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 8.0;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 20.0, 20.0), paint);
    }
    canvas.restore();
    canvas.restore();
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
              fontSize: 10.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: 'Mixed Properties')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            340.0,
            270.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(270.0, 190.0)
        ..lineTo(320.0, 190.0)
        ..lineTo(320.0, 240.0)
        ..close();
      {
        final Paint fillPaint = Paint();
        {
          fillPaint.color = const Color(0xFFFFA500);
          fillPaint.style = PaintingStyle.fill;
        }
        final Paint strokePaint = Paint();
        {
          strokePaint.color = const Color(0xFF800080);
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 4.0;
        }
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, strokePaint);
        _marker_marker4(
          canvas,
          const Offset(270.0, 190.0),
          0.0,
          4.0,
          isStart: true,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker4(
          canvas,
          const Offset(320.0, 190.0),
          0.7853981633974483,
          4.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker4(
          canvas,
          const Offset(320.0, 240.0),
          2.748893571891069,
          4.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker4(
          canvas,
          const Offset(270.0, 190.0),
          -2.356194490192345,
          4.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
      }
    }
    canvas.save();
    canvas.translate(120.0, 0.0);
    {
      final Path path = Path()
        ..moveTo(270.0, 190.0)
        ..lineTo(320.0, 190.0)
        ..lineTo(320.0, 240.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFA500);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF800080);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 4.0;
        canvas.drawPath(path, paint);
      }
    }
    canvas.save();
    canvas.translate(270.0, 190.0);
    canvas.scale(4.0, 4.0);
    canvas.translate(-2.0, -2.0);
    canvas.save();
    _clipPath_overflowHiddenClip(canvas, size, Offset.zero & viewBox);
    canvas.save();
    canvas.scale(0.4, 0.4);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 4.0;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0), paint);
    }
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(320.0, 190.0);
    canvas.scale(4.0, 4.0);
    canvas.translate(-2.0, -2.0);
    canvas.save();
    _clipPath_overflowHiddenClip(canvas, size, Offset.zero & viewBox);
    canvas.save();
    canvas.scale(0.4, 0.4);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 4.0;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0), paint);
    }
    canvas.restore();
    canvas.restore();
    canvas.restore();
    canvas.save();
    canvas.translate(320.0, 240.0);
    canvas.scale(4.0, 4.0);
    canvas.translate(-2.0, -2.0);
    canvas.save();
    _clipPath_overflowHiddenClip(canvas, size, Offset.zero & viewBox);
    canvas.save();
    canvas.scale(0.4, 0.4);
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 4.0;
      canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 10.0, 10.0), paint);
    }
    canvas.restore();
    canvas.restore();
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
  bool shouldRepaint(covariant _$PaintingMarker02FPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
