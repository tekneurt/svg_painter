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
import '../svg_transform_parser.dart';
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
      // Prefer explicit absolute width/height for the intrinsic viewport size.
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

      // Root context: parent transform maps (minX, minY) to (0, 0) in the painter's canvas.
      // Note: _toPaintCommands will handle the viewBox (minX, minY) -> (0, 0) mapping.
      final SvgPaintingContext rootContext = SvgPaintingContext(
        viewBoxWidth: width,
        viewBoxHeight: height,
        viewBoxMinX: minX,
        viewBoxMinY: minY,
        inheritedFill: self.fillAttributes?.color,
        inheritedFillOpacity: self.fillAttributes?.opacity,
        inheritedStroke: self.strokeAttributes?.color,
        inheritedStrokeOpacity: self.strokeAttributes?.opacity,
        inheritedStrokeWidth: self.strokeAttributes?.width,
        inheritedStrokeDasharray: self.strokeAttributes?.dashArray,
        inheritedStrokeLinecap: self.strokeAttributes?.linecap,
        inheritedStrokeLinejoin: self.strokeAttributes?.linejoin,
        // Opacity on root element.
        parentOpacity:
            self.opacity?.resolve(
              const SvgPaintingContext(viewBoxWidth: 1, viewBoxHeight: 1),
              SvgOrientation.unit,
            ) ??
            1.0,
        inheritedFontSize: self.fontAttributes?.size,
        inheritedFontWeight: self.fontAttributes?.weight,
        inheritedFontStyle: self.fontAttributes?.style,
        inheritedFontFamily: self.fontAttributes?.family,
        styleSheet: self.styleSheet,
        definitions: definitions,
      );
      return self._toPaintCommands(rootContext);
    }

    context ??= const SvgPaintingContext(viewBoxWidth: 100.0, viewBoxHeight: 100.0);

    // Determine context for children (override inherited with current element styles)
    final SvgPaintingContext childContext;
    if (self is SvgGraphicsElement) {
      final SvgFontAttributes? font = self is SvgFontAttributable
          ? (self as SvgFontAttributable).fontAttributes
          : null;
      childContext = context.derive(
        inheritedFill: self.fillAttributes?.color ?? context.inheritedFill,
        inheritedFillOpacity: self.fillAttributes?.opacity ?? context.inheritedFillOpacity,
        inheritedStroke: self.strokeAttributes?.color ?? context.inheritedStroke,
        inheritedStrokeOpacity: self.strokeAttributes?.opacity ?? context.inheritedStrokeOpacity,
        inheritedStrokeWidth: self.strokeAttributes?.width ?? context.inheritedStrokeWidth,
        inheritedStrokeDasharray:
            self.strokeAttributes?.dashArray ?? context.inheritedStrokeDasharray,
        inheritedStrokeLinecap: self.strokeAttributes?.linecap ?? context.inheritedStrokeLinecap,
        inheritedStrokeLinejoin: self.strokeAttributes?.linejoin ?? context.inheritedStrokeLinejoin,
        // Multiply parent opacity with current element opacity.
        parentOpacity:
            context.parentOpacity * (self.opacity?.resolve(context, SvgOrientation.unit) ?? 1.0),
        inheritedFontSize: font?.size ?? context.inheritedFontSize,
        inheritedFontWeight: font?.weight ?? context.inheritedFontWeight,
        inheritedFontStyle: font?.style ?? context.inheritedFontStyle,
        inheritedFontFamily: font?.family ?? context.inheritedFontFamily,
      );
    } else {
      childContext = context;
    }

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
      final SvgStyle _ => const Success<List<PaintCommand>>(<PaintCommand>[]),

      // Safety fallback
      _ => const Success<List<PaintCommand>>(<PaintCommand>[]),
    };
  }
}

extension _SvgUseToPaintCommands on SvgUse {
  Result<List<PaintCommand>> _toPaintCommands(SvgPaintingContext context) {
    // 1. Resolve ID from href (remove leading #)
    final String targetId = href.startsWith('#') ? href.substring(1) : href;

    // 2. Lookup definition
    final SvgElement? target = context.definitions[targetId];
    if (target == null) {
      return Failure<List<PaintCommand>>(
        'Could not find definition for ID "$targetId" referenced by <use>.',
      );
    }

    // 3. Apply x/y translation (relative to current user space)
    final double dx = x.resolve(context, SvgOrientation.horizontal);
    final double dy = y.resolve(context, SvgOrientation.vertical);

    // Create context for target, preserving inherited styles.
    // Note: <use> offsets the origin by (dx, dy) in the current space.
    final SvgPaintingContext useCtx = context.derive(
      parentTx: context.parentTx + (dx * context.parentSx),
      parentTy: context.parentTy + (dy * context.parentSy),
      inheritedFill: fillAttributes?.color ?? context.inheritedFill,
      inheritedFillOpacity: fillAttributes?.opacity ?? context.inheritedFillOpacity,
      inheritedStroke: strokeAttributes?.color ?? context.inheritedStroke,
      inheritedStrokeOpacity: strokeAttributes?.opacity ?? context.inheritedStrokeOpacity,
      inheritedStrokeWidth: strokeAttributes?.width ?? context.inheritedStrokeWidth,
      inheritedStrokeLinecap: strokeAttributes?.linecap ?? context.inheritedStrokeLinecap,
      inheritedStrokeLinejoin: strokeAttributes?.linejoin ?? context.inheritedStrokeLinejoin,
      inheritedFontSize: fontAttributes?.size ?? context.inheritedFontSize,
      inheritedFontWeight: fontAttributes?.weight ?? context.inheritedFontWeight,
      inheritedFontStyle: fontAttributes?.style ?? context.inheritedFontStyle,
      inheritedFontFamily: fontAttributes?.family ?? context.inheritedFontFamily,
    );

    return target.toPaintCommands(useCtx);
  }
}

extension _SvgDefsToPaintCommands on SvgDefs {
  Result<List<PaintCommand>> _toPaintCommands(SvgPaintingContext context) {
    return children.map((SvgElement child) => child.toPaintCommands(context)).combine().map((
      List<PaintCommand> commands,
    ) {
      // Only include definition commands (Gradients), exclude drawing commands
      return commands
          .where((PaintCommand cmd) => cmd is DefineLinearGradient || cmd is DefineRadialGradient)
          .toList();
    });
  }
}

extension _SvgSvgToPaintCommands on SvgSvg {
  Result<List<PaintCommand>> _toPaintCommands(SvgPaintingContext context) {
    // 1. Resolve viewport geometry (relative to parent coordinate system)
    final double xVal = (x ?? const SvgLength(0.0)).resolve(context, SvgOrientation.horizontal);
    final double yVal = (y ?? const SvgLength(0.0)).resolve(context, SvgOrientation.vertical);

    final double wVal =
        width?.resolveOrNull(context, SvgOrientation.horizontal) ?? context.viewBoxWidth;
    final double hVal =
        height?.resolveOrNull(context, SvgOrientation.vertical) ?? context.viewBoxHeight;

    // ViewBox establishes the internal coordinate system mapping.
    final double vbW = viewBox?.width ?? wVal;
    final double vbH = viewBox?.height ?? hVal;
    final double vbMinX = viewBox?.minX ?? 0.0;
    final double vbMinY = viewBox?.minY ?? 0.0;

    // Scale factors to map viewBox to the viewport rectangle.
    final double sx = wVal / vbW;
    final double sy = hVal / vbH;

    final double newSx = context.parentSx * sx;
    final double newSy = context.parentSy * sy;

    // newTx = screen position where internal coord (vbMinX, vbMinY) maps to screen point (x, y).
    // P_screen = (P_inner - vbMinX) * newSx + screenX
    //          = P_inner * newSx + screenX - vbMinX * newSx
    final double screenX = (xVal * context.parentSx) + context.parentTx;
    final double screenY = (yVal * context.parentSy) + context.parentTy;

    final double newTx = screenX - (vbMinX * newSx);
    final double newTy = screenY - (vbMinY * newSy);

    final SvgPaintingContext innerContext = context.derive(
      viewBoxWidth: vbW,
      viewBoxHeight: vbH,
      viewBoxMinX: vbMinX,
      viewBoxMinY: vbMinY,
      parentTx: newTx,
      parentTy: newTy,
      parentSx: newSx,
      parentSy: newSy,
      inheritedFill: fillAttributes?.color ?? context.inheritedFill,
      inheritedFillOpacity: fillAttributes?.opacity ?? context.inheritedFillOpacity,
      inheritedStroke: strokeAttributes?.color ?? context.inheritedStroke,
      inheritedStrokeOpacity: strokeAttributes?.opacity ?? context.inheritedStrokeOpacity,
      inheritedStrokeWidth: strokeAttributes?.width ?? context.inheritedStrokeWidth,
      inheritedStrokeLinecap: strokeAttributes?.linecap ?? context.inheritedStrokeLinecap,
      inheritedStrokeLinejoin: strokeAttributes?.linejoin ?? context.inheritedStrokeLinejoin,
      inheritedFontSize: fontAttributes?.size ?? context.inheritedFontSize,
      inheritedFontWeight: fontAttributes?.weight ?? context.inheritedFontWeight,
      inheritedFontStyle: fontAttributes?.style ?? context.inheritedFontStyle,
      inheritedFontFamily: fontAttributes?.family ?? context.inheritedFontFamily,
    );

    return children.map((SvgElement child) => child.toPaintCommands(innerContext)).combine();
  }
}

extension _SvgGroupToPaintCommands on SvgGroup {
  Result<List<PaintCommand>> _toPaintCommands(SvgPaintingContext context) {
    // Determine if we should use saveLayer (group opacity) or flattening (multiplication).
    // context.parentOpacity already contains the accumulated opacity including this group's opacity.
    final double combinedOpacity = context.parentOpacity;
    final bool useSaveLayer = combinedOpacity < 1.0 && children.length > 1;

    final double groupOpacity = useSaveLayer ? combinedOpacity : 1.0;
    final double childParentOpacity = useSaveLayer ? 1.0 : combinedOpacity;

    // Create a new context for children if we need to reset opacity for layering.
    final SvgPaintingContext childContext = useSaveLayer
        ? context.derive(parentOpacity: childParentOpacity)
        : context;

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
    );

    return children.map((SvgElement child) => child.toPaintCommands(childContext)).combine().map((
      List<PaintCommand> childCommands,
    ) {
      return <PaintCommand>[
        DrawGroup(
          commands: childCommands,
          style: style,
          id: id,
          transform: SvgTransformParser.scaleTransform(
            transform,
            context.parentSx,
            context.parentSy,
          ),
          opacity: groupOpacity,
        ),
      ];
    });
  }
}
