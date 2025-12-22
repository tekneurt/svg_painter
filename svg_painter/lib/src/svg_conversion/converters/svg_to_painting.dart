import '../../base/_base.dart';
import '../../painting_model/paint_command.dart';

import '../../svg_model/_svg_model.dart';
import '../svg_element_extensions/svg_circle_to_draw_circle.dart';
import '../svg_element_extensions/svg_ellipse_to_draw_oval.dart';
import '../svg_element_extensions/svg_gradient_to_painting.dart';
import '../svg_element_extensions/svg_line_to_draw_line.dart';
import '../svg_element_extensions/svg_polygon_to_draw_polygon.dart';
import '../svg_element_extensions/svg_polyline_to_draw_polyline.dart';
import '../svg_element_extensions/svg_rect_to_draw_rect.dart';
import '../svg_value_extensions/svg_length_to_double.dart';
import 'svg_definition_collector.dart';
import 'svg_painting_context.dart';

/// Extension to convert [SvgElement] to [PaintCommand]s.
extension SvgToPainting on SvgElement {
  /// Converts this [SvgElement] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands([SvgPaintingContext? context]) {
    final SvgElement self = this;
    if (self is SvgRoot) {
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

      final SvgPaintingContext rootContext = SvgPaintingContext(
        viewBoxWidth: width,
        viewBoxHeight: height,
        viewBoxMinX: minX,
        viewBoxMinY: minY,
        definitions: definitions,
      );
      return self._toPaintCommands(rootContext);
    }

    if (context == null) {
      // Fallback context if none provided and not SvgRoot
      context = const SvgPaintingContext(viewBoxWidth: 100.0, viewBoxHeight: 100.0);
    }

    return switch (self) {
      final SvgSvg container => container._toPaintCommands(context),
      final SvgCircle circle => circle
          .toDrawCircle(context)
          .map((DrawCircle cmd) => <PaintCommand>[cmd]),
      final SvgEllipse ellipse => ellipse
          .toDrawOval(context)
          .map((DrawOval cmd) => <PaintCommand>[cmd]),
      final SvgRect rect => rect
          .toDrawRect(context)
          .map((DrawRect cmd) => <PaintCommand>[cmd]),
      final SvgLine line => line
          .toDrawLine(context)
          .map((DrawLine cmd) => <PaintCommand>[cmd]),
      final SvgPolyline polyline => polyline
          .toDrawPolyline(context)
          .map((DrawPolyline cmd) => <PaintCommand>[cmd]),
      final SvgPolygon polygon => polygon
          .toDrawPolygon(context)
          .map((DrawPolygon cmd) => <PaintCommand>[cmd]),
      final SvgDefs defs => defs._toPaintCommands(context),
      final SvgRadialGradient radialGradient => radialGradient
          .toPaintCommand(context)
          .map((DefineRadialGradient cmd) => <PaintCommand>[cmd]),
      final SvgLinearGradient linearGradient => linearGradient
          .toPaintCommand(context)
          .map((DefineLinearGradient cmd) => <PaintCommand>[cmd]),
      (_) => Success<List<PaintCommand>>(<PaintCommand>[]),
    };
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
          commands.addAll(value);
        },
      );
    }

    return Success<List<PaintCommand>>(commands);
  }
}

extension _SvgSvgToPainting on SvgSvg {
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
          commands.addAll(value);
        },
      );
    }

    return Success<List<PaintCommand>>(commands);
  }
}
