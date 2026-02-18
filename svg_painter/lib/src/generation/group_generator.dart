import '../painting_model/_painting_model.dart';
import 'command_generator.dart';

import 'palette_analyzer.dart';
import 'svg_id_formatter.dart';

/// Generator for [DrawGroup] commands.
class GroupGenerator extends ShapeGenerator<DrawGroup> {
  const GroupGenerator();

  @override
  void generate(
    DrawGroup command,
    StringBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
  }) {
    if (generators == null) {
      // This should ideally not happen if properly wired.
      return;
    }

    wrapWithTransform(buffer, command.style.transformAttributes, () {
      if (command.opacity == 1.0) {
        // Full opacity, no layer needed
      } else {
        buffer.writeln('      canvas.saveLayer(');
        buffer.writeln('        null,');
        buffer.writeln(
          '        Paint()..color = Color.fromRGBO(255, 255, 255, ${command.opacity}),',
        );
        buffer.writeln('      );');
      }

      // Prepare inherited properties for children
      final List<InheritedProperty> nextInheritedFills = inheritedFills != null
          ? List<InheritedProperty>.of(inheritedFills)
          : <InheritedProperty>[];
      final List<InheritedProperty> nextInheritedStrokes = inheritedStrokes != null
          ? List<InheritedProperty>.of(inheritedStrokes)
          : <InheritedProperty>[];

      final String? id = command.id;
      final PaintingStyle style = command.style;

      // Check Fill inheritance
      final PaintingFillStyle? fill = style.fill;
      if (id != null && (fill?.isExplicit ?? false)) {
        final String propName = '${SvgIdFormatter.format(id)}Fill';
        if (activeFillProperties != null && activeFillProperties.containsKey(propName)) {
          final String mappedName = activeFillProperties[propName]!;
          final int? argb = fill?.colorArgb;
          if (argb != null) {
            nextInheritedFills.add(InheritedProperty(mappedName, argb));
          }
        }
      }

      // Check Stroke inheritance
      final PaintingStrokeStyle? stroke = style.stroke;
      if (id != null && (stroke?.isExplicit ?? false)) {
        final String propName = '${SvgIdFormatter.format(id)}Stroke';
        if (activeStrokeProperties != null && activeStrokeProperties.containsKey(propName)) {
          final String mappedName = activeStrokeProperties[propName]!;
          final int? argb = stroke?.colorArgb;
          if (argb != null) {
            nextInheritedStrokes.add(InheritedProperty(mappedName, argb));
          }
        }
      }

      for (final PaintCommand child in command.commands) {
        // Find generator for child type
        final CommandGenerator<PaintCommand>? generator = generators[child.runtimeType];
        if (generator == null) {
          throw StateError('No generator found for command type ${child.runtimeType}');
        } else {
          generator.generate(
            child,
            buffer,
            generators: generators,
            palette: palette,
            activeFillProperties: activeFillProperties,
            activeStrokeProperties: activeStrokeProperties,
            inheritedFills: nextInheritedFills,
            inheritedStrokes: nextInheritedStrokes,
          );
        }
      }

      if (command.opacity == 1.0) {
        // No restore needed
      } else {
        buffer.writeln('      canvas.restore();');
      }
    });
  }
}
