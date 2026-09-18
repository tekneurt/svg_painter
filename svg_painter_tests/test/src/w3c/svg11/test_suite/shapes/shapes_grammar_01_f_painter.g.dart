// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shapes_grammar_01_f_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class ShapesGrammar01FPainterWidget extends StatelessWidget {
  const ShapesGrammar01FPainterWidget({
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
      label: '\$RCSfile: shapes-grammar-01-f.svg,v \$',
      child: CustomPaint(
        size: Size(width ?? 480.0, height ?? 360.0),
        painter: _$ShapesGrammar01FPainter(fit: fit),
      ),
    );
  }
}

class _$ShapesGrammar01FPainter extends CustomPainter {
  const _$ShapesGrammar01FPainter({this.fit = BoxFit.contain});

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

    canvas.save();
    canvas.translate(0.0, 400.0);
    {
      final Path path = Path()
        ..moveTo(270.0, -225.0)
        ..lineTo(300.0, -245.0)
        ..lineTo(320.0, -225.0)
        ..lineTo(340.0, -245.0)
        ..lineTo(280.0, -280.0)
        ..lineTo(390.0, -280.0)
        ..lineTo(420.0, -240.0)
        ..lineTo(280.0, -185.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF339966);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF007700);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 8.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(179.0, -185.0)
        ..lineTo(218.0, -203.0)
        ..lineTo(228.0, -245.0)
        ..lineTo(202.0, -279.0)
        ..lineTo(159.0, -280.0)
        ..lineTo(131.0, -247.0)
        ..lineTo(139.0, -205.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF55FF99);
        paint.style = PaintingStyle.fill;
        canvas.drawPath(path, paint);
      }
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF007700);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 8.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(270.0, -225.0)
        ..lineTo(300.0, -245.0)
        ..lineTo(320.0, -225.0)
        ..lineTo(340.0, -245.0)
        ..lineTo(280.0, -280.0)
        ..lineTo(390.0, -280.0)
        ..lineTo(420.0, -240.0)
        ..lineTo(280.0, -185.0);
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF33CC66);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 3.0;
        canvas.drawPath(path, paint);
      }
    }
    {
      final Path path = Path()
        ..moveTo(179.0, -185.0)
        ..lineTo(218.0, -203.0)
        ..lineTo(228.0, -245.0)
        ..lineTo(202.0, -279.0)
        ..lineTo(159.0, -280.0)
        ..lineTo(131.0, -247.0)
        ..lineTo(139.0, -205.0)
        ..close();
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF33CC66);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 3.0;
        canvas.drawPath(path, paint);
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
              fontFamily: 'SVGFreeSansASCII,sans-serif',
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
  bool shouldRepaint(covariant _$ShapesGrammar01FPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
