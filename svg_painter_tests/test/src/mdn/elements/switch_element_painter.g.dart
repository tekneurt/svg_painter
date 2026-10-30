// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'switch_element_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package

class SwitchElementPainterWidget extends StatelessWidget {
  const SwitchElementPainterWidget({
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
      size: Size(width ?? 100.0, height ?? 50.0),
      painter: _$SwitchElementPainter(fit: fit),
    );
  }
}

class _$SwitchElementPainter extends CustomPainter {
  const _$SwitchElementPainter({this.fit = BoxFit.contain});

  final BoxFit fit;

  Size get viewBox => const Size(100.0, 50.0);

  @override
  void paint(Canvas canvas, Size size) {
    final FittedSizes fittedSizes = applyBoxFit(
      fit,
      const Size(100.0, 50.0),
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
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, 100.0, 50.0));
    canvas.save();
    canvas.translate(-0.0, 20.0);
    final String currentLocale = ui.PlatformDispatcher.instance.locale
        .toLanguageTag()
        .toLowerCase();
    if (currentLocale == 'ar' ||
        currentLocale.startsWith('ar-') ||
        'ar'.startsWith('$currentLocale-')) {
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
              children: <InlineSpan>[TextSpan(text: 'مرحبا')],
            ),
            textDirection: TextDirection.ltr,
          )..layout();
          tp.paint(
            canvas,
            Offset(
              0.0,
              0.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
            ),
          );
        }
      }
    } else if (currentLocale == 'de' ||
        currentLocale.startsWith('de-') ||
        'de'.startsWith('$currentLocale-') ||
        currentLocale == 'nl' ||
        currentLocale.startsWith('nl-') ||
        'nl'.startsWith('$currentLocale-')) {
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
              children: <InlineSpan>[TextSpan(text: 'Hallo!')],
            ),
            textDirection: TextDirection.ltr,
          )..layout();
          tp.paint(
            canvas,
            Offset(
              0.0,
              0.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
            ),
          );
        }
      }
    } else if (currentLocale == 'en-us' ||
        currentLocale.startsWith('en-us-') ||
        'en-us'.startsWith('$currentLocale-')) {
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
              children: <InlineSpan>[TextSpan(text: 'Howdy!')],
            ),
            textDirection: TextDirection.ltr,
          )..layout();
          tp.paint(
            canvas,
            Offset(
              0.0,
              0.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
            ),
          );
        }
      }
    } else if (currentLocale == 'en-gb' ||
        currentLocale.startsWith('en-gb-') ||
        'en-gb'.startsWith('$currentLocale-')) {
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
              children: <InlineSpan>[TextSpan(text: 'Wotcha!')],
            ),
            textDirection: TextDirection.ltr,
          )..layout();
          tp.paint(
            canvas,
            Offset(
              0.0,
              0.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
            ),
          );
        }
      }
    } else if (currentLocale == 'en-au' ||
        currentLocale.startsWith('en-au-') ||
        'en-au'.startsWith('$currentLocale-')) {
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
              children: <InlineSpan>[TextSpan(text: 'G\'day!')],
            ),
            textDirection: TextDirection.ltr,
          )..layout();
          tp.paint(
            canvas,
            Offset(
              0.0,
              0.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
            ),
          );
        }
      }
    } else if (currentLocale == 'en' ||
        currentLocale.startsWith('en-') ||
        'en'.startsWith('$currentLocale-')) {
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
              children: <InlineSpan>[TextSpan(text: 'Hello!')],
            ),
            textDirection: TextDirection.ltr,
          )..layout();
          tp.paint(
            canvas,
            Offset(
              0.0,
              0.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
            ),
          );
        }
      }
    } else if (currentLocale == 'es' ||
        currentLocale.startsWith('es-') ||
        'es'.startsWith('$currentLocale-')) {
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
              children: <InlineSpan>[TextSpan(text: 'Hola!')],
            ),
            textDirection: TextDirection.ltr,
          )..layout();
          tp.paint(
            canvas,
            Offset(
              0.0,
              0.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
            ),
          );
        }
      }
    } else if (currentLocale == 'fr' ||
        currentLocale.startsWith('fr-') ||
        'fr'.startsWith('$currentLocale-')) {
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
              children: <InlineSpan>[TextSpan(text: 'Bonjour!')],
            ),
            textDirection: TextDirection.ltr,
          )..layout();
          tp.paint(
            canvas,
            Offset(
              0.0,
              0.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
            ),
          );
        }
      }
    } else if (currentLocale == 'ja' ||
        currentLocale.startsWith('ja-') ||
        'ja'.startsWith('$currentLocale-')) {
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
              children: <InlineSpan>[TextSpan(text: 'こんにちは')],
            ),
            textDirection: TextDirection.ltr,
          )..layout();
          tp.paint(
            canvas,
            Offset(
              0.0,
              0.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
            ),
          );
        }
      }
    } else if (currentLocale == 'ru' ||
        currentLocale.startsWith('ru-') ||
        'ru'.startsWith('$currentLocale-')) {
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
              children: <InlineSpan>[TextSpan(text: 'Привет!')],
            ),
            textDirection: TextDirection.ltr,
          )..layout();
          tp.paint(
            canvas,
            Offset(
              0.0,
              0.0 - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic),
            ),
          );
        }
      }
    }
    canvas.restore();
    canvas.restore();
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
  bool shouldRepaint(covariant _$SwitchElementPainter oldDelegate) {
    if (fit == oldDelegate.fit) {
      return false;
    } else {
      return true;
    }
  }
}
