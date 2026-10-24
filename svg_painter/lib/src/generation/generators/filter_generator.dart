import 'package:svg_painter_annotation/svg_painter_annotation.dart';

import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../command_generator.dart';
import '../generator_buffer.dart';
import '../models.dart';
import '../palette_analyzer.dart';

/// Generator for [DefineFilter] commands.
class FilterGenerator extends CommandGenerator<DefineFilter> {
  const FilterGenerator();

  @override
  void generate(
    DefineFilter command,
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
    buffer.writeBlock(
      'void _filter_${command.id}(Canvas canvas, void Function() drawGraphic) {',
      () {
        _generateFilterBody(command, buffer);
      },
    );
  }

  void _generateFilterBody(DefineFilter command, GeneratorBuffer buffer) {
    final List<SvgFilterPrimitive> primitives = command.primitives;
    if (primitives.isEmpty) {
      buffer.writeln('drawGraphic();');
      return;
    }

    // Check if there is an feMerge
    final int feMergeIndex = primitives.indexWhere((SvgFilterPrimitive p) => p is SvgFeMerge);
    if (feMergeIndex != -1) {
      final feMerge = primitives[feMergeIndex] as SvgFeMerge;
      final List<SvgFilterPrimitive> precedingPrimitives = primitives.sublist(0, feMergeIndex);

      for (final SvgFeMergeNode node in feMerge.nodes) {
        final String? inSource = node.inSource;
        if (inSource == 'SourceGraphic') {
          buffer.writeln('drawGraphic();');
        } else {
          _emitPrimitivePipeline(precedingPrimitives, inSource, buffer);
        }
      }
    } else {
      _emitPrimitivePipeline(primitives, null, buffer);
    }
  }

  void _emitPrimitivePipeline(
    List<SvgFilterPrimitive> primitives,
    String? targetResult,
    GeneratorBuffer buffer,
  ) {
    final activePrimitives = <SvgFilterPrimitive>[];
    for (final p in primitives) {
      activePrimitives.add(p);
      if (targetResult != null && p.result == targetResult) {
        break;
      }
    }

    SvgFeOffset? offset;
    SvgFeGaussianBlur? blur;
    var isSourceAlpha = false;

    for (final p in activePrimitives) {
      if (p is SvgFeOffset) {
        offset = p;
      } else if (p is SvgFeGaussianBlur) {
        blur = p;
        if (p.inSource == 'SourceAlpha') {
          isSourceAlpha = true;
        }
      }
      if (p.inSource == 'SourceAlpha') {
        isSourceAlpha = true;
      }
    }

    final bool hasOffset = offset != null && (offset.dx != 0.0 || offset.dy != 0.0);
    final bool hasBlur = blur != null && (blur.stdDeviationX > 0.0 || blur.stdDeviationY > 0.0);

    var closeSaveCount = 0;

    if (hasOffset) {
      buffer.writeln('canvas.save();');
      buffer.writeln('canvas.translate(${offset.dx}, ${offset.dy});');
      closeSaveCount++;
    }

    if (hasBlur) {
      final blurCode = 'ui.ImageFilter.blur(sigmaX: ${blur.stdDeviationX}, sigmaY: ${blur.stdDeviationY})';
      if (isSourceAlpha) {
        buffer.writeln(
          'canvas.saveLayer(null, Paint()..imageFilter = $blurCode..colorFilter = const ColorFilter.mode(Color(0xFF000000), BlendMode.srcIn));',
        );
      } else {
        buffer.writeln('canvas.saveLayer(null, Paint()..imageFilter = $blurCode);');
      }
      closeSaveCount++;
    } else if (isSourceAlpha) {
      buffer.writeln(
        'canvas.saveLayer(null, Paint()..colorFilter = const ColorFilter.mode(Color(0xFF000000), BlendMode.srcIn));',
      );
      closeSaveCount++;
    }

    buffer.writeln('drawGraphic();');

    for (var i = 0; i < closeSaveCount; i++) {
      buffer.writeln('canvas.restore();');
    }
  }
}
