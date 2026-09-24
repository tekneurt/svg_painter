// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shapes_rect_01_t_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class ShapesRect01TPainterWidget extends StatelessWidget {
  const ShapesRect01TPainterWidget({
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
      label: '\$RCSfile: shapes-rect-01-t.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$ShapesRect01TPainter(fit: fit),
      ),
    );
  }
}

class _$ShapesRect01TPainter extends CustomPainter {
  const _$ShapesRect01TPainter({this.fit = BoxFit.contain});

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
      canvas.drawRect(Rect.fromLTWH(30.0, 46.0, 50.0, 80.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF00FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(130.0, 46.0, 50.0, 80.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = Colors.black;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1.0;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(250.0, 46.0, 50.0, 80.0),
          const Radius.elliptical(25.0, 30.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFFFF00FF);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(350.0, 46.0, 50.0, 80.0),
          const Radius.elliptical(25.0, 30.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 8.0;
      canvas.drawRect(Rect.fromLTWH(30.0, 196.0, 50.0, 80.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(130.0, 196.0, 50.0, 80.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 8.0;
      canvas.drawRect(Rect.fromLTWH(130.0, 196.0, 50.0, 80.0), paint);
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF0000FF);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 8.0;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(250.0, 196.0, 50.0, 80.0),
          const Radius.elliptical(25.0, 40.0),
        ),
        paint,
      );
    }
    {
      final Paint paint = Paint();
      paint.color = const Color(0xFF00FF00);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(350.0, 196.0, 50.0, 80.0),
          const Radius.elliptical(25.0, 40.0),
        ),
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
            children: <InlineSpan>[TextSpan(text: '\$Revision: 1.6 \$')],
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
  bool shouldRepaint(covariant _$ShapesRect01TPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
