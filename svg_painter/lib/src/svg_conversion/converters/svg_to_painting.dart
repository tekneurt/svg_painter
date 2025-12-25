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
      // Establish context from SvgRoot
      final double width =
          self.viewBox?.width ??
          (switch (self.width) {
            final SvgLength l => l.toDouble(),
            _ => 100.0,
          });
      final double height =
          self.viewBox?.height ??
          (switch (self.height) {
            final SvgLength l => l.toDouble(),
            _ => 100.0,
          });

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
        parentTx: 0.0,
        parentTy: 0.0,
        parentSx: 1.0,
        parentSy: 1.0,
        inheritedFill: self.fill,
        inheritedStroke: self.stroke,
        inheritedStrokeWidth: self.strokeWidth,
        definitions: definitions,
      );
      return self._toPaintCommands(rootContext);
    }

    context ??= const SvgPaintingContext(viewBoxWidth: 100.0, viewBoxHeight: 100.0);

    // Determine context for children (override inherited with current element styles)
    final SvgPaintingContext childContext = (self is SvgGraphicsElement)
        ? context.derive(
            inheritedFill: self.fill ?? context.inheritedFill,
            inheritedStroke: self.stroke ?? context.inheritedStroke,
            inheritedStrokeWidth: self.strokeWidth ?? context.inheritedStrokeWidth,
          )
        : context;

    return switch (self) {
      final SvgSvg container => container._toPaintCommands(childContext),
      final SvgCircle circle =>
        circle.toDrawCircle(childContext).map((DrawCircle cmd) => <PaintCommand>[cmd]),
      final SvgEllipse ellipse =>
        ellipse.toDrawOval(childContext).map((DrawOval cmd) => <PaintCommand>[cmd]),
      final SvgRect rect =>
        rect.toDrawRect(childContext).map((DrawRect cmd) => <PaintCommand>[cmd]),
      final SvgLine line =>
        line.toDrawLine(childContext).map((DrawLine cmd) => <PaintCommand>[cmd]),
      final SvgPath path =>
        path.toDrawPath(childContext).map((DrawPath cmd) => <PaintCommand>[cmd]),
      final SvgPolyline polyline =>
        polyline.toDrawPolyline(childContext).map((DrawPolyline cmd) => <PaintCommand>[cmd]),
      final SvgPolygon polygon =>
        polygon.toDrawPolygon(childContext).map((DrawPolygon cmd) => <PaintCommand>[cmd]),
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
      final SvgStop _ => const Success<List<PaintCommand>>(<PaintCommand>[]),
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
      inheritedStroke: stroke ?? context.inheritedStroke,
      inheritedStrokeWidth: strokeWidth ?? context.inheritedStrokeWidth,
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
      inheritedStroke: stroke ?? context.inheritedStroke,
      inheritedStrokeWidth: strokeWidth ?? context.inheritedStrokeWidth,
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