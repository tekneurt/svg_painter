import 'dart:math' as math;

import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../converters/svg_painting_context.dart';
import '../converters/svg_to_painting.dart';
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

    // Support recursive SVG sources here.
    final SvgRoot? nestedSvg = context.svgCache[href];
    if (nestedSvg != null) {
      final SvgPaintingContext nestedContext = context.derive(
        viewBoxWidth: widthVal,
        viewBoxHeight: heightVal,
        viewBoxMinX: 0.0,
        viewBoxMinY: 0.0,
      );

      final Result<List<PaintCommand>> nestedCommandsResult = nestedSvg.toPaintCommands(nestedContext);

      return nestedCommandsResult.map((List<PaintCommand> nestedCommands) {
        // The nested SVG draws itself assuming its own width/height or viewBox.
        // We need to fit whatever it draws into our image's widthVal/heightVal
        // using the image's preserveAspectRatio.
        
        // Find what the nested SVG resolved its own size to.
        double nestedW = nestedContext.viewBoxWidth;
        double nestedH = nestedContext.viewBoxHeight;
        
        final double resolvedW = (nestedSvg as SvgSvg).width?.resolveOrNull(nestedContext, SvgOrientation.horizontal) ?? 0.0;
        final double resolvedH = nestedSvg.height?.resolveOrNull(nestedContext, SvgOrientation.vertical) ?? 0.0;
        if (resolvedW > 0 && resolvedH > 0) {
          nestedW = resolvedW;
          nestedH = resolvedH;
        } else if (nestedSvg.viewBox != null) {
          nestedW = nestedSvg.viewBox!.width;
          nestedH = nestedSvg.viewBox!.height;
        }

        final SvgPreserveAspectRatio par = preserveAspectRatio ?? SvgPreserveAspectRatio.defaults;
        
        double sx = nestedW > 0 ? widthVal / nestedW : 1.0;
        double sy = nestedH > 0 ? heightVal / nestedH : 1.0;
        var alignX = 0.0;
        var alignY = 0.0;

        if (par.alignment != SvgPreserveAspectRatioAlignment.none) {
          if (par.scale == SvgPreserveAspectRatioScale.slice) {
            sx = math.max(sx, sy);
            sy = sx;
          } else {
            sx = math.min(sx, sy);
            sy = sx;
          }

          final double scaledWidth = nestedW * sx;
          final double scaledHeight = nestedH * sy;

          switch (par.alignment) {
            case SvgPreserveAspectRatioAlignment.xMinYMin:
            case SvgPreserveAspectRatioAlignment.xMinYMid:
            case SvgPreserveAspectRatioAlignment.xMinYMax:
              alignX = 0.0;
            case SvgPreserveAspectRatioAlignment.xMidYMin:
            case SvgPreserveAspectRatioAlignment.xMidYMid:
            case SvgPreserveAspectRatioAlignment.xMidYMax:
              alignX = (widthVal - scaledWidth) / 2.0;
            case SvgPreserveAspectRatioAlignment.xMaxYMin:
            case SvgPreserveAspectRatioAlignment.xMaxYMid:
            case SvgPreserveAspectRatioAlignment.xMaxYMax:
              alignX = widthVal - scaledWidth;
            case SvgPreserveAspectRatioAlignment.none:
              break;
          }

          switch (par.alignment) {
            case SvgPreserveAspectRatioAlignment.xMinYMin:
            case SvgPreserveAspectRatioAlignment.xMidYMin:
            case SvgPreserveAspectRatioAlignment.xMaxYMin:
              alignY = 0.0;
            case SvgPreserveAspectRatioAlignment.xMinYMid:
            case SvgPreserveAspectRatioAlignment.xMidYMid:
            case SvgPreserveAspectRatioAlignment.xMaxYMid:
              alignY = (heightVal - scaledHeight) / 2.0;
            case SvgPreserveAspectRatioAlignment.xMinYMax:
            case SvgPreserveAspectRatioAlignment.xMidYMax:
            case SvgPreserveAspectRatioAlignment.xMaxYMax:
              alignY = heightVal - scaledHeight;
            case SvgPreserveAspectRatioAlignment.none:
              break;
          }
        }

        final imageOps = <SvgTransformOperation>[];
        if (xVal != 0 || yVal != 0) {
          imageOps.add(SvgTranslate(xVal, yVal));
        }
        if (alignX != 0 || alignY != 0) {
          imageOps.add(SvgTranslate(alignX, alignY));
        }
        if (sx != 1.0 || sy != 1.0) {
          imageOps.add(SvgScale(sx, sy));
        }

        return <PaintCommand>[
          DrawGroup(
            id: id,
            opacity: presentationAttributes?.graphics?.opacity?.resolve(context, SvgOrientation.unit) ?? 1.0,
            commands: nestedCommands,
            style: PaintingStyle(
              transformAttributes: SvgTransformAttributes(imageOps),
            ),
          ),
        ];
      });
    }

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
