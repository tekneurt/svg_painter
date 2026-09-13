import 'dart:math' as math;

import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../svg_value_extensions/_svg_value_extensions.dart';
import 'svg_paint_resolver.dart';
import 'svg_painting_context.dart';
import 'svg_to_painting.dart';

/// Extension for <svg> element conversion.
extension SvgRootToPaintCommands on SvgSvg {
  /// Converts this [SvgSvg] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommandsSvg(
    SvgPaintingContext context, {
    SvgLengthPercentage? x,
    SvgLengthPercentage? y,
    SvgLengthPercentageAuto? width,
    SvgLengthPercentageAuto? height,
  }) {
    final double xVal = (x ?? this.x ?? const SvgLength(0.0)).resolve(
      context,
      SvgOrientation.horizontal,
    );
    final double yVal = (y ?? this.y ?? const SvgLength(0.0)).resolve(
      context,
      SvgOrientation.vertical,
    );

    final SvgLengthPercentageAuto? finalWidth = width ?? this.width;
    final SvgLengthPercentageAuto? finalHeight = height ?? this.height;

    final double wVal =
        finalWidth?.resolveOrNull(context, SvgOrientation.horizontal) ?? context.viewBoxWidth;
    final double hVal =
        finalHeight?.resolveOrNull(context, SvgOrientation.vertical) ?? context.viewBoxHeight;

    final double vbW = viewBox?.width ?? wVal;
    final double vbH = viewBox?.height ?? hVal;
    final double vbMinX = viewBox?.minX ?? 0.0;
    final double vbMinY = viewBox?.minY ?? 0.0;

    final SvgPreserveAspectRatio par = preserveAspectRatio ?? SvgPreserveAspectRatio.defaults;

    double sx = wVal / vbW;
    double sy = hVal / vbH;

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

      final double viewBoxScaledWidth = vbW * sx;
      final double viewBoxScaledHeight = vbH * sy;

      switch (par.alignment) {
        case SvgPreserveAspectRatioAlignment.xMinYMin:
        case SvgPreserveAspectRatioAlignment.xMinYMid:
        case SvgPreserveAspectRatioAlignment.xMinYMax:
          alignX = 0.0;
        case SvgPreserveAspectRatioAlignment.xMidYMin:
        case SvgPreserveAspectRatioAlignment.xMidYMid:
        case SvgPreserveAspectRatioAlignment.xMidYMax:
          alignX = (wVal - viewBoxScaledWidth) / 2.0;
        case SvgPreserveAspectRatioAlignment.xMaxYMin:
        case SvgPreserveAspectRatioAlignment.xMaxYMid:
        case SvgPreserveAspectRatioAlignment.xMaxYMax:
          alignX = wVal - viewBoxScaledWidth;
        case SvgPreserveAspectRatioAlignment.none:
          break; // Handled above
      }

      switch (par.alignment) {
        case SvgPreserveAspectRatioAlignment.xMinYMin:
        case SvgPreserveAspectRatioAlignment.xMidYMin:
        case SvgPreserveAspectRatioAlignment.xMaxYMin:
          alignY = 0.0;
        case SvgPreserveAspectRatioAlignment.xMinYMid:
        case SvgPreserveAspectRatioAlignment.xMidYMid:
        case SvgPreserveAspectRatioAlignment.xMaxYMid:
          alignY = (hVal - viewBoxScaledHeight) / 2.0;
        case SvgPreserveAspectRatioAlignment.xMinYMax:
        case SvgPreserveAspectRatioAlignment.xMidYMax:
        case SvgPreserveAspectRatioAlignment.xMaxYMax:
          alignY = hVal - viewBoxScaledHeight;
        case SvgPreserveAspectRatioAlignment.none:
          break;
      }
    }

    // 1. Viewport mapping (Outer)
    final viewportOps = <SvgTransformOperation>[];
    final SvgTransformAttributes? ta = transformAttributes;
    if (ta != null) {
      viewportOps.insertAll(0, ta.operations);
    }
    if (xVal != 0 || yVal != 0) {
      viewportOps.add(SvgTranslate(xVal, yVal));
    }

    // 2. ViewBox mapping (Inner)
    final viewBoxOps = <SvgTransformOperation>[];
    if (alignX != 0 || alignY != 0) {
      viewBoxOps.add(SvgTranslate(alignX, alignY));
    }
    if (sx != 1.0 || sy != 1.0) {
      viewBoxOps.add(SvgScale(sx, sy));
    }
    if (vbMinX != 0 || vbMinY != 0) {
      viewBoxOps.add(SvgTranslate(-vbMinX, -vbMinY));
    }

    final SvgPaintingContext innerContext = context.derive(
      viewBoxWidth: vbW,
      viewBoxHeight: vbH,
      viewBoxMinX: vbMinX,
      viewBoxMinY: vbMinY,
    );

    // Nested <svg> elements establishing sub-viewports must always clip.
    // The root <svg> only needs to clip if 'slice' scaling is used (which explicitly bleeds)
    // OR if the viewBox is shifted (non-zero origin), making bleeding highly likely.
    final isRoot = this is SvgRoot;
    final bool isSliceOrNone =
        par.scale == SvgPreserveAspectRatioScale.slice ||
        par.alignment == SvgPreserveAspectRatioAlignment.none;
    final bool hasShiftedViewBox = (viewBox?.minX ?? 0) != 0 || (viewBox?.minY ?? 0) != 0;

    final PaintingRect? clipRect = (!isRoot || isSliceOrNone || hasShiftedViewBox)
        ? PaintingRect(0, 0, wVal, hVal)
        : null;

    final PaintingStyle viewportStyle = resolvePaint(
      context,
      tagName: 'svg',
      coreAttributes: coreAttributes,
      presentationAttributes: (presentationAttributes ?? const SvgPresentationAttributes()).merge(
        SvgPresentationAttributes(
          graphics: SvgGraphicsAttributes(
            transformAttributes: viewportOps.isEmpty ? null : SvgTransformAttributes(viewportOps),
          ),
        ),
      ),
      clipRect: clipRect,
    );

    return children.map((SvgElement child) => child.toPaintCommands(innerContext)).combine().map((
      List<PaintCommand> childCommands,
    ) {
      if (viewBoxOps.isEmpty) {
        return <PaintCommand>[
          DrawGroup(
            commands: childCommands,
            style: viewportStyle,
            id: id,
            opacity: viewportStyle.groupOpacity,
          ),
        ];
      } else {
        final viewBoxStyle = PaintingStyle(
          transformAttributes: SvgTransformAttributes(viewBoxOps),
        );
        final innerGroup = DrawGroup(commands: childCommands, style: viewBoxStyle);
        return <PaintCommand>[
          DrawGroup(
            commands: <PaintCommand>[innerGroup],
            style: viewportStyle,
            id: id,
            opacity: viewportStyle.groupOpacity,
          ),
        ];
      }
    });
  }
}
