import 'package:svg_painter_annotation/svg_painter_annotation.dart';

import '../../painting_model/_painting_model.dart';
import '../command_generator.dart';
import '../flutter_color_map.dart';
import '../generation_extensions.dart';
import '../generator_buffer.dart';
import '../models.dart';
import '../palette_analyzer.dart';
import '../svg_id_formatter.dart';

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
    String? painterClassName,
    Set<String>? gradientsNeedingStretch,
    SvgColorMapping colorMapping = SvgColorMapping.material,
    bool isInsideMarker = false,
  }) {
    generateWithAspectRatios(
      command,
      buffer,
      generators: generators,
      palette: palette,
      activeFillProperties: activeFillProperties,
      activeStrokeProperties: activeStrokeProperties,
      inheritedFills: inheritedFills,
      inheritedStrokes: inheritedStrokes,
      painterClassName: painterClassName,
      gradientsNeedingStretch: gradientsNeedingStretch,
      colorMapping: colorMapping,
      isInsideMarker: isInsideMarker,
    );
  }

  /// Generates radial gradient code with optional aspect ratio correction for non-square bounds.
  void generateWithAspectRatios(
    DefineRadialGradient command,
    GeneratorBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
    String? painterClassName,
    Set<String>? gradientsNeedingStretch,
    Map<String, ({double sx, double sy})>? gradientAspectRatios,
    SvgColorMapping colorMapping = SvgColorMapping.material,
    bool isInsideMarker = false,
  }) {
    final varName = '_grad_${SvgIdFormatter.sanitizeId(command.id)}';

    final bool needsStretch = gradientsNeedingStretch?.contains(command.id) ?? false;
    final ({double sx, double sy})? aspectRatio;
    if (needsStretch && command.units == PaintingGradientUnits.objectBoundingBox) {
      aspectRatio = gradientAspectRatios?[command.id];
    } else {
      aspectRatio = null;
    }
    final double sx = aspectRatio?.sx ?? 1.0;
    final double sy = aspectRatio?.sy ?? 1.0;
    final double centerAlignX = command.cx * 2 - 1;
    final double centerAlignY = command.cy * 2 - 1;
    final double focalAlignX = centerAlignX + ((command.fx - command.cx) * 2 / sx);
    final double focalAlignY = centerAlignY + ((command.fy - command.cy) * 2 / sy);

    buffer.writeBlock('final Gradient $varName = RadialGradient(', () {
      buffer.writeln('center: Alignment($centerAlignX, $centerAlignY),');
      buffer.writeln('radius: ${command.radius},');
      buffer.writeln('focal: Alignment($focalAlignX, $focalAlignY),');
      buffer.writeln('focalRadius: ${command.focalRadius},');

      buffer.writeBlock('colors: <Color>[', () {
        for (final GradientStop stop in command.stops) {
          final int alpha = (stop.opacity * 255).round().clamp(0, 255);
          final int combinedColor = (stop.colorArgb & 0x00FFFFFF) | (alpha << 24);
          final String colorCode = FlutterColorMap.getColorCode(
            combinedColor,
            colorMapping: colorMapping,
          );
          final String? tokenName = palette?.colorTokens[stop.colorArgb];
          if (tokenName != null) {
            if (stop.opacity == 1.0) {
              buffer.writeln('$tokenName ?? $colorCode,');
            } else {
              buffer.writeln(
                '($tokenName != null ? $tokenName!.withValues(alpha: ${stop.opacity}) : $colorCode),',
              );
            }
          } else {
            buffer.writeln('$colorCode,');
          }
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

      final String cleanName = (painterClassName ?? 'Unknown')
          .replaceAll(r'$', '')
          .replaceFirst(RegExp(r'^_+'), '');
      final helperName = '_SvgGradientTransform_$cleanName';

      if (command.transformAttributes != null) {
        final List<double> matrix = command.transformAttributes!.toFlutterMatrix();
        final isBbox = command.units == PaintingGradientUnits.objectBoundingBox;
        final extraBbox = isBbox ? ', isObjectBoundingBox: true' : '';
        final extraStretch = isBbox && needsStretch
            ? ', isElliptical: true, centerX: ${command.cx}, centerY: ${command.cy}'
            : '';
        buffer.writeln(
          'transform: $helperName(matrix: <double>[${matrix.join(', ')}]$extraBbox$extraStretch),',
        );
      } else if (command.units == PaintingGradientUnits.objectBoundingBox && needsStretch) {
        // SVG objectBoundingBox radial gradients are elliptical on non-square elements.
        // We use the centerX/centerY to ensure correct aspect-ratio correction.
        buffer.writeln(
          'transform: $helperName(isElliptical: true, centerX: ${command.cx}, centerY: ${command.cy}),',
        );
      }
    }, footer: ');');
  }
}
