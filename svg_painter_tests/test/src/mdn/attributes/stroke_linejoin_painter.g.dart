// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stroke_linejoin_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class _$StrokeLinejoinPainter extends CustomPainter {
  const _$StrokeLinejoinPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(18.0, 12.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(18.0, 12.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 18.0, 12.0));

    {
      // Path
      {
        final Path path = Path();
        path.moveTo(1.0, 5.0);
        path.arcToPoint(
          const Offset(3.0, 2.0),
          radius: const Radius.elliptical(2.0, 2.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: false,
        );
        path.arcToPoint(
          const Offset(5.0, 5.5),
          radius: const Radius.elliptical(3.0, 3.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        );
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFF000000);
          paint.style = PaintingStyle.stroke;
          paint.strokeWidth = 1.0;
          canvas.drawPath(path, paint);
        }
      }
    }
    {
      // Path
      {
        final Path path = Path();
        path.moveTo(7.0, 5.0);
        path.arcToPoint(
          const Offset(9.0, 2.0),
          radius: const Radius.elliptical(2.0, 2.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: false,
        );
        path.arcToPoint(
          const Offset(11.0, 5.5),
          radius: const Radius.elliptical(3.0, 3.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        );
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFF000000);
          paint.style = PaintingStyle.stroke;
          paint.strokeWidth = 1.0;
          paint.strokeJoin = StrokeJoin.round;
          canvas.drawPath(path, paint);
        }
      }
    }
    {
      // Path
      {
        final Path path = Path();
        path.moveTo(13.0, 5.0);
        path.arcToPoint(
          const Offset(15.0, 2.0),
          radius: const Radius.elliptical(2.0, 2.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: false,
        );
        path.arcToPoint(
          const Offset(17.0, 5.5),
          radius: const Radius.elliptical(3.0, 3.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        );
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFF000000);
          paint.style = PaintingStyle.stroke;
          paint.strokeWidth = 1.0;
          paint.strokeJoin = StrokeJoin.bevel;
          canvas.drawPath(path, paint);
        }
      }
    }
    {
      // Path
      {
        final Path path = Path();
        path.moveTo(3.0, 11.0);
        path.arcToPoint(
          const Offset(5.0, 8.0),
          radius: const Radius.elliptical(2.0, 2.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: false,
        );
        path.arcToPoint(
          const Offset(7.0, 11.5),
          radius: const Radius.elliptical(3.0, 3.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        );
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFF000000);
          paint.style = PaintingStyle.stroke;
          paint.strokeWidth = 1.0;
          canvas.drawPath(path, paint);
        }
      }
    }
    {
      // Path
      {
        final Path path = Path();
        path.moveTo(9.0, 11.0);
        path.arcToPoint(
          const Offset(11.0, 8.0),
          radius: const Radius.elliptical(2.0, 2.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: false,
        );
        path.arcToPoint(
          const Offset(13.0, 11.5),
          radius: const Radius.elliptical(3.0, 3.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        );
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFF000000);
          paint.style = PaintingStyle.stroke;
          paint.strokeWidth = 1.0;
          canvas.drawPath(path, paint);
        }
      }
    }
    {
      {
        // Path
        {
          final Path path = Path();
          path.moveTo(1.0, 5.0);
          path.arcToPoint(
            const Offset(3.0, 2.0),
            radius: const Radius.elliptical(2.0, 2.0),
            rotation: 0.0,
            largeArc: false,
            clockwise: false,
          );
          path.arcToPoint(
            const Offset(5.0, 5.5),
            radius: const Radius.elliptical(3.0, 3.0),
            rotation: 0.0,
            largeArc: false,
            clockwise: true,
          );
          {
            final Paint paint = Paint();
            paint.color = const Color(0xFFFFC0CB);
            paint.style = PaintingStyle.stroke;
            paint.strokeWidth = 0.05;
            canvas.drawPath(path, paint);
          }
        }
      }
      {
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFFFFC0CB);
          paint.style = PaintingStyle.fill;
          canvas.drawCircle(const Offset(1.0, 5.0), 0.1, paint);
        }
      }
      {
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFFFFC0CB);
          paint.style = PaintingStyle.fill;
          canvas.drawCircle(const Offset(3.0, 2.0), 0.1, paint);
        }
      }
      {
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFFFFC0CB);
          paint.style = PaintingStyle.fill;
          canvas.drawCircle(const Offset(5.0, 5.5), 0.1, paint);
        }
      }
    }
    {
      {
        // Path
        {
          final Path path = Path();
          path.moveTo(7.0, 5.0);
          path.arcToPoint(
            const Offset(9.0, 2.0),
            radius: const Radius.elliptical(2.0, 2.0),
            rotation: 0.0,
            largeArc: false,
            clockwise: false,
          );
          path.arcToPoint(
            const Offset(11.0, 5.5),
            radius: const Radius.elliptical(3.0, 3.0),
            rotation: 0.0,
            largeArc: false,
            clockwise: true,
          );
          {
            final Paint paint = Paint();
            paint.color = const Color(0xFFFFC0CB);
            paint.style = PaintingStyle.stroke;
            paint.strokeWidth = 0.05;
            canvas.drawPath(path, paint);
          }
        }
      }
      {
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFFFFC0CB);
          paint.style = PaintingStyle.fill;
          canvas.drawCircle(const Offset(7.0, 5.0), 0.1, paint);
        }
      }
      {
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFFFFC0CB);
          paint.style = PaintingStyle.fill;
          canvas.drawCircle(const Offset(9.0, 2.0), 0.1, paint);
        }
      }
      {
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFFFFC0CB);
          paint.style = PaintingStyle.fill;
          canvas.drawCircle(const Offset(11.0, 5.5), 0.1, paint);
        }
      }
    }
    {
      {
        // Path
        {
          final Path path = Path();
          path.moveTo(13.0, 5.0);
          path.arcToPoint(
            const Offset(15.0, 2.0),
            radius: const Radius.elliptical(2.0, 2.0),
            rotation: 0.0,
            largeArc: false,
            clockwise: false,
          );
          path.arcToPoint(
            const Offset(17.0, 5.5),
            radius: const Radius.elliptical(3.0, 3.0),
            rotation: 0.0,
            largeArc: false,
            clockwise: true,
          );
          {
            final Paint paint = Paint();
            paint.color = const Color(0xFFFFC0CB);
            paint.style = PaintingStyle.stroke;
            paint.strokeWidth = 0.05;
            canvas.drawPath(path, paint);
          }
        }
      }
      {
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFFFFC0CB);
          paint.style = PaintingStyle.fill;
          canvas.drawCircle(const Offset(13.0, 5.0), 0.1, paint);
        }
      }
      {
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFFFFC0CB);
          paint.style = PaintingStyle.fill;
          canvas.drawCircle(const Offset(15.0, 2.0), 0.1, paint);
        }
      }
      {
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFFFFC0CB);
          paint.style = PaintingStyle.fill;
          canvas.drawCircle(const Offset(17.0, 5.5), 0.1, paint);
        }
      }
    }
    {
      {
        // Path
        {
          final Path path = Path();
          path.moveTo(3.0, 11.0);
          path.arcToPoint(
            const Offset(5.0, 8.0),
            radius: const Radius.elliptical(2.0, 2.0),
            rotation: 0.0,
            largeArc: false,
            clockwise: false,
          );
          path.arcToPoint(
            const Offset(7.0, 11.5),
            radius: const Radius.elliptical(3.0, 3.0),
            rotation: 0.0,
            largeArc: false,
            clockwise: true,
          );
          {
            final Paint paint = Paint();
            paint.color = const Color(0xFFFFC0CB);
            paint.style = PaintingStyle.stroke;
            paint.strokeWidth = 0.05;
            canvas.drawPath(path, paint);
          }
        }
      }
      {
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFFFFC0CB);
          paint.style = PaintingStyle.fill;
          canvas.drawCircle(const Offset(3.0, 11.0), 0.1, paint);
        }
      }
      {
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFFFFC0CB);
          paint.style = PaintingStyle.fill;
          canvas.drawCircle(const Offset(5.0, 8.0), 0.1, paint);
        }
      }
      {
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFFFFC0CB);
          paint.style = PaintingStyle.fill;
          canvas.drawCircle(const Offset(7.0, 11.5), 0.1, paint);
        }
      }
    }
    {
      {
        // Path
        {
          final Path path = Path();
          path.moveTo(9.0, 11.0);
          path.arcToPoint(
            const Offset(11.0, 8.0),
            radius: const Radius.elliptical(2.0, 2.0),
            rotation: 0.0,
            largeArc: false,
            clockwise: false,
          );
          path.arcToPoint(
            const Offset(13.0, 11.5),
            radius: const Radius.elliptical(3.0, 3.0),
            rotation: 0.0,
            largeArc: false,
            clockwise: true,
          );
          {
            final Paint paint = Paint();
            paint.color = const Color(0xFFFFC0CB);
            paint.style = PaintingStyle.stroke;
            paint.strokeWidth = 0.05;
            canvas.drawPath(path, paint);
          }
        }
      }
      {
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFFFFC0CB);
          paint.style = PaintingStyle.fill;
          canvas.drawCircle(const Offset(9.0, 11.0), 0.1, paint);
        }
      }
      {
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFFFFC0CB);
          paint.style = PaintingStyle.fill;
          canvas.drawCircle(const Offset(11.0, 8.0), 0.1, paint);
        }
      }
      {
        {
          final Paint paint = Paint();
          paint.color = const Color(0xFFFFC0CB);
          paint.style = PaintingStyle.fill;
          canvas.drawCircle(const Offset(13.0, 11.5), 0.1, paint);
        }
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$StrokeLinejoinPainter oldDelegate) {
    return fit != oldDelegate.fit;
  }
}
