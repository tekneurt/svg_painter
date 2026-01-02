import '../../base/_base.dart';
import '../../painting_model/paint_command.dart';
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
import '../svg_value_extensions/svg_auto_to_double.dart';
import '../svg_value_extensions/svg_length_percentage_to_double.dart';
import '../svg_value_extensions/svg_length_to_double.dart';
import '../svg_value_extensions/svg_percentage_to_double.dart';
import 'svg_definition_collector.dart';
import 'svg_painting_context.dart';

/// Extension to convert [SvgElement] to [PaintCommand]s.
extension SvgToPainting on SvgElement {
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
        inheritedFill: self.fill,
        inheritedFillOpacity: self.fillOpacity,
        inheritedStroke: self.stroke,
        inheritedStrokeOpacity: self.strokeOpacity,
        inheritedStrokeWidth: self.strokeWidth,
        inheritedStrokeDasharray: self.strokeDasharray,
        inheritedStrokeLinecap: self.strokeLinecap,
        inheritedStrokeLinejoin: self.strokeLinejoin,
        // Opacity on root element.
        parentOpacity: self.opacity?.toDouble(
              const SvgPaintingContext(viewBoxWidth: 1, viewBoxHeight: 1),
              SvgOrientation.unit,
            ) ??
            1.0,
        inheritedFontSize: self.fontSize,
        inheritedFontWeight: self.fontWeight,
        inheritedFontStyle: self.fontStyle,
        inheritedFontFamily: self.fontFamily,
        styleSheet: self.styleSheet,
        definitions: definitions,
      );
      return self._toPaintCommands(rootContext);
    }

    context ??= const SvgPaintingContext(viewBoxWidth: 100.0, viewBoxHeight: 100.0);

    // Determine context for children (override inherited with current element styles)
    final SvgPaintingContext childContext = (self is SvgGraphicsElement)
        ? context.derive(
            inheritedFill: self.fill ?? context.inheritedFill,
            inheritedFillOpacity: self.fillOpacity ?? context.inheritedFillOpacity,
            inheritedStroke: self.stroke ?? context.inheritedStroke,
            inheritedStrokeOpacity: self.strokeOpacity ?? context.inheritedStrokeOpacity,
            inheritedStrokeWidth: self.strokeWidth ?? context.inheritedStrokeWidth,
            inheritedStrokeDasharray: self.strokeDasharray ?? context.inheritedStrokeDasharray,
            inheritedStrokeLinecap: self.strokeLinecap ?? context.inheritedStrokeLinecap,
            inheritedStrokeLinejoin: self.strokeLinejoin ?? context.inheritedStrokeLinejoin,
            // Multiply parent opacity with current element opacity.
            parentOpacity: context.parentOpacity *
                (self.opacity?.toDouble(context, SvgOrientation.unit) ?? 1.0),
            inheritedFontSize: self.fontSize ?? context.inheritedFontSize,
            inheritedFontWeight: self.fontWeight ?? context.inheritedFontWeight,
            inheritedFontStyle: self.fontStyle ?? context.inheritedFontStyle,
            inheritedFontFamily: self.fontFamily ?? context.inheritedFontFamily,
          )
        : context;

    return switch (self) {
      final SvgSvg container => container._toPaintCommands(childContext),
      final SvgCircle circle => circle.toPaintCommands(context),
      final SvgEllipse ellipse => ellipse.toPaintCommands(context),
      final SvgRect rect => rect.toPaintCommands(context),
      final SvgText text => text.toPaintCommands(context),
      final SvgGroup group => group._toPaintCommands(childContext),
      final SvgLine line => line.toPaintCommands(context),
      final SvgPath path => path.toPaintCommands(context),
      final SvgPolyline polyline => polyline.toPaintCommands(context),
      final SvgPolygon polygon => polygon.toPaintCommands(context),
      final SvgUse use => use._toPaintCommands(childContext),
      final SvgDefs defs => defs._toPaintCommands(childContext),
      final SvgRadialGradient radialGradient =>
        radialGradient
            .toPaintCommand(childContext)
            .map((DefineRadialGradient cmd) => <PaintCommand>[cmd]),
      final SvgLinearGradient linearGradient =>
        linearGradient
            .toPaintCommand(childContext)
            .map((DefineLinearGradient cmd) => <PaintCommand>[cmd]),
      final SvgStop _ || final SvgStyle _ => const Success<List<PaintCommand>>(<PaintCommand>[]),
    };
  }
}

extension _SvgUseToPainting on SvgUse {
  Result<List<PaintCommand>> _toPaintCommands(SvgPaintingContext context) {
    // 1. Resolve ID from href (remove leading #)
    final String targetId = href.startsWith('#') ? href.substring(1) : href;

    // 2. Lookup definition
    final SvgElement? target = context.definitions[targetId];
    if (target == null) {
      // TODO(Gemini): Handle missing references properly (logging/warning).
      return const Success<List<PaintCommand>>(<PaintCommand>[]); // Silently ignore missing refs?
    }

    // 3. Apply x/y translation (relative to current user space)
    final double dx = x.toDouble(context, SvgOrientation.horizontal);
    final double dy = y.toDouble(context, SvgOrientation.vertical);

    // Create context for target, preserving inherited styles.
    // Note: <use> offsets the origin by (dx, dy) in the current space.
    final SvgPaintingContext useCtx = context.derive(
      parentTx: context.parentTx + (dx * context.parentSx),
      parentTy: context.parentTy + (dy * context.parentSy),
      inheritedFill: fill ?? context.inheritedFill,
      inheritedFillOpacity: fillOpacity ?? context.inheritedFillOpacity,
      inheritedStroke: stroke ?? context.inheritedStroke,
      inheritedStrokeOpacity: strokeOpacity ?? context.inheritedStrokeOpacity,
      inheritedStrokeWidth: strokeWidth ?? context.inheritedStrokeWidth,
      inheritedStrokeLinecap: strokeLinecap ?? context.inheritedStrokeLinecap,
      inheritedStrokeLinejoin: strokeLinejoin ?? context.inheritedStrokeLinejoin,
    );

    return target.toPaintCommands(useCtx);
  }
}

extension _SvgDefsToPainting on SvgDefs {
  Result<List<PaintCommand>> _toPaintCommands(SvgPaintingContext context) {
    final List<PaintCommand> commands = <PaintCommand>[];

    for (final SvgElement child in children) {
      final Result<List<PaintCommand>> result = child.toPaintCommands(context);

      result.fold(
        (Failure<List<PaintCommand>> failure) {
          // TODO(Gemini): Handle failure.
          return <PaintCommand>[];
        },
        (List<PaintCommand> value) {
          // Only include definition commands (Gradients), exclude drawing commands
          commands.addAll(
            value.where(
              (PaintCommand cmd) => cmd is DefineLinearGradient || cmd is DefineRadialGradient,
            ),
          );
        },
      );
    }

    return Success<List<PaintCommand>>(commands);
  }
}

extension _SvgSvgToPainting on SvgSvg {
  Result<List<PaintCommand>> _toPaintCommands(SvgPaintingContext context) {
    // 1. Resolve viewport geometry (relative to parent coordinate system)
    final double xVal = (x ?? const SvgLength(0.0)).toDouble(context, SvgOrientation.horizontal);
    final double yVal = (y ?? const SvgLength(0.0)).toDouble(context, SvgOrientation.vertical);

    final double wVal =
        width?.toDoubleOrNull(context, SvgOrientation.horizontal) ?? context.viewBoxWidth;
    final double hVal =
        height?.toDoubleOrNull(context, SvgOrientation.vertical) ?? context.viewBoxHeight;

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
      inheritedFill: fill ?? context.inheritedFill,
      inheritedFillOpacity: fillOpacity ?? context.inheritedFillOpacity,
      inheritedStroke: stroke ?? context.inheritedStroke,
      inheritedStrokeOpacity: strokeOpacity ?? context.inheritedStrokeOpacity,
      inheritedStrokeWidth: strokeWidth ?? context.inheritedStrokeWidth,
      inheritedStrokeLinecap: strokeLinecap ?? context.inheritedStrokeLinecap,
      inheritedStrokeLinejoin: strokeLinejoin ?? context.inheritedStrokeLinejoin,
    );

    final List<PaintCommand> commands = <PaintCommand>[];

    for (final SvgElement child in children) {
      final Result<List<PaintCommand>> result = child.toPaintCommands(innerContext);

      result.fold(
        (Failure<List<PaintCommand>> failure) {
          // TODO(Gemini): Handle failure.
          return <PaintCommand>[];
        },
        (List<PaintCommand> value) {
          commands.addAll(value);
        },
      );
    }

    return Success<List<PaintCommand>>(commands);
  }
}

extension _SvgGroupToPainting on SvgGroup {
  Result<List<PaintCommand>> _toPaintCommands(SvgPaintingContext context) {
    // Determine if we should use saveLayer (group opacity) or flattening (multiplication).
    // context.parentOpacity already contains the accumulated opacity including this group's opacity.
    final double combinedOpacity = context.parentOpacity;
    final bool useSaveLayer = combinedOpacity < 1.0 && children.length > 1;

    final double groupOpacity = useSaveLayer ? combinedOpacity : 1.0;
    final double childParentOpacity = useSaveLayer ? 1.0 : combinedOpacity;

    // Create a new context for children if we need to reset opacity for layering.
    // If not layering, we technically don't need a new context if opacity is same,
    // but context.derive is cheap.
    final SvgPaintingContext childContext = useSaveLayer
        ? context.derive(parentOpacity: childParentOpacity)
        : context; // If flattening, context already has combinedOpacity.

    final List<PaintCommand> childCommands = <PaintCommand>[];

    for (final SvgElement child in children) {
      final Result<List<PaintCommand>> result = child.toPaintCommands(childContext);

      result.fold(
        (Failure<List<PaintCommand>> failure) {
          // TODO(Gemini): Handle failure.
        },
        (List<PaintCommand> value) {
          childCommands.addAll(value);
        },
      );
    }

    return Success<List<PaintCommand>>(<PaintCommand>[
      DrawGroup(
        commands: childCommands,
        transform: SvgTransformParser.scaleTransform(transform, context.parentSx, context.parentSy),
        groupOpacity: groupOpacity,
      ),
    ]);
  }
}
