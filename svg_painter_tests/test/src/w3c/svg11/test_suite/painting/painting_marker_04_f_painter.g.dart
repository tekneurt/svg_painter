// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'painting_marker_04_f_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class PaintingMarker04FPainterWidget extends StatelessWidget {
  const PaintingMarker04FPainterWidget({
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
      label: '\$RCSfile: painting-marker-04-f.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$PaintingMarker04FPainter(fit: fit),
      ),
    );
  }
}

class _$PaintingMarker04FPainter extends CustomPainter {
  const _$PaintingMarker04FPainter({this.fit = BoxFit.contain});

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
      canvas.translate(-2.5, -2.5);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 5.0, 5.0));
      canvas.scale(0.05, 0.05);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF4169E1);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 100.0, 100.0), paint);
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
      canvas.translate(-7.5, -7.5);
      canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 15.0, 15.0));
      canvas.scale(0.075, 0.075);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFF0000);
        paint.style = PaintingStyle.fill;
        canvas.drawRect(Rect.fromLTWH(0.0, 0.0, 200.0, 200.0), paint);
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
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: '\'marker\' attribute test')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            240.0 - tp.width / 2.0,
            28.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF228B22);
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: const Color(0xFF228B22),
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: '\'marker\' attribute')],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            240.0 - tp.width / 2.0,
            70.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.translate(50.0, 20.0);
    {
      final Path path = Path()
        ..moveTo(10.0, 60.0)
        ..quadraticBezierTo(90.0, 60.0, 90.0, 140.0)
        ..quadraticBezierTo(10.0, 140.0, 10.0, 60.0)
        ..close()
        ..moveTo(10.0, 140.0)
        ..quadraticBezierTo(10.0, 60.0, 90.0, 60.0)
        ..quadraticBezierTo(90.0, 140.0, 10.0, 140.0)
        ..close()
        ..moveTo(50.0, 70.0)
        ..lineTo(80.0, 100.0)
        ..lineTo(50.0, 130.0)
        ..lineTo(20.0, 100.0)
        ..close();
      path.fillType = PathFillType.evenOdd;
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFD700);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(100.0, 60.0)
        ..lineTo(120.0, 140.0)
        ..lineTo(140.0, 60.0)
        ..lineTo(160.0, 140.0)
        ..lineTo(180.0, 60.0)
        ..lineTo(180.0, 100.0)
        ..lineTo(100.0, 100.0)
        ..close();
      path.fillType = PathFillType.evenOdd;
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFD700);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(190.0, 60.0)
        ..lineTo(210.0, 140.0)
        ..lineTo(230.0, 60.0)
        ..lineTo(250.0, 140.0)
        ..lineTo(270.0, 60.0)
        ..lineTo(270.0, 100.0)
        ..lineTo(190.0, 100.0);
      path.fillType = PathFillType.evenOdd;
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFFFFD700);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(280.0, 60.0),
        const Offset(370.0, 140.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(370.0, 60.0),
        const Offset(280.0, 140.0),
        paint,
      );
    }
    canvas.restore();
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF228B22);
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: const Color(0xFF228B22),
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[
              TextSpan(
                text:
                    '\'marker-start\', \'marker-mid\' & \'marker-end\' attributes',
              ),
            ],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            240.0 - tp.width / 2.0,
            200.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.save();
    canvas.translate(50.0, 150.0);
    {
      final Path path = Path()
        ..moveTo(10.0, 60.0)
        ..quadraticBezierTo(90.0, 60.0, 90.0, 140.0)
        ..quadraticBezierTo(10.0, 140.0, 10.0, 60.0)
        ..close()
        ..moveTo(10.0, 140.0)
        ..quadraticBezierTo(10.0, 60.0, 90.0, 60.0)
        ..quadraticBezierTo(90.0, 140.0, 10.0, 140.0)
        ..close()
        ..moveTo(50.0, 70.0)
        ..lineTo(80.0, 100.0)
        ..lineTo(50.0, 130.0)
        ..lineTo(20.0, 100.0)
        ..close();
      path.fillType = PathFillType.evenOdd;
      {
        final Paint fillPaint = Paint();
        {
          fillPaint.color = const Color(0xFFFFD700);
          fillPaint.style = PaintingStyle.fill;
        }
        final Paint strokePaint = Paint();
        {
          strokePaint.color = Colors.black;
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 1.0;
        }
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, strokePaint);
        _marker_marker1(
          canvas,
          const Offset(10.0, 60.0),
          0.0,
          1.0,
          isStart: true,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(90.0, 140.0),
          2.356194490192345,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(10.0, 60.0),
          -0.7853981633974483,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(10.0, 140.0),
          -0.7853981633974483,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(90.0, 60.0),
          0.7853981633974483,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(10.0, 140.0),
          4.71238898038469,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(50.0, 70.0),
          0.39269908169872414,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(80.0, 100.0),
          1.5707963267948966,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(50.0, 130.0),
          3.141592653589793,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(20.0, 100.0),
          -1.5707963267948966,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(50.0, 70.0),
          -0.7853981633974483,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(100.0, 60.0)
        ..lineTo(120.0, 140.0)
        ..lineTo(140.0, 60.0)
        ..lineTo(160.0, 140.0)
        ..lineTo(180.0, 60.0)
        ..lineTo(180.0, 100.0)
        ..lineTo(100.0, 100.0)
        ..close();
      path.fillType = PathFillType.evenOdd;
      {
        final Paint fillPaint = Paint();
        {
          fillPaint.color = const Color(0xFFFFD700);
          fillPaint.style = PaintingStyle.fill;
        }
        final Paint strokePaint = Paint();
        {
          strokePaint.color = Colors.black;
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 1.0;
        }
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, strokePaint);
        _marker_marker1(
          canvas,
          const Offset(100.0, 60.0),
          -0.12248933156343217,
          1.0,
          isStart: true,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(120.0, 140.0),
          0.0,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(140.0, 60.0),
          0.0,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(160.0, 140.0),
          0.0,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(180.0, 60.0),
          0.12248933156343217,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(180.0, 100.0),
          2.356194490192345,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(100.0, 100.0),
          -2.356194490192345,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
      }
    }
    {
      final Path path = Path()
        ..moveTo(190.0, 60.0)
        ..lineTo(210.0, 140.0)
        ..lineTo(230.0, 60.0)
        ..lineTo(250.0, 140.0)
        ..lineTo(270.0, 60.0)
        ..lineTo(270.0, 100.0)
        ..lineTo(190.0, 100.0);
      path.fillType = PathFillType.evenOdd;
      {
        final Paint fillPaint = Paint();
        {
          fillPaint.color = const Color(0xFFFFD700);
          fillPaint.style = PaintingStyle.fill;
        }
        final Paint strokePaint = Paint();
        {
          strokePaint.color = Colors.black;
          strokePaint.style = PaintingStyle.stroke;
          strokePaint.strokeWidth = 1.0;
        }
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, strokePaint);
        _marker_marker1(
          canvas,
          const Offset(190.0, 60.0),
          1.3258176636680326,
          1.0,
          isStart: true,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(210.0, 140.0),
          0.0,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(230.0, 60.0),
          0.0,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(250.0, 140.0),
          0.0,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(270.0, 60.0),
          0.12248933156343217,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(270.0, 100.0),
          2.356194490192345,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
        _marker_marker1(
          canvas,
          const Offset(190.0, 100.0),
          3.141592653589793,
          1.0,
          contextFill: fillPaint,
          contextStroke: strokePaint,
        );
      }
    }
    {
      final Paint strokePaint = Paint();
      {
        strokePaint.color = Colors.black;
        strokePaint.style = PaintingStyle.stroke;
        strokePaint.strokeWidth = 1.0;
      }
      canvas.drawLine(
        const Offset(280.0, 60.0),
        const Offset(370.0, 140.0),
        strokePaint,
      );
      _marker_marker1(
        canvas,
        const Offset(280.0, 60.0),
        0.7266423406817256,
        1.0,
        isStart: true,
        contextStroke: strokePaint,
      );
      _marker_marker1(
        canvas,
        const Offset(370.0, 140.0),
        0.7266423406817256,
        1.0,
        contextStroke: strokePaint,
      );
    }
    {
      final Paint strokePaint = Paint();
      {
        strokePaint.color = Colors.black;
        strokePaint.style = PaintingStyle.stroke;
        strokePaint.strokeWidth = 1.0;
      }
      canvas.drawLine(
        const Offset(370.0, 60.0),
        const Offset(280.0, 140.0),
        strokePaint,
      );
      _marker_marker1(
        canvas,
        const Offset(370.0, 60.0),
        2.4149503129080676,
        1.0,
        isStart: true,
        contextStroke: strokePaint,
      );
      _marker_marker1(
        canvas,
        const Offset(280.0, 140.0),
        2.4149503129080676,
        1.0,
        contextStroke: strokePaint,
      );
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
  bool shouldRepaint(covariant _$PaintingMarker04FPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
