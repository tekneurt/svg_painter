// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_blue_painter.dart';

// **************************************************************************
// SvgPainterGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unused_field, unused_element_parameter, unused_local_variable, deprecated_member_use_from_same_package

class ImageBluePainterWidget extends StatefulWidget {
  const ImageBluePainterWidget({
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
  State<ImageBluePainterWidget> createState() => _ImageBluePainterWidgetState();
}

class _ImageBluePainterWidgetState extends State<ImageBluePainterWidget> {
  Object? _image0;

  @override
  void initState() {
    super.initState();
    _decodeImages();
  }

  Future<void> _decodeImages() async {
    final images = await Future.wait<dynamic>([
      decodeImageFromList(Uint8List.fromList(_imageBytes__$ImageBluePainter_0)),
    ]);
    if (mounted) {
      setState(() {
        _image0 = images[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(widget.width ?? 100.0, widget.height ?? 100.0),
      painter: _$ImageBluePainter(fit: widget.fit, image0: _image0),
    );
  }
}

const List<int> _imageBytes__$ImageBluePainter_0 = <int>[
  137,
  80,
  78,
  71,
  13,
  10,
  26,
  10,
  0,
  0,
  0,
  13,
  73,
  72,
  68,
  82,
  0,
  0,
  0,
  10,
  0,
  0,
  0,
  10,
  8,
  6,
  0,
  0,
  0,
  141,
  50,
  207,
  189,
  0,
  0,
  0,
  21,
  73,
  68,
  65,
  84,
  120,
  218,
  99,
  100,
  96,
  248,
  95,
  207,
  64,
  4,
  96,
  28,
  85,
  72,
  95,
  133,
  0,
  254,
  69,
  14,
  247,
  31,
  69,
  133,
  160,
  0,
  0,
  0,
  0,
  73,
  69,
  78,
  68,
  174,
  66,
  96,
  130,
];

class _$ImageBluePainter extends CustomPainter {
  const _$ImageBluePainter({this.fit = BoxFit.contain, this.image0});

  final BoxFit fit;
  final Object? image0;

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

    if (image0 != null) {
      final dynamic img = image0;
      final double srcW = (img.width as int).toDouble();
      final double srcH = (img.height as int).toDouble();
      final Paint paint = Paint();
      (canvas as dynamic).drawImageRect(
        img,
        Rect.fromLTWH(0, 0, srcW, srcH),
        Rect.fromLTWH(0.0, 0.0, 100.0, 100.0),
        paint,
      );
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
  bool shouldRepaint(covariant _$ImageBluePainter oldDelegate) {
    if (fit == oldDelegate.fit && image0 == oldDelegate.image0) {
      return false;
    } else {
      return true;
    }
  }
}
