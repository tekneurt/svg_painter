import 'package:svg_painter_annotation/svg_painter_annotation.dart';

import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../command_generator.dart';
import '../generation_extensions.dart';
import '../generator_buffer.dart';
import '../models.dart';
import '../palette_analyzer.dart';
import '../svg_id_formatter.dart';

/// Generator for [DefinePattern] commands.
class PatternGenerator extends CommandGenerator<DefinePattern> {
  const PatternGenerator();

  @override
  void generate(
    DefinePattern command,
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
    if (generators == null) {
      return;
    }

    final String patternId = SvgIdFormatter.sanitizeId(command.id);
    buffer.writeBlock(
      'ImageShader? _createPattern_$patternId(Rect targetBounds) {',
      () {
        if (command.patternUnits == SvgPatternUnits.objectBoundingBox) {
          final double widthFactor = switch (command.width) {
            final SvgPercentage p => p.value / 100.0,
            final SvgLength l => l.value,
            _ => 0.0,
          };
          final double heightFactor = switch (command.height) {
            final SvgPercentage p => p.value / 100.0,
            final SvgLength l => l.value,
            _ => 0.0,
          };
          final double xFactor = switch (command.x) {
            final SvgPercentage p => p.value / 100.0,
            final SvgLength l => l.value,
            _ => 0.0,
          };
          final double yFactor = switch (command.y) {
            final SvgPercentage p => p.value / 100.0,
            final SvgLength l => l.value,
            _ => 0.0,
          };

          buffer.writeln('final double tileWidth = targetBounds.width * $widthFactor;');
          buffer.writeln('final double tileHeight = targetBounds.height * $heightFactor;');
          if (xFactor == 0.0) {
            buffer.writeln('final double originX = targetBounds.left;');
          } else {
            buffer.writeln('final double originX = targetBounds.left + targetBounds.width * $xFactor;');
          }
          if (yFactor == 0.0) {
            buffer.writeln('final double originY = targetBounds.top;');
          } else {
            buffer.writeln('final double originY = targetBounds.top + targetBounds.height * $yFactor;');
          }
        } else {
          final double w = switch (command.width) {
            final SvgLength l => l.value,
            final SvgPercentage p => p.value,
            _ => 0.0,
          };
          final double h = switch (command.height) {
            final SvgLength l => l.value,
            final SvgPercentage p => p.value,
            _ => 0.0,
          };
          final double ox = switch (command.x) {
            final SvgLength l => l.value,
            _ => 0.0,
          };
          final double oy = switch (command.y) {
            final SvgLength l => l.value,
            _ => 0.0,
          };

          buffer.writeln('final double tileWidth = $w;');
          buffer.writeln('final double tileHeight = $h;');
          buffer.writeln('final double originX = $ox;');
          buffer.writeln('final double originY = $oy;');
        }

        buffer.writeBlock('if (tileWidth <= 0.0 || tileHeight <= 0.0) {', () {
          buffer.writeln('return null;');
        });

        buffer.writeln('final int imgWidth = tileWidth.round().clamp(1, 2048);');
        buffer.writeln('final int imgHeight = tileHeight.round().clamp(1, 2048);');
        buffer.writeln('final ui.PictureRecorder recorder = ui.PictureRecorder();');
        buffer.writeln('final Canvas canvas = Canvas(recorder, Rect.fromLTWH(0.0, 0.0, tileWidth, tileHeight));');
        buffer.writeln('canvas.scale(imgWidth / tileWidth, imgHeight / tileHeight);');

        final SvgViewBox? viewBox = command.viewBox;
        if (viewBox != null) {
          final SvgPreserveAspectRatio par = command.preserveAspectRatio ?? SvgPreserveAspectRatio.defaults;
          if (par.alignment == SvgPreserveAspectRatioAlignment.none) {
            buffer.writeln('canvas.scale(tileWidth / ${viewBox.width}, tileHeight / ${viewBox.height});');
          } else {
            buffer.writeln('final double scaleX = tileWidth / ${viewBox.width};');
            buffer.writeln('final double scaleY = tileHeight / ${viewBox.height};');
            if (par.scale == SvgPreserveAspectRatioScale.slice) {
              buffer.writeln('final double s = scaleX > scaleY ? scaleX : scaleY;');
            } else {
              buffer.writeln('final double s = scaleX < scaleY ? scaleX : scaleY;');
            }
            buffer.writeln('canvas.translate((tileWidth - ${viewBox.width} * s) * 0.5, (tileHeight - ${viewBox.height} * s) * 0.5);');
            buffer.writeln('canvas.scale(s, s);');
          }
          if (viewBox.minX != 0.0 || viewBox.minY != 0.0) {
            buffer.writeln('canvas.translate(-${viewBox.minX}, -${viewBox.minY});');
          }
        } else if (command.patternContentUnits == SvgPatternUnits.objectBoundingBox) {
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
            colorMapping: colorMapping,
            isInsideMarker: isInsideMarker,
          );
        }

        buffer.writeln('final ui.Picture picture = recorder.endRecording();');
        buffer.writeln('final image = picture.toImageSync(imgWidth, imgHeight);');

        if (command.patternTransform != null) {
          final List<double> matrix = command.patternTransform!.toFlutterMatrix();
          buffer.writeln('final Matrix4 matrix = Matrix4.fromList(const <double>[${matrix.join(', ')}])');
        } else {
          buffer.writeln('final Matrix4 matrix = Matrix4.identity()');
        }
        buffer.indent();
        buffer.writeln('..translateByDouble(originX, originY, 0.0, 1.0)');
        buffer.writeln('..scaleByDouble(tileWidth / imgWidth, tileHeight / imgHeight, 1.0, 1.0);');
        buffer.outdent();

        buffer.writeBlock('return ImageShader(', () {
          buffer.writeln('image,');
          buffer.writeln('TileMode.repeated,');
          buffer.writeln('TileMode.repeated,');
          buffer.writeln('matrix.storage,');
        }, footer: ');');
      },
    );
  }
}
