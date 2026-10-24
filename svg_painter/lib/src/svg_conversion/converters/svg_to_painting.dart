import '../../base/_base.dart';
import '../../painting_model/paint_command.dart';
import '../../painting_model/styles/painting_style.dart';
import '../../svg_model/_svg_model.dart';
import '../svg_element_extensions/svg_circle_to_draw_circle.dart';
import '../svg_element_extensions/svg_ellipse_to_draw_oval.dart';
import '../svg_element_extensions/svg_gradient_to_painting.dart';
import '../svg_element_extensions/svg_image_to_draw_image.dart';
import '../svg_element_extensions/svg_line_to_draw_line.dart';
import '../svg_element_extensions/svg_path_to_draw_path.dart';
import '../svg_element_extensions/svg_polygon_to_draw_polygon.dart';
import '../svg_element_extensions/svg_polyline_to_draw_polyline.dart';
import '../svg_element_extensions/svg_rect_to_draw_rect.dart';
import '../svg_element_extensions/svg_text_to_painting.dart';
import '../svg_value_extensions/_svg_value_extensions.dart';
import 'defs_to_painting.dart';
import 'svg_definition_collector.dart';
import 'svg_paint_resolver.dart';
import 'svg_painting_context.dart';
import 'svg_root_to_painting.dart';
import 'symbol_to_painting.dart';
import 'use_to_painting.dart';

/// Extension to convert [SvgElement] to [PaintCommand]s.
extension SvgElementToPaintCommands on SvgElement {
  /// Converts this [SvgElement] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands([SvgPaintingContext? context]) {
    final self = this;
    if (self is SvgRoot && context == null) {
      // Establish context from SvgRoot.
      final SvgLengthPercentageAuto? w = self.width;
      final SvgLength? wLen = w is SvgLength ? w : null;
      final SvgLengthPercentageAuto? h = self.height;
      final SvgLength? hLen = h is SvgLength ? h : null;

      final double width = wLen?.toDouble() ?? self.viewBox?.width ?? 100.0;
      final double height = hLen?.toDouble() ?? self.viewBox?.height ?? 100.0;

      final double minX = self.viewBox?.minX ?? 0.0;
      final double minY = self.viewBox?.minY ?? 0.0;

      final definitions = <String, SvgElement>{};
      self.collectDefinitions(definitions);

      final rootContext = SvgPaintingContext(
        viewBoxWidth: width,
        viewBoxHeight: height,
        viewBoxMinX: minX,
        viewBoxMinY: minY,
        inheritedAttributes: SvgPresentationAttributes(
          color: self.presentationAttributes?.color ?? const SvgNamedColor(SvgColorName.black),
          fill: SvgFillAttributes(
            color: self.fillAttributes?.color ?? const SvgNamedColor(SvgColorName.black),
            opacity: self.fillAttributes?.opacity ?? const SvgLength(1.0),
          ),
          stroke: SvgStrokeAttributes(
            color: self.strokeAttributes?.color ?? const SvgNoneColor(),
            opacity: self.strokeAttributes?.opacity ?? const SvgLength(1.0),
            width: self.strokeAttributes?.width ?? const SvgLength(1.0),
            dashArray: self.strokeAttributes?.dashArray,
            linecap: self.strokeAttributes?.linecap ?? SvgStrokeLinecap.butt,
            linejoin: self.strokeAttributes?.linejoin ?? SvgStrokeLinejoin.miter,
          ),
          font: SvgFontAttributes(
            size: self.fontAttributes?.size ?? const SvgLength(16.0),
            weight: self.fontAttributes?.weight ?? const SvgFontWeightNormal(),
            style: self.fontAttributes?.style ?? SvgFontStyle.normal,
            family: self.fontAttributes?.family ?? const SvgFontFamily('serif'),
          ),
        ),
        styleSheet: self.styleSheet,
        definitions: definitions,
      );
      return self.toPaintCommandsSvg(rootContext);
    }

    context ??= const SvgPaintingContext(viewBoxWidth: 100.0, viewBoxHeight: 100.0);

    final SvgPresentationAttributes resolved = resolvePresentation(
      context,
      tagName: _elementTagName(self),
      coreAttributes: self.coreAttributes,
      presentationAttributes: self is SvgPresentable ? self.presentationAttributes : null,
    );

    final bool isDefinitionElement =
        self is SvgMask ||
        self is SvgClipPath ||
        self is SvgMarker ||
        self is SvgDefs ||
        self is SvgSymbol ||
        self is SvgRadialGradient ||
        self is SvgLinearGradient;

    if (resolved.display == SvgDisplay.none) {
      if (context.isDefinition && (self is SvgGroup || isDefinitionElement)) {
        // Definitions inside <defs> (and <g> containers grouping them) are processed
        // to discover definitions regardless of display property.
      } else {
        return const Success<List<PaintCommand>>(<PaintCommand>[]);
      }
    }

    final SvgPaintingContext childContext = context.derive(inheritedAttributes: resolved);

    final bool isVisibilityHidden =
        resolved.visibility == SvgVisibility.hidden ||
        resolved.visibility == SvgVisibility.collapse;

    if (isVisibilityHidden &&
        (self is SvgRect ||
            self is SvgCircle ||
            self is SvgEllipse ||
            self is SvgLine ||
            self is SvgPolyline ||
            self is SvgPolygon ||
            self is SvgPath ||
            self is SvgImage)) {
      return const Success<List<PaintCommand>>(<PaintCommand>[]);
    }

    return switch (self) {
      // Containers
      final SvgSvg container => container.toPaintCommandsSvg(childContext),
      final SvgGroup group => group._toPaintCommandsGroup(childContext),

      // Basic Shapes (Geometry)
      final SvgCircle circle => circle.toPaintCommands(context),
      final SvgEllipse ellipse => ellipse.toPaintCommands(context),
      final SvgImage image => image.toPaintCommands(context),
      final SvgRect rect => rect.toPaintCommands(context),
      final SvgLine line => line.toPaintCommands(context),
      final SvgPolyline polyline => polyline.toPaintCommands(context),
      final SvgPolygon polygon => polygon.toPaintCommands(context),

      // Other Geometry
      final SvgPath path => path.toPaintCommands(context),

      // Other Graphics
      final SvgText text => text.toPaintCommands(context),
      final SvgUse use => use.toPaintCommandsUse(childContext),

      // Definitions
      final SvgSymbol symbol => symbol.toPaintCommandsSymbol(childContext, onlyDefinitions: true),
      final SvgMarker marker => _toDefineMarker(marker, childContext),
      final SvgMask mask => _toDefineMask(mask, childContext),
      final SvgPattern pattern => _toDefinePattern(pattern, childContext),
      final SvgClipPath clipPath => _toDefineClipPath(clipPath, childContext),
      final SvgDefs defs => defs.toPaintCommandsDefs(childContext),
      final SvgStop _ ||
      final SvgMetadataElement _ ||
      final SvgStyle _ ||
      final SvgIgnoredElement _ => const Success<List<PaintCommand>>(<PaintCommand>[]),
      final SvgRadialGradient gradient =>
        gradient.toPaintCommand(childContext).map((PaintCommand cmd) => <PaintCommand>[cmd]),
      final SvgLinearGradient gradient =>
        gradient.toPaintCommand(childContext).map((PaintCommand cmd) => <PaintCommand>[cmd]),

      // Safety fallback
      _ => const Success<List<PaintCommand>>(<PaintCommand>[]),
    };
  }

  Result<List<PaintCommand>> _toDefineClipPath(SvgClipPath clipPath, SvgPaintingContext context) {
    final SvgPaintingContext childrenContext =
        (clipPath.clipPathUnits == SvgClipPathUnits.objectBoundingBox)
        ? context.derive(
            viewBoxWidth: 1.0,
            viewBoxHeight: 1.0,
            viewBoxMinX: 0,
            viewBoxMinY: 0,
            isDefinition: false,
          )
        : context.derive(isDefinition: false);

    return clipPath.children
        .map((SvgElement child) => child.toPaintCommands(childrenContext))
        .combine()
        .map((List<PaintCommand> childCommands) {
          return <PaintCommand>[
            DefineClipPath(
              id: clipPath.id ?? '',
              commands: childCommands,
              clipPathUnits: switch (clipPath.clipPathUnits) {
                SvgClipPathUnits.objectBoundingBox => PaintingGradientUnits.objectBoundingBox,
                SvgClipPathUnits.userSpaceOnUse => PaintingGradientUnits.userSpaceOnUse,
              },
            ),
          ];
        });
  }

  Result<List<PaintCommand>> _toDefineMask(SvgMask mask, SvgPaintingContext context) {
    final SvgPaintingContext childrenContext =
        (mask.maskContentUnits == SvgMaskUnits.objectBoundingBox)
        ? context.derive(
            viewBoxWidth: 1.0,
            viewBoxHeight: 1.0,
            viewBoxMinX: 0,
            viewBoxMinY: 0,
            isDefinition: false,
          )
        : context.derive(isDefinition: false);

    return mask.children
        .map((SvgElement child) => child.toPaintCommands(childrenContext))
        .combine()
        .map((
          List<PaintCommand> childCommands,
        ) {
          return <PaintCommand>[
            DefineMask(
              id: mask.id ?? '',
              commands: childCommands,
              x: mask.x ?? const SvgPercentage(0),
              y: mask.y ?? const SvgPercentage(0),
              width: mask.width ?? const SvgPercentage(100),
              height: mask.height ?? const SvgPercentage(100),
              maskUnits: switch (mask.maskUnits) {
                SvgMaskUnits.objectBoundingBox => PaintingGradientUnits.objectBoundingBox,
                SvgMaskUnits.userSpaceOnUse => PaintingGradientUnits.userSpaceOnUse,
              },
              maskContentUnits: switch (mask.maskContentUnits) {
                SvgMaskUnits.objectBoundingBox => PaintingGradientUnits.objectBoundingBox,
                SvgMaskUnits.userSpaceOnUse => PaintingGradientUnits.userSpaceOnUse,
              },
            ),
          ];
        });
  }

  Result<List<PaintCommand>> _toDefinePattern(SvgPattern pattern, SvgPaintingContext context) {
    final SvgPaintingContext childrenContext = pattern.viewBox != null
        ? context.derive(
            viewBoxWidth: pattern.viewBox!.width,
            viewBoxHeight: pattern.viewBox!.height,
            viewBoxMinX: pattern.viewBox!.minX,
            viewBoxMinY: pattern.viewBox!.minY,
            isDefinition: false,
          )
        : context.derive(isDefinition: false);

    return pattern.children
        .map((SvgElement child) => child.toPaintCommands(childrenContext))
        .combine()
        .map((List<PaintCommand> childCommands) {
          return <PaintCommand>[
            DefinePattern(
              id: pattern.id,
              commands: childCommands,
              x: pattern.x,
              y: pattern.y,
              width: pattern.width,
              height: pattern.height,
              patternUnits: pattern.patternUnits,
              patternContentUnits: pattern.patternContentUnits,
              viewBox: pattern.viewBox,
              preserveAspectRatio: pattern.preserveAspectRatio,
              patternTransform: pattern.patternTransformAttributes,
            ),
          ];
        });
  }

  Result<List<PaintCommand>> _toDefineMarker(SvgMarker marker, SvgPaintingContext context) {
    final SvgPaintingContext childrenContext = marker.viewBox != null
        ? context.derive(
            viewBoxWidth: marker.viewBox!.width,
            viewBoxHeight: marker.viewBox!.height,
            viewBoxMinX: marker.viewBox!.minX,
            viewBoxMinY: marker.viewBox!.minY,
            isDefinition: false,
            resetContextPaint: true,
          )
        : context.derive(
            isDefinition: false,
            resetContextPaint: true,
          );

    return marker.children
        .map((SvgElement child) => child.toPaintCommands(childrenContext))
        .combine()
        .map((List<PaintCommand> childCommands) {
          final double refX = switch (marker.refX) {
            final SvgLength l => l.value,
            final SvgPercentage p => (p.value / 100.0) * (marker.viewBox?.width ?? 100.0),
            null => 0.0,
          };
          final double refY = switch (marker.refY) {
            final SvgLength l => l.value,
            final SvgPercentage p => (p.value / 100.0) * (marker.viewBox?.height ?? 100.0),
            null => 0.0,
          };
          final double markerWidth = switch (marker.markerWidth) {
            final SvgLength l => l.value,
            final SvgPercentage p => (p.value / 100.0) * 100.0,
            null => 3.0,
          };
          final double markerHeight = switch (marker.markerHeight) {
            final SvgLength l => l.value,
            final SvgPercentage p => (p.value / 100.0) * 100.0,
            null => 3.0,
          };
          final SvgPresentationAttributes resolved = resolvePresentation(
            context,
            tagName: 'marker',
            coreAttributes: marker.coreAttributes,
            presentationAttributes: marker.presentationAttributes,
          );
          final SvgOverflow overflow = resolved.overflow ?? SvgOverflow.hidden;

          return <PaintCommand>[
            DefineMarker(
              id: marker.id ?? '',
              commands: childCommands,
              refX: refX,
              refY: refY,
              markerWidth: markerWidth,
              markerHeight: markerHeight,
              markerUnits: marker.markerUnits,
              orient: marker.orient,
              viewBox: marker.viewBox,
              preserveAspectRatio: marker.preserveAspectRatio,
              overflow: overflow,
            ),
          ];
        });
  }
}

extension _SvgGroupToPaintCommands on SvgGroup {
  Result<List<PaintCommand>> _toPaintCommandsGroup(SvgPaintingContext context) {
    // Determine if we should use saveLayer (group opacity).
    final double resolvedOpacity = opacity.resolveOpacity(context);

    final PaintingStyle style = resolvePaint(
      context,
      tagName: 'g',
      coreAttributes: coreAttributes,
      presentationAttributes: presentationAttributes,
    );

    return children.map((SvgElement child) => child.toPaintCommands(context)).combine().map((
      List<PaintCommand> childCommands,
    ) {
      return <PaintCommand>[
        DrawGroup(
          commands: childCommands,
          style: style,
          id: id,
          opacity: resolvedOpacity,
        ),
      ];
    });
  }
}

String _elementTagName(SvgElement element) => switch (element) {
  SvgRect _ => 'rect',
  SvgCircle _ => 'circle',
  SvgEllipse _ => 'ellipse',
  SvgLine _ => 'line',
  SvgPolyline _ => 'polyline',
  SvgPolygon _ => 'polygon',
  SvgPath _ => 'path',
  SvgText _ => 'text',
  SvgGroup _ => 'g',
  SvgUse _ => 'use',
  SvgImage _ => 'image',
  SvgSvg _ => 'svg',
  SvgSymbol _ => 'symbol',
  SvgMarker _ => 'marker',
  SvgMask _ => 'mask',
  SvgClipPath _ => 'clipPath',
  SvgDefs _ => 'defs',
  SvgLinearGradient _ => 'linearGradient',
  SvgRadialGradient _ => 'radialGradient',
  SvgStop _ => 'stop',
  _ => '',
};
