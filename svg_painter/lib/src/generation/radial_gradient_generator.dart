import '../painting_model/_painting_model.dart';
import 'command_generator.dart';

class RadialGradientGenerator extends CommandGenerator<DefineRadialGradient> {
  const RadialGradientGenerator();

  @override
  void generate(DefineRadialGradient command, StringBuffer buffer) {
    final String colors =
        '[${command.stops.map((GradientStop s) => 'Color(0x${s.colorArgb.toRadixString(16).toUpperCase()})').join(', ')}]';
    final String stops = '[${command.stops.map((GradientStop s) => s.offset.toString()).join(', ')}]';
    final String transform = command.transform == 'rotate(90)'
        ? 'transform: const GradientRotation(3.141592653589793 / 2),'
        : '';

    buffer.writeln(
      '    final Gradient _grad_${command.id} = RadialGradient(center: Alignment(${command.cx * 2 - 1}, ${command.cy * 2 - 1}), radius: ${command.radius}, focal: Alignment(${command.fx * 2 - 1}, ${command.fy * 2 - 1}), focalRadius: ${command.focalRadius}, colors: $colors, stops: $stops, $transform);',
    );
  }
}
