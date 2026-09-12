import 'dart:math' as math;

import '../painting_model/_painting_model.dart';
import '../svg_model/_svg_model.dart';
import 'generator_buffer.dart';
import 'models.dart';
import 'palette_analyzer.dart';

/// Base class for all command-specific code generators.
abstract class CommandGenerator<T extends PaintCommand> {
  const CommandGenerator();

  /// Generates the Dart code for the given [command] and appends it to the [buffer].
  void generate(
    T command,
    GeneratorBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
    String? painterClassName,
    Set<String>? gradientsNeedingStretch,
  });

  /// Helper to wrap a block of code with styling features like transforms or clips.
  void wrapWithStyle(
    GeneratorBuffer buffer,
    PaintingStyle style,
    String boundsRect,
    void Function() body,
  ) {
    final SvgTransformAttributes? transformAttributes = style.transformAttributes;
    final PaintingRect? clipRect = style.clipRect;

    final bool hasTransform =
        transformAttributes != null && transformAttributes.operations.isNotEmpty;
    final hasClip = clipRect != null;
    final hasMask = style.maskId != null;
    final hasClipPath = style.clipPathId != null;

    if (!hasTransform && !hasClip && !hasMask && !hasClipPath) {
      body();
      return;
    }

    if (hasTransform || hasClip || hasClipPath) {
      buffer.writeln('canvas.save();');
    }

    if (hasTransform) {
      for (final SvgTransformOperation op in transformAttributes.operations) {
        switch (op) {
          case SvgTranslate(:final double x, :final double y):
            buffer.writeln('canvas.translate($x, $y);');
          case SvgRotate(:final double angle, :final double? cx, :final double? cy):
            final double radians = angle * 0.017453292519943295;
            if (cx != null && cy != null) {
              buffer.writeln('canvas.translate($cx, $cy);');
              buffer.writeln('canvas.rotate($radians);');
              buffer.writeln('canvas.translate(${-cx}, ${-cy});');
            } else {
              buffer.writeln('canvas.rotate($radians);');
            }
          case SvgScale(:final double x, :final double y):
            buffer.writeln('canvas.scale($x, $y);');
          case SvgMatrix(
            :final double a,
            :final double b,
            :final double c,
            :final double d,
            :final double e,
            :final double f,
          ):
            buffer.writeln(
              'canvas.transform(Matrix4.fromList(<double>[$a, $b, 0, 0, $c, $d, 0, 0, 0, 0, 1, 0, $e, $f, 0, 1]).storage);',
            );
          case SvgSkewX(:final double angle):
            final double tan = angle == 0.0 ? 0.0 : math.tan(angle * (math.pi / 180.0));
            buffer.writeln('canvas.skew($tan, 0.0);');
          case SvgSkewY(:final double angle):
            final double tan = angle == 0.0 ? 0.0 : math.tan(angle * (math.pi / 180.0));
            buffer.writeln('canvas.skew(0.0, $tan);');
        }
      }
    }

    if (hasClip) {
      buffer.writeln(
        'canvas.clipRect(Rect.fromLTWH(${clipRect.left}, ${clipRect.top}, ${clipRect.width}, ${clipRect.height}));',
      );
    }

    if (hasClipPath) {
      buffer.writeln('_clipPath_${style.clipPathId}(canvas, size, $boundsRect);');
    }

    if (hasMask) {
      buffer.writeln('canvas.saveLayer(null, Paint());');
    }

    body();

    if (hasMask) {
      buffer.writeBlock(
        'canvas.saveLayer(null, Paint()..blendMode = BlendMode.dstIn..colorFilter = const ColorFilter.matrix(<double>[',
        () {
          buffer.writeln('0, 0, 0, 0, 0,');
          buffer.writeln('0, 0, 0, 0, 0,');
          buffer.writeln('0, 0, 0, 0, 0,');
          buffer.writeln('0.2126, 0.7152, 0.0722, 0, 0,');
        },
        footer: ']));',
      );
      buffer.writeln('_mask_${style.maskId}(canvas, size, $boundsRect);');
      buffer.writeln('canvas.restore();');
      buffer.writeln('canvas.restore();');
    }

    if (hasTransform || hasClip || hasClipPath) {
      buffer.writeln('canvas.restore();');
    }
  }
}
