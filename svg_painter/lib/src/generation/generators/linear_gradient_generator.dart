import '../../painting_model/_painting_model.dart';
import '../command_generator.dart';
import '../flutter_color_map.dart';
import '../generator_buffer.dart';
import '../models.dart';
import '../palette_analyzer.dart';

class LinearGradientGenerator extends CommandGenerator<DefineLinearGradient> {
  const LinearGradientGenerator();

  @override
  void generate(
    DefineLinearGradient command,
    GeneratorBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
  }) {
    final String varName = '_grad_${command.id}';

    buffer.writeBlock('final Gradient $varName = LinearGradient(', () {
      buffer.writeln('begin: Alignment(${command.x1 * 2 - 1}, ${command.y1 * 2 - 1}),');
      buffer.writeln('end: Alignment(${command.x2 * 2 - 1}, ${command.y2 * 2 - 1}),');

      buffer.writeBlock('colors: <Color>[', () {
        for (final GradientStop stop in command.stops) {
          final int alpha = (stop.opacity * 255).round().clamp(0, 255);
          final int combinedColor = (stop.colorArgb & 0x00FFFFFF) | (alpha << 24);
          final String colorCode = FlutterColorMap.getColorCode(combinedColor);
          buffer.writeln('$colorCode,');
        }
      }, footer: '],');
      buffer.writeBlock('stops: <double>[', () {
        for (final GradientStop stop in command.stops) {
          buffer.writeln('${stop.offset},');
        }
      }, footer: '],');

      final String tileMode = switch (command.spreadMethod) {
        PaintingSpreadMethod.pad => 'TileMode.clamp',
        PaintingSpreadMethod.reflect => 'TileMode.mirror',
        PaintingSpreadMethod.repeat => 'TileMode.repeated',
      };
      buffer.writeln('tileMode: $tileMode,');
    }, footer: ');');
  }
}
