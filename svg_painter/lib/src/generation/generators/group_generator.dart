import '../../painting_model/_painting_model.dart';
import '../command_generator.dart';
import '../generator_buffer.dart';
import '../models.dart';
import '../palette_analyzer.dart';
import '../shape_generator.dart';
import '../svg_id_formatter.dart';

class GroupGenerator extends ShapeGenerator<DrawGroup> {
  const GroupGenerator();

  @override
  void generate(
    DrawGroup command,
    GeneratorBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
    String? painterClassName,
    Set<String>? gradientsNeedingStretch,
  }) {
    if (generators == null) {
      return;
    }
    wrapWithStyle(buffer, command.style, () {
      // Use command.opacity (calculated during conversion) for saveLayer.
      // We DO NOT multiply with command.style.groupOpacity here because the group's
      // resolved opacity is already accounted for in the DrawGroup command's opacity field
      // when useSaveLayer is true. If we multiplied them, we'd apply it twice.
      final double effectiveOpacity = command.opacity;
      final bool useLayer = effectiveOpacity < 1.0;

      if (useLayer) {
        final String hexOpacity =
            (effectiveOpacity * 255).round().toRadixString(16).padLeft(2, '0').toUpperCase();
        buffer.writeln('canvas.saveLayer(null, Paint()..color = const Color(0x${hexOpacity}FFFFFF));');
      }

      List<InheritedProperty> nextInheritedFills = List<InheritedProperty>.from(
        inheritedFills ?? <InheritedProperty>[],
      );
      List<InheritedProperty> nextInheritedStrokes = List<InheritedProperty>.from(
        inheritedStrokes ?? <InheritedProperty>[],
      );

      final String? id = command.id;
      final String suffix = id != null ? SvgIdFormatter.format(id) : '';

      // Resolve overrides
      final PaintingFillStyle? fill = command.style.fill;
      if (fill != null) {
        final String propName = '${suffix}Fill';
        final String? assignedProp = palette?.fillAssignments[command];
        final String? activeProp =
            activeFillProperties?[propName] ?? activeFillProperties?[assignedProp];

        if (activeProp != null) {
          nextInheritedFills.add(
            InheritedProperty(activeProp, colorArgb: fill.colorArgb, shaderId: fill.shaderId),
          );
        } else if (inheritedFills != null) {
          // Check for existing inheritance.
          bool foundMatch = false;
          for (final InheritedProperty prop in inheritedFills.reversed) {
            final bool match =
                (fill.shaderId != null && prop.shaderId == fill.shaderId) ||
                (fill.colorArgb != null && prop.colorArgb == fill.colorArgb);
            if (match) {
              foundMatch = true;
              break;
            }
          }
          if (!foundMatch) {
            // Group style exists but doesn't match parent, and it's not mapped to an active prop.
            // This means we stop inheriting.
            nextInheritedFills = <InheritedProperty>[];
          }
        }
      }

      final PaintingStrokeStyle? stroke = command.style.stroke;
      if (stroke != null) {
        final String propName = '${suffix}Stroke';
        final String? assignedProp = palette?.strokeAssignments[command];
        final String? activeProp =
            activeStrokeProperties?[propName] ?? activeStrokeProperties?[assignedProp];

        if (activeProp != null) {
          nextInheritedStrokes.add(
            InheritedProperty(activeProp, colorArgb: stroke.colorArgb, shaderId: stroke.shaderId),
          );
        } else if (inheritedStrokes != null) {
          bool foundMatch = false;
          for (final InheritedProperty prop in inheritedStrokes.reversed) {
            final bool match =
                (stroke.shaderId != null && prop.shaderId == stroke.shaderId) ||
                (stroke.colorArgb != null && prop.colorArgb == stroke.colorArgb);
            if (match) {
              foundMatch = true;
              break;
            }
          }
          if (!foundMatch) {
            nextInheritedStrokes = <InheritedProperty>[];
          }
        }
      }

      for (final PaintCommand child in command.commands) {
        generators[child.runtimeType]?.generate(
          child,
          buffer,
          generators: generators,
          palette: palette,
          activeFillProperties: activeFillProperties,
          activeStrokeProperties: activeStrokeProperties,
          inheritedFills: nextInheritedFills,
          inheritedStrokes: nextInheritedStrokes,
          painterClassName: painterClassName,
          gradientsNeedingStretch: gradientsNeedingStretch,
        );
      }

      if (useLayer) {
        buffer.writeln('canvas.restore();');
      }
    });
  }
}
