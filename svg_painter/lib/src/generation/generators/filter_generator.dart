import 'package:svg_painter_annotation/svg_painter_annotation.dart';

import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../command_generator.dart';
import '../generator_buffer.dart';
import '../models.dart';
import '../palette_analyzer.dart';
import '../svg_id_formatter.dart';

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
    final String filterId = SvgIdFormatter.sanitizeId(command.id);
    buffer.writeBlock(
      'void _filter_$filterId(Canvas canvas, void Function() drawGraphic) {',
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

    // 1. Locate the starting primitive for the pipeline.
    SvgFilterPrimitive? currentPrimitive;
    var currentIndex = -1;
    if (targetResult != null) {
      for (var i = 0; i < primitives.length; i++) {
        if (primitives[i].result == targetResult) {
          currentPrimitive = primitives[i];
          currentIndex = i;
          break;
        }
      }
    } else if (primitives.isNotEmpty) {
      currentIndex = primitives.length - 1;
      currentPrimitive = primitives.last;
    }

    // 2. Trace backwards through inputs.
    while (currentPrimitive != null) {
      activePrimitives.add(currentPrimitive);
      final String? inSource = currentPrimitive.inSource;
      if (inSource == 'SourceGraphic' || inSource == 'SourceAlpha') {
        break;
      }
      if (inSource != null) {
        // Trace to the primitive that produced this result.
        SvgFilterPrimitive? nextPrimitive;
        var nextIndex = -1;
        for (int i = currentIndex - 1; i >= 0; i--) {
          if (primitives[i].result == inSource) {
            nextPrimitive = primitives[i];
            nextIndex = i;
            break;
          }
        }
        currentPrimitive = nextPrimitive;
        currentIndex = nextIndex;
      } else {
        // When inSource is omitted, implicitly depend on immediately preceding primitive.
        if (currentIndex > 0) {
          currentIndex--;
          currentPrimitive = primitives[currentIndex];
        } else {
          currentPrimitive = null;
        }
      }
    }

    final List<SvgFilterPrimitive> orderedPrimitives = activePrimitives.reversed.toList();

    SvgFeOffset? offset;
    SvgFeGaussianBlur? blur;
    SvgFeComponentTransfer? componentTransfer;
    var isSourceAlpha = false;

    for (final p in orderedPrimitives) {
      if (p is SvgFeOffset) {
        offset = p;
      } else if (p is SvgFeGaussianBlur) {
        blur = p;
        if (p.inSource == 'SourceAlpha') {
          isSourceAlpha = true;
        }
      } else if (p is SvgFeComponentTransfer) {
        componentTransfer = p;
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

    if (componentTransfer != null) {
      final (double rSlope, double rIntercept) = _channelTransfer(componentTransfer.funcR);
      final (double gSlope, double gIntercept) = _channelTransfer(componentTransfer.funcG);
      final (double bSlope, double bIntercept) = _channelTransfer(componentTransfer.funcB);
      final (double aSlope, double aIntercept) = _channelTransfer(componentTransfer.funcA);

      final matrix = <double>[
        rSlope, 0.0, 0.0, 0.0, rIntercept,
        0.0, gSlope, 0.0, 0.0, gIntercept,
        0.0, 0.0, bSlope, 0.0, bIntercept,
        0.0, 0.0, 0.0, aSlope, aIntercept,
      ];

      buffer.writeln(
        'canvas.saveLayer(null, Paint()..colorFilter = const ColorFilter.matrix(<double>[${matrix.join(', ')}]));',
      );
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

  (double, double) _channelTransfer(SvgFeFunc? func) {
    if (func == null) {
      return (1.0, 0.0);
    }
    switch (func.type) {
      case .identity:
        return (1.0, 0.0);
      case .linear:
        return (func.slope, func.intercept * 255.0);
      case .gamma:
        return (func.amplitude, func.offset * 255.0);
      case .table:
        if (func.tableValues.isEmpty) {
          return (1.0, 0.0);
        } else if (func.tableValues.length == 1) {
          return (0.0, func.tableValues.first * 255.0);
        } else {
          final double slope = func.tableValues.last - func.tableValues.first;
          final double intercept = func.tableValues.first * 255.0;
          return (slope, intercept);
        }
      case .discrete:
        if (func.tableValues.isEmpty) {
          return (1.0, 0.0);
        } else if (func.tableValues.length == 1) {
          return (0.0, func.tableValues.first * 255.0);
        } else {
          final double slope = func.tableValues.last - func.tableValues.first;
          final double intercept = func.tableValues.first * 255.0;
          return (slope, intercept);
        }
    }
  }
}
