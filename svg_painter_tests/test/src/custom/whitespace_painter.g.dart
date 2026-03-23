// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whitespace_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class WhitespacePainterWidget extends StatelessWidget {
  const WhitespacePainterWidget({
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
      size: Size(width ?? 300.0, height ?? 60.0),
      painter: _$WhitespacePainter(fit: fit),
    );
  }
}

class _$WhitespacePainter extends CustomPainter {
  const _$WhitespacePainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(300.0, 60.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(300.0, 60.0),
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
      paint.style = PaintingStyle.fill;
      {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'Roboto Mono',
            ),
            children: <InlineSpan>[
              TextSpan(text: 'Preserve:          (10 spaces)'),
            ],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            10.0,
            20.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
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
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontFamily: 'Roboto',
            ),
            children: <InlineSpan>[
              TextSpan(text: 'Collapse: multiple spaces and tabs.'),
            ],
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(
          canvas,
          Offset(
            10.0,
            50.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
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
  bool shouldRepaint(covariant _$WhitespacePainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
