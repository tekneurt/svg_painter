// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offset_component_transfer_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class OffsetComponentTransferPainterWidget extends StatelessWidget {
  const OffsetComponentTransferPainterWidget({
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
      size: Size(width ?? 200.0, height ?? 40.0),
      painter: _$OffsetComponentTransferPainter(fit: fit),
    );
  }
}

class _$OffsetComponentTransferPainter extends CustomPainter {
  const _$OffsetComponentTransferPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(200.0, 40.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(200.0, 40.0),
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

    void _filter_gamma_filter(Canvas canvas, void Function() drawGraphic) {
      canvas.saveLayer(
        null,
        Paint()
          ..colorFilter = const ColorFilter.matrix(<double>[
            2.0,
            0.0,
            0.0,
            0.0,
            51.0,
            0.0,
            2.0,
            0.0,
            0.0,
            76.5,
            0.0,
            0.0,
            2.0,
            0.0,
            127.5,
            0.0,
            0.0,
            0.0,
            1.0,
            0.0,
          ]),
      );
      drawGraphic();
      canvas.restore();
    }

    _filter_gamma_filter(canvas, () {
      {
        final Paint paint = Paint();
        paint.color = Colors.black;
        paint.style = PaintingStyle.fill;
        {
          final TextPainter tp = TextPainter(
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                fontFamily: 'Tinos',
                package: 'svg_painter',
              ),
              children: <InlineSpan>[TextSpan(text: 'GammaFunc')],
            ),
            textDirection: TextDirection.ltr,
          )..layout();
          tp.paint(
            canvas,
            Offset(
              60.0,
              25.0 -
                  tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
            ),
          );
        }
      }
    });
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
  bool shouldRepaint(covariant _$OffsetComponentTransferPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
