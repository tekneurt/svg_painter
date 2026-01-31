// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_inheritance_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class GroupInheritancePainterWidget extends StatelessWidget {
  const GroupInheritancePainterWidget({
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.group1Fill,
    this.group2Fill,
  });

  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final Color? group1Fill;
  final Color? group2Fill;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width ?? 188.9763779527559, height ?? 188.9763779527559),
      painter: _$GroupInheritancePainter(
        fit: fit,
        group1Fill: group1Fill,
        group2Fill: group2Fill,
      ),
    );
  }
}

class _$GroupInheritancePainter extends CustomPainter {
  const _$GroupInheritancePainter({
    this.fit = BoxFit.contain,
    this.group1Fill,
    this.group2Fill,
  });

  final BoxFit fit;
  final Color? group1Fill;
  final Color? group2Fill;

  Size get viewBox => const Size(188.9763779527559, 188.9763779527559);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(188.9763779527559, 188.9763779527559),
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
    canvas.clipRect(Rect.fromLTWH(0, 0, 188.9763779527559, 188.9763779527559));

    {
      {
        {
          final Paint paint = Paint();
          final Color? inheritedFill = group1Fill;
          if (inheritedFill == null) {
            paint.color = const Color(0xFFFF0000);
          } else {
            paint.color = inheritedFill;
          }
          paint.style = PaintingStyle.fill;
          canvas.drawRect(
            Rect.fromLTWH(
              37.79527559055118,
              37.79527559055118,
              37.79527559055118,
              37.79527559055118,
            ),
            paint,
          );
        }
      }
      {
        {
          final Paint paint = Paint();
          final Color? inheritedFill = group1Fill;
          if (inheritedFill == null) {
            paint.color = const Color(0xFFFF0000);
          } else {
            paint.color = inheritedFill;
          }
          paint.style = PaintingStyle.fill;
          canvas.drawRect(
            Rect.fromLTWH(
              113.38582677165354,
              37.79527559055118,
              37.79527559055118,
              37.79527559055118,
            ),
            paint,
          );
        }
      }
    }
    {
      {
        {
          final Paint paint = Paint();
          final Color? inheritedFill = group2Fill;
          if (inheritedFill == null) {
            paint.color = const Color(0xFF0000FF);
          } else {
            paint.color = inheritedFill;
          }
          paint.style = PaintingStyle.fill;
          canvas.drawRect(
            Rect.fromLTWH(
              37.79527559055118,
              113.38582677165354,
              37.79527559055118,
              37.79527559055118,
            ),
            paint,
          );
        }
      }
      {
        {
          final Paint paint = Paint();
          final Color? inheritedFill = group2Fill;
          if (inheritedFill == null) {
            paint.color = const Color(0xFF0000FF);
          } else {
            paint.color = inheritedFill;
          }
          paint.style = PaintingStyle.fill;
          canvas.drawRect(
            Rect.fromLTWH(
              113.38582677165354,
              113.38582677165354,
              37.79527559055118,
              37.79527559055118,
            ),
            paint,
          );
        }
      }
    }
    {
      {
        final Paint paint = Paint();
        paint.color = const Color(0xFF0000FF);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 0.7559055118110236;
        canvas.drawRect(
          Rect.fromLTWH(
            0.3779527559055118,
            0.3779527559055118,
            188.2204724409449,
            188.2204724409449,
          ),
          paint,
        );
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _$GroupInheritancePainter oldDelegate) {
    if (fit == oldDelegate.fit &&
        group1Fill == oldDelegate.group1Fill &&
        group2Fill == oldDelegate.group2Fill) {
      return false;
    } else {
      return true;
    }
  }
}
