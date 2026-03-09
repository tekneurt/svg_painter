import '../../base/_base.dart';
import '../../painting_model/paint_command.dart';
import '../../painting_model/styles/painting_style.dart';
import '../../svg_model/_svg_model.dart';
import '../svg_element_extensions/svg_circle_to_draw_circle.dart';
import '../svg_element_extensions/svg_ellipse_to_draw_oval.dart';
import '../svg_element_extensions/svg_gradient_to_painting.dart';
import '../svg_element_extensions/svg_line_to_draw_line.dart';
import '../svg_element_extensions/svg_path_to_draw_path.dart';
import '../svg_element_extensions/svg_polygon_to_draw_polygon.dart';
import '../svg_element_extensions/svg_polyline_to_draw_polyline.dart';
import '../svg_element_extensions/svg_rect_to_draw_rect.dart';
import '../svg_element_extensions/svg_text_to_painting.dart';
import '../svg_value_extensions/_svg_value_extensions.dart';
import 'svg_definition_collector.dart';
import 'svg_paint_resolver.dart';
import 'svg_painting_context.dart';

/// Extension to convert [SvgElement] to [PaintCommand]s.
extension SvgElementToPaintCommands on SvgElement {
  /// Converts this [SvgElement] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands([SvgPaintingContext? context]) {
    final SvgElement self = this;
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

      final Map<String, SvgElement> definitions = <String, SvgElement>{};
      self.collectDefinitions(definitions);

      final SvgPaintingContext rootContext = SvgPaintingContext(
        viewBoxWidth: width,
        viewBoxHeight: height,
        viewBoxMinX: minX,
        viewBoxMinY: minY,
        inheritedFill: self.fillAttributes?.color ?? const SvgNamedColor(SvgColorName.black),
        inheritedFillOpacity: self.fillAttributes?.opacity ?? const SvgLength(1.0),
        inheritedStroke: self.strokeAttributes?.color ?? const SvgNoneColor(),
        inheritedStrokeOpacity: self.strokeAttributes?.opacity ?? const SvgLength(1.0),
        inheritedStrokeWidth: self.strokeAttributes?.width ?? const SvgLength(1.0),
        inheritedStrokeDasharray: self.strokeAttributes?.dashArray,
        inheritedStrokeLinecap: self.strokeAttributes?.linecap ?? SvgStrokeLinecap.butt,
        inheritedStrokeLinejoin: self.strokeAttributes?.linejoin ?? SvgStrokeLinejoin.miter,
        parentOpacity:
            self.opacity?.resolve(
              const SvgPaintingContext(viewBoxWidth: 1, viewBoxHeight: 1),
              SvgOrientation.unit,
            ) ??
            1.0,
        inheritedFontSize: self.fontAttributes?.size ?? const SvgLength(12.0),
        inheritedFontWeight: self.fontAttributes?.weight ?? const SvgFontWeightNormal(),
        inheritedFontStyle: self.fontAttributes?.style ?? SvgFontStyle.normal,
        inheritedFontFamily: self.fontAttributes?.family ?? const SvgFontFamily('sans-serif'),
        styleSheet: self.styleSheet,
        definitions: definitions,
      );
      return self._toPaintCommands(rootContext);
    }

    context ??= const SvgPaintingContext(viewBoxWidth: 100.0, viewBoxHeight: 100.0);
    final SvgPaintingContext childContext = context.deriveWith(self);

    return switch (self) {
      // Containers
      final SvgSvg container => container._toPaintCommands(childContext),
      final SvgGroup group => group._toPaintCommands(childContext),

      // Basic Shapes (Geometry)
      final SvgCircle circle => circle.toPaintCommands(context),
      final SvgEllipse ellipse => ellipse.toPaintCommands(context),
      final SvgRect rect => rect.toPaintCommands(context),
      final SvgLine line => line.toPaintCommands(context),
      final SvgPolyline polyline => polyline.toPaintCommands(context),
      final SvgPolygon polygon => polygon.toPaintCommands(context),

      // Other Geometry
      final SvgPath path => path.toPaintCommands(context),

      // Other Graphics
      final SvgText text => text.toPaintCommands(context),
      final SvgUse use => use._toPaintCommands(childContext),

      // Definitions
      final SvgDefs defs => defs._toPaintCommands(childContext),
      final SvgRadialGradient gradient =>
        gradient.toPaintCommand(childContext).map((PaintCommand cmd) => <PaintCommand>[cmd]),
      final SvgLinearGradient gradient =>
        gradient.toPaintCommand(childContext).map((PaintCommand cmd) => <PaintCommand>[cmd]),
      final SvgStop _ => const Success<List<PaintCommand>>(<PaintCommand>[]),

      // Non-rendering elements
      final SvgMetadataElement _ ||
      final SvgStyle _ ||
      final SvgIgnoredElement _ => const Success<List<PaintCommand>>(<PaintCommand>[]),

      // Safety fallback
      _ => const Success<List<PaintCommand>>(<PaintCommand>[]),
    };
  }
}

extension _SvgUseToPaintCommands on SvgUse {
  Result<List<PaintCommand>> _toPaintCommands(SvgPaintingContext context) {
    final String targetId = href.startsWith('#') ? href.substring(1) : href;
    final SvgElement? target = context.definitions[targetId];

    if (target == null) {
      return Failure<List<PaintCommand>>(
        'Could not find definition for ID "$targetId" referenced by <use>.',
      );
    }

    // <use> x/y act as a translation.
    final double dx = x.resolve(context, SvgOrientation.horizontal);
    final double dy = y.resolve(context, SvgOrientation.vertical);

    final List<SvgTransformOperation> ops = <SvgTransformOperation>[];
    if (dx != 0 || dy != 0) {
      ops.add(SvgTranslate(dx, dy));
    }
    final SvgTransformAttributes? ta = transformAttributes;
    if (ta != null) {
      ops.addAll(ta.operations);
    }

    final PaintingStyle style = resolvePaint(
      context,
      id: id,
      tagName: 'use',
      fillAttributes: fillAttributes,
      strokeAttributes: strokeAttributes,
      fontAttributes: fontAttributes,
      opacity: opacity,
      cssClass: cssClass,
      inlineStyle: inlineStyle,
      transformAttributes: ops.isEmpty ? null : SvgTransformAttributes(ops),
    );

    // Context for children inherits styles, but coordinates are now in the <use> local space.
    return target.toPaintCommands(context).map((List<PaintCommand> childCommands) {
      return <PaintCommand>[DrawGroup(commands: childCommands, style: style, id: id)];
    });
  }
}

extension _SvgDefsToPaintCommands on SvgDefs {
  Result<List<PaintCommand>> _toPaintCommands(SvgPaintingContext context) {
    return children.map((SvgElement child) => child.toPaintCommands(context)).combine().map((
      List<PaintCommand> commands,
    ) {
      return commands
          .where((PaintCommand cmd) => cmd is DefineLinearGradient || cmd is DefineRadialGradient)
          .toList();
    });
  }
}

extension _SvgSvgToPaintCommands on SvgSvg {
  Result<List<PaintCommand>> _toPaintCommands(SvgPaintingContext context) {
    final double xVal = (x ?? const SvgLength(0.0)).resolve(context, SvgOrientation.horizontal);
    final double yVal = (y ?? const SvgLength(0.0)).resolve(context, SvgOrientation.vertical);

    final double wVal =
        width?.resolveOrNull(context, SvgOrientation.horizontal) ?? context.viewBoxWidth;
    final double hVal =
        height?.resolveOrNull(context, SvgOrientation.vertical) ?? context.viewBoxHeight;

    final double vbW = viewBox?.width ?? wVal;
    final double vbH = viewBox?.height ?? hVal;
    final double vbMinX = viewBox?.minX ?? 0.0;
    final double vbMinY = viewBox?.minY ?? 0.0;

    final double sx = wVal / vbW;
    final double sy = hVal / vbH;

    // The viewBox mapping is: translate(x, y) * scale(sx, sy) * translate(-vbMinX, -vbMinY).
    final List<SvgTransformOperation> ops = <SvgTransformOperation>[];
    if (xVal != 0 || yVal != 0) {
      ops.add(SvgTranslate(xVal, yVal));
    }
    if (sx != 1.0 || sy != 1.0) {
      ops.add(SvgScale(sx, sy));
    }
    if (vbMinX != 0 || vbMinY != 0) {
      ops.add(SvgTranslate(-vbMinX, -vbMinY));
    }

    final SvgTransformAttributes? ta = transformAttributes;
    if (ta != null) {
      ops.insertAll(0, ta.operations);
    }

    final SvgPaintingContext innerContext = context.derive(
      viewBoxWidth: vbW,
      viewBoxHeight: vbH,
      viewBoxMinX: vbMinX,
      viewBoxMinY: vbMinY,
    );

    final PaintingStyle style = resolvePaint(
      context,
      id: id,
      tagName: 'svg',
      fillAttributes: fillAttributes,
      strokeAttributes: strokeAttributes,
      fontAttributes: fontAttributes,
      opacity: opacity,
      cssClass: cssClass,
      inlineStyle: inlineStyle,
      transformAttributes: ops.isEmpty ? null : SvgTransformAttributes(ops),
    );

    return children.map((SvgElement child) => child.toPaintCommands(innerContext)).combine().map((
      List<PaintCommand> childCommands,
    ) {
      return <PaintCommand>[DrawGroup(commands: childCommands, style: style, id: id)];
    });
  }
}

extension _SvgGroupToPaintCommands on SvgGroup {
  Result<List<PaintCommand>> _toPaintCommands(SvgPaintingContext context) {
    // Determine if we should use saveLayer (group opacity) or flattening (multiplication).
    final double groupOpacity = opacity?.resolve(context, SvgOrientation.unit) ?? 1.0;
    final bool useSaveLayer = groupOpacity < 1.0 && children.length > 1;

    final double finalGroupOpacity = useSaveLayer ? groupOpacity : 1.0;

    final PaintingStyle style = resolvePaint(
      context,
      id: id,
      tagName: 'g',
      fillAttributes: fillAttributes,
      strokeAttributes: strokeAttributes,
      fontAttributes: fontAttributes,
      opacity: opacity,
      cssClass: cssClass,
      inlineStyle: inlineStyle,
      transformAttributes: transformAttributes,
    );

    return children.map((SvgElement child) => child.toPaintCommands(context)).combine().map((
      List<PaintCommand> childCommands,
    ) {
      return <PaintCommand>[
        DrawGroup(commands: childCommands, style: style, id: id, opacity: finalGroupOpacity),
      ];
    });
  }
}
