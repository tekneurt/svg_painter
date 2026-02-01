// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class MdnTextExamplePainterWidget extends StatelessWidget {
  const MdnTextExamplePainterWidget({
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
      size: Size(width ?? 240.0, height ?? 80.0),
      painter: _$MdnTextExamplePainter(fit: fit),
    );
  }
}

class _$MdnTextExamplePainter extends CustomPainter {
  const _$MdnTextExamplePainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(240.0, 80.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(240.0, 80.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 240.0, 80.0));

    {
      {
        final TextSpan span = TextSpan(
          text: '''My''',
          style: TextStyle(
            color: const Color(0xFF000000),
            fontSize: 13.0,
            fontFamily: 'Roboto',
            fontStyle: FontStyle.italic,
          ),
        );
        final TextPainter tp = TextPainter(
          text: span,
          textDirection: TextDirection.ltr,
        );
        tp.layout();
        tp.paint(
          canvas,
          Offset(
            20.0,
            35.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      {
        final TextSpan span = TextSpan(
          text: '''cat''',
          style: TextStyle(
            color: const Color(0xFF000000),
            fontSize: 30.0,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        );
        final TextPainter tp = TextPainter(
          text: span,
          textDirection: TextDirection.ltr,
        );
        tp.layout();
        tp.paint(
          canvas,
          Offset(
            40.0,
            35.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      {
        final TextSpan span = TextSpan(
          text: '''is''',
          style: TextStyle(
            color: const Color(0xFF000000),
            fontSize: 13.0,
            fontFamily: 'Roboto',
            fontStyle: FontStyle.italic,
          ),
        );
        final TextPainter tp = TextPainter(
          text: span,
          textDirection: TextDirection.ltr,
        );
        tp.layout();
        tp.paint(
          canvas,
          Offset(
            55.0,
            55.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    {
      {
        final TextSpan span = TextSpan(
          text: '''Grumpy!''',
          style: TextStyle(
            color: const Color(0xFFFF0000),
            fontSize: 40.0,
            fontFamily: 'Noto Serif',
            fontStyle: FontStyle.italic,
          ),
        );
        final TextPainter tp = TextPainter(
          text: span,
          textDirection: TextDirection.ltr,
        );
        tp.layout();
        tp.paint(
          canvas,
          Offset(
            65.0,
            55.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
          ),
        );
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$MdnTextExamplePainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
