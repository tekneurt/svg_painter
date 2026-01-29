import '../painting_model/_painting_model.dart';
import 'command_generator.dart';
import 'flutter_color_map.dart';

class LinearGradientGenerator extends CommandGenerator<DefineLinearGradient> {
  const LinearGradientGenerator();

  @override
  void generate(
    DefineLinearGradient command,
    StringBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
  }) {
    final String colors =
        '[${command.stops.map((GradientStop s) => FlutterColorMap.getColorCode(s.colorArgb)).join(', ')}]';
    final String stops =
        '[${command.stops.map((GradientStop s) => s.offset.toString()).join(', ')}]';
    final String transform = command.transform == 'rotate(90)'
        ? 'transform: const GradientRotation(3.141592653589793 / 2),'
        : '';

    buffer.writeln(
      '    final Gradient _grad_${command.id} = LinearGradient(begin: Alignment(${command.x1 * 2 - 1}, ${command.y1 * 2 - 1}), end: Alignment(${command.x2 * 2 - 1}, ${command.y2 * 2 - 1}), colors: $colors, stops: $stops, $transform);',
    );
  }
}
