part of '../paint_command.dart';

/// A command to draw a raster image on the canvas.
@immutable
final class DrawImage extends DrawCommand {
  const DrawImage({
    required this.href,
    required this.imageIndex,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.bytes,
    required this.style,
    this.decoding = PaintingImageDecoding.async,
    super.id,
  });

  /// The URL/path of the image.
  final String href;

  /// The index of this image in the generator's unique image list.
  final int imageIndex;

  /// The x-axis coordinate of the top-left corner.
  final double x;

  /// The y-axis coordinate of the top-left corner.
  final double y;

  /// The width of the image.
  final double width;

  /// The height of the image.
  final double height;

  /// The raw bytes of the image (JPEG or PNG).
  final List<int> bytes;

  /// The decoding hint for the image.
  final PaintingImageDecoding decoding;

  @override
  final PaintingStyle style;

  @override
  String toString() {
    final parts = <String>[
      'x: $x',
      'y: $y',
      'width: $width',
      'height: $height',
      if (decoding != PaintingImageDecoding.async) 'decoding: $decoding',
      'style: $style',
      if (id != null) 'id: $id',
    ];
    return 'DrawImage(${parts.join(', ')})';
  }
}

/// Enumeration of image decoding hints in the painting model.
enum PaintingImageDecoding {
  /// Decode the image synchronously.
  sync,

  /// Decode the image asynchronously.
  async,
}
