import '../../painting_model/paint_command.dart';
import '../../svg_model/svg_element.dart';
import '../../svg_model/svg_value.dart';
import '../../util/result.dart';

/// Extension to convert [SvgElement] to [PaintCommand]s.
extension SvgToPainting on SvgElement {
  /// Converts this [SvgElement] to a list of [PaintCommand]s.
  Result<List<PaintCommand>> toPaintCommands() {
    return switch (this) {
      final SvgSvg container => container._toPaintCommands(),
      final SvgCircle circle =>
        circle.toDrawCircle().map((DrawCircle cmd) => <PaintCommand>[cmd]),
    };
  }
}

extension _SvgSvgToPainting on SvgSvg {
  Result<List<PaintCommand>> _toPaintCommands() {
    final List<PaintCommand> commands = <PaintCommand>[];

    for (final SvgElement child in children) {
      final Result<List<PaintCommand>> result = child.toPaintCommands();

      result.fold(
        (Failure<List<PaintCommand>> failure) {
          // Propagate?
        },
        (List<PaintCommand> value) {
          commands.addAll(value);
        },
      );
    }

    return Success<List<PaintCommand>>(commands);
  }
}

/// Extension to convert [SvgCircle] to [DrawCircle].
extension SvgCircleToPainting on SvgCircle {
  /// Converts this [SvgCircle] to a [DrawCircle].
  Result<DrawCircle> toDrawCircle() {
    return Success<DrawCircle>(
      DrawCircle(
        cx: _resolveLength(cx),
        cy: _resolveLength(cy),
        radius: _resolveLength(r),
        colorHex: 0xFF000000,
      ),
    );
  }

  double _resolveLength(SvgLengthPercentage length) {
    switch (length) {
      case SvgLength():
        return length.value;
      case SvgPercentage():
        // TODO(Gemini): Implement percentage resolution.
        return length.value;
    }
  }
}
