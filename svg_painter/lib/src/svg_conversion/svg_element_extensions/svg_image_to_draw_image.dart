import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';
import '../svg_value_extensions/_svg_value_extensions.dart';

/// Extension to convert [SvgImage] to [DrawImage] commands.
extension SvgImageToDrawImage on SvgImage {
  /// Converts this [SvgImage] to a [DrawImage] command.
  Result<List<PaintCommand>> toPaintCommands(SvgPaintingContext context) {
    final double xVal = (x ?? const SvgLength(0.0)).resolve(
      context,
      SvgOrientation.horizontal,
      defaultValue: 0.0,
    );
    final double yVal = (y ?? const SvgLength(0.0)).resolve(
      context,
      SvgOrientation.vertical,
      defaultValue: 0.0,
    );

    final double widthVal = (width ?? const SvgAuto()).resolve(
      context,
      SvgOrientation.horizontal,
      defaultValue: 0.0,
    );
    final double heightVal = (height ?? const SvgAuto()).resolve(
      context,
      SvgOrientation.vertical,
      defaultValue: 0.0,
    );

    // TODO(Gemini): Support recursive SVG sources here.
    // For now, assume raster if bytes are present in cache.
    final List<int>? bytes = context.imageCache[href];

    if (bytes == null) {
      // If no bytes in cache, we can't draw anything for now.
      return const Success<List<PaintCommand>>(<PaintCommand>[]);
    }

    final PaintingImageDecoding resolvedDecoding = switch (decoding) {
      SvgImageDecoding.sync => PaintingImageDecoding.sync,
      SvgImageDecoding.async || SvgImageDecoding.auto => PaintingImageDecoding.async,
    };

    return Success<List<PaintCommand>>(<PaintCommand>[
      DrawImage(
        id: id,
        href: href,
        imageIndex: 0, // Placeholder, populated by generator
        x: xVal,
        y: yVal,
        width: widthVal,
        height: heightVal,
        bytes: bytes,
        decoding: resolvedDecoding,
        style: PaintingStyle(
          groupOpacity: presentationAttributes?.graphics?.opacity?.resolve(context, SvgOrientation.unit) ?? 1.0,
          transformAttributes: presentationAttributes?.graphics?.transformAttributes,
        ),
      ),
    ]);
  }
}
