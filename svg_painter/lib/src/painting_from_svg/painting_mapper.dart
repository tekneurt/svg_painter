import '../painting_model/paint_command.dart';
import '../svg_model/svg_element.dart';
import '../util/result.dart';

/// Maps SVG domain objects to Painting commands.
class PaintingMapper {
  const PaintingMapper._();

  /// Maps an [SvgElement] to a list of [PaintCommand]s.
  ///
  /// Typically, the input [element] is an [SvgRoot].
  static Result<List<PaintCommand>> fromSvg(SvgElement element) {
    if (element is SvgRoot) {
      return _mapRoot(element);
    } else if (element is SvgCircle) {
      // If we are mapping a single circle fragment
      return _mapCircle(element).map((DrawCircle cmd) => <PaintCommand>[cmd]);
    } else {
      return Failure<List<PaintCommand>>(
        'Unsupported top-level SVG element: ${element.runtimeType}',
      );
    }
  }

  static Result<List<PaintCommand>> _mapRoot(SvgRoot root) {
    final List<PaintCommand> commands = <PaintCommand>[];

    for (final SvgElement child in root.children) {
      // Flatten hierarchy for now. Later we might need SaveLayer/RestoreLayer.
      Result<PaintCommand> result;
      if (child is SvgCircle) {
        result = _mapCircle(child);
      } else {
        // Skip unknown elements for now? Or fail?
        // SvgMapper usually already filters unsupported elements or returns them.
        // If we have an SvgElement type, we should support it in PaintingModel.
        // But for now, we only have SvgCircle.
        continue;
      }

      result.fold(
        (Failure<PaintCommand> failure) {
          // Propagate or log?
          // Strict: propagate.
        },
        (PaintCommand command) {
          commands.add(command);
        },
      );
    }

    return Success<List<PaintCommand>>(commands);
  }

  static Result<DrawCircle> _mapCircle(SvgCircle element) {
    // Here we would handle coordinate transforms, style inheritance, etc.
    // For now, it's a direct map.
    return Success<DrawCircle>(
      DrawCircle(
        cx: element.cx,
        cy: element.cy,
        radius: element.r,
        colorHex: 0xFF000000, // Hardcoded default black fill for now
      ),
    );
  }
}
