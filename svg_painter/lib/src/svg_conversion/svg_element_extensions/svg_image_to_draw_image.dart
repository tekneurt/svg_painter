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
      .horizontal,
      defaultValue: 0.0,
    );
    final double yVal = (y ?? const SvgLength(0.0)).resolve(
      context,
      .vertical,
      defaultValue: 0.0,
    );
    final double widthVal = (width ?? const SvgAuto()).resolve(
      context,
      .horizontal,
      defaultValue: 0.0,
    );
    final double heightVal = (height ?? const SvgAuto()).resolve(
      context,
      .vertical,
      defaultValue: 0.0,
    );

    final SvgSvg? nestedSvg = context.svgCache[href];
    if (nestedSvg != null) {
      return _convertNestedSvgImage(nestedSvg, context, xVal, yVal, widthVal, heightVal);
    }

    final List<int>? bytes = context.imageCache[href];
    if (bytes == null) {
      return const Success<List<PaintCommand>>(<PaintCommand>[]);
    }

    return _convertRasterImage(bytes, context, xVal, yVal, widthVal, heightVal);
  }

  Result<List<PaintCommand>> _convertNestedSvgImage(
    SvgSvg nestedSvg,
    SvgPaintingContext context,
    double xVal,
    double yVal,
    double widthVal,
    double heightVal,
  ) {
    final SvgPaintingContext nestedContext = context.derive(
      viewBoxWidth: widthVal,
      viewBoxHeight: heightVal,
      viewBoxMinX: 0.0,
      viewBoxMinY: 0.0,
    );

    return nestedSvg.toPaintCommands(nestedContext).map((List<PaintCommand> nestedCommands) {
      double nestedW = nestedContext.viewBoxWidth;
      double nestedH = nestedContext.viewBoxHeight;

      final double resolvedW = nestedSvg.width?.resolveOrNull(nestedContext, .horizontal) ?? 0.0;
      final double resolvedH = nestedSvg.height?.resolveOrNull(nestedContext, .vertical) ?? 0.0;
      if (resolvedW > 0 && resolvedH > 0) {
        nestedW = resolvedW;
        nestedH = resolvedH;
      } else if (nestedSvg.viewportAttributes?.viewBox != null) {
        nestedW = nestedSvg.viewportAttributes!.viewBox!.width;
        nestedH = nestedSvg.viewportAttributes!.viewBox!.height;
      }

      final SvgPreserveAspectRatio par = preserveAspectRatio ?? SvgPreserveAspectRatio.defaults;
      final (:double sx, :double sy, :double alignX, :double alignY) = _computeAspectRatioFit(
        nestedW,
        nestedH,
        widthVal,
        heightVal,
        par,
      );

      final imageOps = <SvgTransformOperation>[
        if (xVal != 0 || yVal != 0) SvgTranslate(xVal, yVal),
        if (alignX != 0 || alignY != 0) SvgTranslate(alignX, alignY),
        if (sx != 1.0 || sy != 1.0) SvgScale(sx, sy),
      ];

      return <PaintCommand>[
        DrawGroup(
          id: id,
          opacity: (presentationAttributes?.graphics?.opacity).resolveOpacity(context),
          commands: nestedCommands,
          style: PaintingStyle(
            transformAttributes: SvgTransformAttributes(imageOps),
          ),
        ),
      ];
    });
  }

  Result<List<PaintCommand>> _convertRasterImage(
    List<int> bytes,
    SvgPaintingContext context,
    double xVal,
    double yVal,
    double widthVal,
    double heightVal,
  ) {
    final PaintingImageDecoding resolvedDecoding = switch (decoding) {
      .sync => PaintingImageDecoding.sync,
      .async || .auto => PaintingImageDecoding.async,
    };
    final double resolvedOpacity = (presentationAttributes?.graphics?.opacity).resolveOpacity(
      context,
    );
    final ({double width, double height})? dimensions = parseImageDimensions(bytes);

    if (dimensions == null) {
      return Success<List<PaintCommand>>(<PaintCommand>[
        DrawImage(
          id: id,
          href: href,
          imageIndex: 0,
          x: xVal,
          y: yVal,
          width: widthVal,
          height: heightVal,
          bytes: bytes,
          decoding: resolvedDecoding,
          style: PaintingStyle(
            groupOpacity: resolvedOpacity,
            transformAttributes: presentationAttributes?.graphics?.transformAttributes,
          ),
        ),
      ]);
    }

    final SvgPreserveAspectRatio par = preserveAspectRatio ?? SvgPreserveAspectRatio.defaults;
    final (:double sx, :double sy, :double alignX, :double alignY) = _computeAspectRatioFit(
      dimensions.width,
      dimensions.height,
      widthVal,
      heightVal,
      par,
    );
    final double scaledW = dimensions.width * sx;
    final double scaledH = dimensions.height * sy;

    final outerOps = <SvgTransformOperation>[
      if (presentationAttributes?.graphics?.transformAttributes case final ta?) ...ta.operations,
      if (xVal != 0 || yVal != 0) SvgTranslate(xVal, yVal),
    ];

    final isOverflowVisible = presentationAttributes?.overflow == SvgOverflow.visible;
    final bool shouldClip =
        !isOverflowVisible && (par.scale == .slice || par.alignment == .none);
    final PaintingRect? clipRect = shouldClip ? PaintingRect(0, 0, widthVal, heightVal) : null;

    if (outerOps.isEmpty && clipRect == null) {
      return Success<List<PaintCommand>>(<PaintCommand>[
        DrawImage(
          id: id,
          href: href,
          imageIndex: 0,
          x: xVal + alignX,
          y: yVal + alignY,
          width: scaledW,
          height: scaledH,
          bytes: bytes,
          decoding: resolvedDecoding,
          style: PaintingStyle(
            groupOpacity: resolvedOpacity,
            transformAttributes: presentationAttributes?.graphics?.transformAttributes,
          ),
        ),
      ]);
    }

    return Success<List<PaintCommand>>(<PaintCommand>[
      DrawGroup(
        commands: <PaintCommand>[
          DrawImage(
            id: id,
            href: href,
            imageIndex: 0,
            x: alignX,
            y: alignY,
            width: scaledW,
            height: scaledH,
            bytes: bytes,
            decoding: resolvedDecoding,
            style: PaintingStyle(groupOpacity: resolvedOpacity),
          ),
        ],
        style: PaintingStyle(
          transformAttributes: outerOps.isEmpty ? null : SvgTransformAttributes(outerOps),
          clipRect: clipRect,
        ),
      ),
    ]);
  }
}

/// Computes uniform or non-uniform scale factors and alignment offsets for [par].
({double sx, double sy, double alignX, double alignY}) _computeAspectRatioFit(
  double contentW,
  double contentH,
  double boxW,
  double boxH,
  SvgPreserveAspectRatio par,
) {
  double sx = contentW > 0 ? boxW / contentW : 1.0;
  double sy = contentH > 0 ? boxH / contentH : 1.0;
  var alignX = 0.0;
  var alignY = 0.0;

  if (par.alignment != .none) {
    final double uniformScale = par.scale == .slice ? math.max(sx, sy) : math.min(sx, sy);
    sx = uniformScale;
    sy = uniformScale;

    final double scaledWidth = contentW * sx;
    final double scaledHeight = contentH * sy;

    alignX = switch (par.alignment) {
      .xMinYMin || .xMinYMid || .xMinYMax || .none => 0.0,
      .xMidYMin || .xMidYMid || .xMidYMax => (boxW - scaledWidth) / 2.0,
      .xMaxYMin || .xMaxYMid || .xMaxYMax => boxW - scaledWidth,
    };

    alignY = switch (par.alignment) {
      .xMinYMin || .xMidYMin || .xMaxYMin || .none => 0.0,
      .xMinYMid || .xMidYMid || .xMaxYMid => (boxH - scaledHeight) / 2.0,
      .xMinYMax || .xMidYMax || .xMaxYMax => boxH - scaledHeight,
    };
  }

  return (sx: sx, sy: sy, alignX: alignX, alignY: alignY);
}
