// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class _$PathPainter extends CustomPainter {
  const _$PathPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(100.0, 100.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(100.0, 100.0),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 100.0, 100.0));

    {
      // Path
      {
        final Path path = Path();
        path.moveTo(10.0, 30.0);
        path.arcToPoint(
          const Offset(50.0, 30.0),
          radius: const Radius.elliptical(20.0, 20.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        );
        path.arcToPoint(
          const Offset(90.0, 30.0),
          radius: const Radius.elliptical(20.0, 20.0),
          rotation: 0.0,
          largeArc: false,
          clockwise: true,
        );
        path.quadraticBezierTo(90.0, 60.0, 50.0, 90.0);
        path.quadraticBezierTo(10.0, 60.0, 10.0, 30.0);
        path.close();
        {
          final Paint paint = Paint();
          paint.color = Colors.black;
          paint.style = PaintingStyle.fill;
          canvas.drawPath(path, paint);
        }
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$PathPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
