import '../../base/_base.dart';
import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../command_generator.dart';
import '../generator_buffer.dart';
import '../models.dart';
import '../palette_analyzer.dart';

/// Generator for [DefineMask] commands.
class MaskGenerator extends CommandGenerator<DefineMask> {
  const MaskGenerator();

  @override
  void generate(
    DefineMask command,
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

    buffer.writeBlock(
      'void _mask_${command.id}(Canvas canvas, Size size, Rect targetBounds) {',
      () {
        final isContentOBox = command.maskContentUnits == PaintingGradientUnits.objectBoundingBox;
        final isMaskOBox = command.maskUnits == PaintingGradientUnits.objectBoundingBox;

        // 1. Resolve mask region
        final String mx, my, mw, mh;

        String resolveVal(SvgLengthPercentage val, bool isOBox, SvgOrientation orientation) {
          if (val is SvgPercentage) {
            final double fraction = val.value / 100.0;
            if (isOBox) {
              return '$fraction';
            }
            final total =
                orientation == SvgOrientation.horizontal ? 'viewBox.width' : 'viewBox.height';
            return '($fraction * $total)';
          } else if (val is SvgLength) {
            return '${val.value}';
          }
          return '0.0';
        }

      if (isMaskOBox) {
        mx = 'targetBounds.left + (${resolveVal(command.x, true, SvgOrientation.horizontal)} * targetBounds.width)';
        my = 'targetBounds.top + (${resolveVal(command.y, true, SvgOrientation.vertical)} * targetBounds.height)';
        mw = '(${resolveVal(command.width as SvgLengthPercentage, true, SvgOrientation.horizontal)} * targetBounds.width)';
        mh = '(${resolveVal(command.height as SvgLengthPercentage, true, SvgOrientation.vertical)} * targetBounds.height)';
      } else {
        mx = resolveVal(command.x, false, SvgOrientation.horizontal);
        my = resolveVal(command.y, false, SvgOrientation.vertical);
        mw = resolveVal(command.width as SvgLengthPercentage, false, SvgOrientation.horizontal);
        mh = resolveVal(command.height as SvgLengthPercentage, false, SvgOrientation.vertical);
      }

      // 2. Apply mask region clip
      buffer.writeln('canvas.clipRect(Rect.fromLTWH($mx, $my, $mw, $mh));');

      // 3. Handle content coordinate system
      if (isContentOBox) {
        buffer.writeln('canvas.save();');
        buffer.writeln('canvas.translate(targetBounds.left, targetBounds.top);');
        buffer.writeln('canvas.scale(targetBounds.width, targetBounds.height);');
      }

      for (final PaintCommand child in command.commands) {
        generators[child.runtimeType]?.generate(
          child,
          buffer,
          generators: generators,
          palette: palette,
          activeFillProperties: activeFillProperties,
          activeStrokeProperties: activeStrokeProperties,
          inheritedFills: inheritedFills,
          inheritedStrokes: inheritedStrokes,
          painterClassName: painterClassName,
          gradientsNeedingStretch: gradientsNeedingStretch,
        );
      }

      if (isContentOBox) {
        buffer.writeln('canvas.restore();');
      }
    });
  }
}
