import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import 'svg_painting_context.dart';
import 'svg_to_painting.dart';

/// Extension for <defs> element conversion.
extension SvgDefsToPaintCommands on SvgDefs {
  /// Converts this [SvgDefs] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommandsDefs(SvgPaintingContext context) {
    final SvgPaintingContext defsContext = context.derive(isDefinition: true);
    return children
        .map((SvgElement child) => child.toPaintCommands(defsContext))
        .combine()
        .map(_flattenDefinitions);
  }

  static List<PaintCommand> _flattenDefinitions(List<PaintCommand> commands) {
    final result = <PaintCommand>[];
    for (final cmd in commands) {
      if (cmd is DefineCommand) {
        result.add(cmd);
      } else if (cmd is DrawGroup) {
        result.addAll(_flattenDefinitions(cmd.commands));
      }
    }
    return result;
  }
}
