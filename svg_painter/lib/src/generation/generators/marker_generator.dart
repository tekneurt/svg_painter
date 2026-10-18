import 'dart:math' as math;

import 'package:svg_painter_annotation/svg_painter_annotation.dart';

import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../command_generator.dart';
import '../generator_buffer.dart';
import '../models.dart';
import '../palette_analyzer.dart';

/// Generator for [DefineMarker] commands.
class MarkerGenerator extends CommandGenerator<DefineMarker> {
  const MarkerGenerator();

  @override
  void generate(
    DefineMarker command,
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
  }) {
    if (generators == null) {
      return;
    }

    final String markerId = command.id ?? '';
    buffer.writeBlock(
      'void _marker_$markerId(Canvas canvas, Offset position, double tangentAngle, double strokeWidth, {bool isStart = false}) {',
      () {
        buffer.writeln('canvas.save();');
        buffer.writeln('canvas.translate(position.dx, position.dy);');

        // Orientation calculation
        switch (command.orient) {
          case SvgMarkerOrientAngle(:final double degrees):
            final double rad = degrees * math.pi / 180.0;
            if (rad == 0.0) {
              // No rotation needed for 0 degrees
            } else {
              buffer.writeln('canvas.rotate($rad);');
            }
          case SvgMarkerOrientAuto():
            buffer.writeln('canvas.rotate(tangentAngle);');
          case SvgMarkerOrientAutoStartReverse():
            buffer.writeBlock('if (isStart) {', () {
              buffer.writeln('canvas.rotate(tangentAngle + ${math.pi});');
            });
            buffer.writeBlock('else {', () {
              buffer.writeln('canvas.rotate(tangentAngle);');
            });
        }

        // Units scaling
        if (command.markerUnits == SvgMarkerUnits.strokeWidth) {
          buffer.writeBlock('if (strokeWidth != 1.0) {', () {
            buffer.writeln('canvas.scale(strokeWidth, strokeWidth);');
          });
        }

        // ViewBox / Viewport mapping
        final SvgViewBox? viewBox = command.viewBox;
        if (viewBox != null) {
          final double sx = command.markerWidth / viewBox.width;
          final double sy = command.markerHeight / viewBox.height;
          if (sx == 1.0 && sy == 1.0) {
            // Unit scale
          } else {
            buffer.writeln('canvas.scale($sx, $sy);');
          }
          if (command.refX == 0.0 && command.refY == 0.0) {
            // No reference offset
          } else {
            buffer.writeln('canvas.translate(-${command.refX}, -${command.refY});');
          }
          if (viewBox.minX == 0.0 && viewBox.minY == 0.0) {
            // Origin at 0, 0
          } else {
            buffer.writeln('canvas.translate(-${viewBox.minX}, -${viewBox.minY});');
          }
        } else {
          if (command.refX == 0.0 && command.refY == 0.0) {
            // No reference offset
          } else {
            buffer.writeln('canvas.translate(-${command.refX}, -${command.refY});');
          }
        }

        // Draw children
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
            colorMapping: colorMapping,
          );
        }

        buffer.writeln('canvas.restore();');
      },
    );
  }
}
