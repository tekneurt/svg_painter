import '../../base/_base.dart';
import '../../painting_model/paint_command.dart';

import '../../svg_model/_svg_model.dart';
import '../svg_element_extensions/svg_circle_to_draw_circle.dart';
import '../svg_element_extensions/svg_ellipse_to_draw_oval.dart';
import '../svg_value_extensions/svg_length_to_double.dart';
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

      final SvgPaintingContext rootContext = SvgPaintingContext(
        viewBoxWidth: width,
        viewBoxHeight: height,
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
      (_) => Success<List<PaintCommand>>(<PaintCommand>[]),
    };
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
