import '../../painting_model/_painting_model.dart';
import '../command_generator.dart';
import '../flutter_color_map.dart';
import '../generator_buffer.dart';
import '../models.dart';
import '../palette_analyzer.dart';

class RadialGradientGenerator extends CommandGenerator<DefineRadialGradient> {
  const RadialGradientGenerator();

  @override
  void generate(
    DefineRadialGradient command,
    GeneratorBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
  }) {
    final String varName = '_grad_${command.id}';
    buffer.writeBlock('final Gradient $varName = RadialGradient(', () {
      buffer.writeln('center: Alignment(${command.cx * 2 - 1}, ${command.cy * 2 - 1}),');
      buffer.writeln('radius: ${command.radius},');
      buffer.writeln('focal: Alignment(${command.fx * 2 - 1}, ${command.fy * 2 - 1}),');
      if (command.focalRadius != 0) {
        buffer.writeln('focalRadius: ${command.focalRadius},');
      }
      buffer.writeBlock('colors: <Color>[', () {
        for (final GradientStop stop in command.stops) {
          final String colorCode = FlutterColorMap.getColorCode(stop.colorArgb);
          buffer.writeln('$colorCode,');
        }
      }, footer: '],');
      buffer.writeBlock('stops: <double>[', () {
        for (final GradientStop stop in command.stops) {
          buffer.writeln('${stop.offset},');
        }
      }, footer: '],');
    }, footer: ');');
  }
}
