// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_polygon01_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class ExamplePolygon01PainterWidget extends StatelessWidget {
  const ExamplePolygon01PainterWidget({
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
      size: Size(width ?? 453.54330708661416, height ?? 151.1811023622047),
      painter: _$ExamplePolygon01Painter(fit: fit),
    );
  }
}

class _$ExamplePolygon01Painter extends CustomPainter {
  const _$ExamplePolygon01Painter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(453.54330708661416, 151.1811023622047);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(453.54330708661416, 151.1811023622047),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 453.54330708661416, 151.1811023622047));

    {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 0.7559055118110235;
        canvas.drawRect(
          Rect.fromLTWH(
            0.3779527559055118,
            0.3779527559055118,
            452.78740157480314,
            150.4251968503937,
          ),
          paint,
        );
      }
    }
    {
      {
        final Path path = Path();
        path.addPolygon([
          const Offset(132.28346456692913, 28.346456692913385),
          const Offset(143.24409448818898, 60.8503937007874),
          const Offset(177.25984251968504, 60.8503937007874),
          const Offset(150.04724409448818, 81.25984251968504),
          const Offset(159.8740157480315, 113.76377952755905),
          const Offset(132.28346456692913, 94.48818897637796),
          const Offset(104.69291338582677, 113.76377952755905),
          const Offset(114.51968503937007, 81.25984251968504),
          const Offset(87.30708661417323, 60.8503937007874),
          const Offset(121.32283464566929, 60.8503937007874),
        ], true);
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFFFF0000);
          paint.style = PaintingStyle.fill;
          canvas.drawPath(path, paint);
        }
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFF0000FF);
          paint.style = PaintingStyle.stroke;
          paint.strokeWidth = 3.7795275590551176;
          canvas.drawPath(path, paint);
        }
      }
    }
    {
      {
        final Path path = Path();
        path.addPolygon([
          const Offset(321.25984251968504, 28.346456692913385),
          const Offset(362.0787401574803, 51.968503937007874),
          const Offset(362.0787401574803, 99.21259842519684),
          const Offset(321.25984251968504, 122.83464566929133),
          const Offset(280.4409448818898, 99.25039370078741),
          const Offset(280.4409448818898, 51.968503937007874),
        ], true);
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFF00FF00);
          paint.style = PaintingStyle.fill;
          canvas.drawPath(path, paint);
        }
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFF0000FF);
          paint.style = PaintingStyle.stroke;
          paint.strokeWidth = 3.7795275590551176;
          canvas.drawPath(path, paint);
        }
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$ExamplePolygon01Painter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
