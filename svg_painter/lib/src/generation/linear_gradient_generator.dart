import '../painting_model/_painting_model.dart';
import '../svg_model/_svg_model.dart';
import 'command_generator.dart';
import 'flutter_color_map.dart';

import 'palette_analyzer.dart';

class LinearGradientGenerator extends CommandGenerator<DefineLinearGradient> {
  const LinearGradientGenerator();

  @override
  void generate(
    DefineLinearGradient command,
    StringBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
  }) {
    if (command.stops.isEmpty) {
      return;
    }
    // ...
    final String colors =
        '[${command.stops.map((GradientStop s) => FlutterColorMap.getColorCode(s.colorArgb)).join(', ')}]';
    final String stops =
        '[${command.stops.map((GradientStop s) => s.offset.toString()).join(', ')}]';
    
    bool isRot90 = false;
    final SvgTransformAttributes? ta = command.transformAttributes;
    if (ta != null && ta.operations.length == 1) {
      final SvgTransformOperation op = ta.operations[0];
      if (op is SvgRotate && op.angle == 90.0) {
        isRot90 = true;
      }
    }

    final String transform = isRot90
        ? 'transform: const GradientRotation(3.141592653589793 / 2),'
        : '';

    buffer.writeln(
      '    final Gradient _grad_${command.id} = LinearGradient(begin: Alignment(${command.x1 * 2 - 1}, ${command.y1 * 2 - 1}), end: Alignment(${command.x2 * 2 - 1}, ${command.y2 * 2 - 1}), colors: $colors, stops: $stops, $transform);',
    );
  }
}
