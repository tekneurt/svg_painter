import '../../base/_base.dart';
import '../../painting_model/paint_command.dart';

import '../../svg_model/_svg_model.dart';
import '../svg_element_extensions/svg_circle_to_draw_circle.dart';

/// Extension to convert [SvgElement] to [PaintCommand]s.
extension SvgToPainting on SvgElement {
  /// Converts this [SvgElement] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands() {
    return switch (this) {
      final SvgSvg container => container._toPaintCommands(),
      final SvgCircle circle => circle.toDrawCircle().map((DrawCircle cmd) => <PaintCommand>[cmd]),
    };
  }
}

extension _SvgSvgToPainting on SvgSvg {
  Result<List<PaintCommand>> _toPaintCommands() {
    final List<PaintCommand> commands = <PaintCommand>[];

    for (final SvgElement child in children) {
      final Result<List<PaintCommand>> result = child.toPaintCommands();

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
