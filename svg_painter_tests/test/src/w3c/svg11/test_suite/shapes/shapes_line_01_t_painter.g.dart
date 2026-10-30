// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shapes_line_01_t_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class ShapesLine01TPainterWidget extends StatelessWidget {
  const ShapesLine01TPainterWidget({
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
      label: '\$RCSfile: shapes-line-01-t.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$ShapesLine01TPainter(fit: fit),
      ),
    );
  }
}

class _$ShapesLine01TPainter extends CustomPainter {
  const _$ShapesLine01TPainter({this.fit = BoxFit.contain});

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

    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(37.5, 137.0),
        const Offset(112.5, 50.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFFF00);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 5.0;
      canvas.drawLine(
        const Offset(112.5, 137.0),
        const Offset(187.5, 50.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF008000);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 7.5;
      canvas.drawLine(
        const Offset(187.5, 137.0),
        const Offset(262.5, 50.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 10.0;
      canvas.drawLine(
        const Offset(262.5, 137.0),
        const Offset(337.5, 50.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF00FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 12.5;
      canvas.drawLine(
        const Offset(337.5, 137.0),
        const Offset(412.5, 50.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(170.0, 200.0),
        const Offset(220.0, 200.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(220.0, 200.0),
        const Offset(220.0, 250.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(220.0, 250.0),
        const Offset(270.0, 250.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(270.0, 250.0),
        const Offset(270.0, 200.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawLine(
        const Offset(270.0, 200.0),
        const Offset(320.0, 200.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 10.0;
      canvas.drawLine(
        const Offset(25.0, 200.0),
        const Offset(75.0, 200.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 10.0;
      canvas.drawLine(
        const Offset(75.0, 200.0),
        const Offset(75.0, 250.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 10.0;
      canvas.drawLine(
        const Offset(75.0, 250.0),
        const Offset(125.0, 250.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 10.0;
      canvas.drawLine(
        const Offset(125.0, 250.0),
        const Offset(125.0, 200.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 10.0;
      canvas.drawLine(
        const Offset(125.0, 200.0),
        const Offset(175.0, 200.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 10.0;
      canvas.drawLine(
        const Offset(370.0, 250.0),
        const Offset(420.0, 250.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF00FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 10.0;
      canvas.drawLine(
        const Offset(420.0, 200.0),
        const Offset(470.0, 200.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 10.0;
      canvas.drawLine(
        const Offset(320.0, 200.0),
        const Offset(370.0, 200.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF008000);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 10.0;
      canvas.drawLine(
        const Offset(370.0, 200.0),
        const Offset(370.0, 250.0),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFFA500);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 10.0;
      canvas.drawLine(
        const Offset(420.0, 250.0),
        const Offset(420.0, 200.0),
        paint,
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
              fontSize: 32.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'SVGFreeSansASCII',
              fontFamilyFallback: <String>['Roboto'],
            ),
            children: <InlineSpan>[TextSpan(text: '\$Revision: 1.5 \$')],
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
  bool shouldRepaint(covariant _$ShapesLine01TPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
