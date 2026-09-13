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
    final bool hasCanvasModification = switch (style) {
      PaintingStyle(
        transformAttributes: SvgTransformAttributes(:final operations),
      )
          when operations.isNotEmpty =>
        true,
      PaintingStyle(:final clipRect) when clipRect != null => true,
      PaintingStyle(:final clipPathId) when clipPathId != null => true,
      _ => false,
    };

    final String? maskId = style.maskId;

    switch ((hasCanvasModification, maskId)) {
      case (false, null):
        body();
      case (true, final String id):
        _wrapWithCanvasSave(buffer, style, boundsRect, () {
          _wrapWithMask(buffer, id, boundsRect, body);
        });
      case (true, null):
        _wrapWithCanvasSave(buffer, style, boundsRect, body);
      case (false, final String id):
        _wrapWithMask(buffer, id, boundsRect, body);
    }
  }

  void _wrapWithCanvasSave(
    GeneratorBuffer buffer,
    PaintingStyle style,
    String boundsRect,
    void Function() body,
  ) {
    buffer.writeln('canvas.save();');
    _applyTransforms(buffer, style.transformAttributes);
    _applyClipRect(buffer, style.clipRect);
    _applyClipPath(buffer, style.clipPathId, boundsRect);
    body();
    buffer.writeln('canvas.restore();');
  }

  void _applyTransforms(
    GeneratorBuffer buffer,
    SvgTransformAttributes? transformAttributes,
  ) {
    if (transformAttributes
        case SvgTransformAttributes(:final operations)
        when operations.isNotEmpty) {
      for (final op in operations) {
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
            final double tan =
                angle == 0.0 ? 0.0 : math.tan(angle * (math.pi / 180.0));
            buffer.writeln('canvas.skew($tan, 0.0);');
          case SvgSkewY(:final double angle):
            final double tan =
                angle == 0.0 ? 0.0 : math.tan(angle * (math.pi / 180.0));
            buffer.writeln('canvas.skew(0.0, $tan);');
        }
      }
    }
  }

  void _applyClipRect(GeneratorBuffer buffer, PaintingRect? clipRect) {
    if (clipRect
        case PaintingRect(:final left, :final top, :final width, :final height)) {
      buffer.writeln(
        'canvas.clipRect(Rect.fromLTWH($left, $top, $width, $height));',
      );
    }
  }

  void _applyClipPath(
    GeneratorBuffer buffer,
    String? clipPathId,
    String boundsRect,
  ) {
    if (clipPathId case final id?) {
      buffer.writeln('_clipPath_$id(canvas, size, $boundsRect);');
    }
  }

  void _wrapWithMask(
    GeneratorBuffer buffer,
    String maskId,
    String boundsRect,
    void Function() body,
  ) {
    buffer.writeln('canvas.saveLayer(null, Paint());');
    body();
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
    buffer.writeln('_mask_$maskId(canvas, size, $boundsRect);');
    buffer.writeln('canvas.restore();');
    buffer.writeln('canvas.restore();');
  }
}
