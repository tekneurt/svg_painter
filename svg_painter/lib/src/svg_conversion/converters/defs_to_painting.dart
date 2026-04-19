import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import 'svg_painting_context.dart';
import 'svg_to_painting.dart';

/// Extension for <defs> element conversion.
extension SvgDefsToPaintCommands on SvgDefs {
  /// Converts this [SvgDefs] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommandsDefs(SvgPaintingContext context) {
    return children.map((SvgElement child) => child.toPaintCommands(context)).combine().map((
      List<PaintCommand> commands,
    ) {
      return commands
          .where((PaintCommand cmd) => cmd is DefineLinearGradient || cmd is DefineRadialGradient)
          .toList();
    });
  }
}
