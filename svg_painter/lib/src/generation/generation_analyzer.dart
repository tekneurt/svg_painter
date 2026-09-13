import '../painting_model/_painting_model.dart';

/// Helper class to analyze the paint command tree for code generation decisions.
class GenerationAnalyzer {
  const GenerationAnalyzer();

  /// Collects IDs from painting commands for property exposure.
  void collectIds(
    List<PaintCommand> commands,
    Set<String> fillIds,
    Set<String> strokeIds,
  ) {
    for (final command in commands) {
      final String? cmdId = command.id;
      if (command is DrawCommand && cmdId != null) {
        final PaintingStyle style = command.style;
        if (style.fill?.isExplicit ?? false) {
          fillIds.add(cmdId);
        }
        if (style.stroke?.isExplicit ?? false) {
          strokeIds.add(cmdId);
        }
      }
      if (command is DrawGroup) {
        collectIds(command.commands, fillIds, strokeIds);
      }
    }
  }

  /// Checks if the command tree contains any dashed strokes.
  bool hasDashes(List<PaintCommand> commands) {
    for (final command in commands) {
      if (command is DrawCommand) {
        final PaintingStyle style = command.style;
        final List<double>? dashArray = style.stroke?.dashArray;

        if (dashArray != null) {
          return true;
        }
      }

      if (command is DrawGroup) {
        if (hasDashes(command.commands)) {
          return true;
        }
      }
    }
    return false;
  }

  /// Checks if the command tree uses `currentColor`.
  bool hasCurrentColor(List<PaintCommand> commands) {
    for (final command in commands) {
      if (command is DrawCommand) {
        final PaintingStyle style = command.style;
        if ((style.fill?.isCurrentColor ?? false) || (style.stroke?.isCurrentColor ?? false)) {
          return true;
        }
      }

      if (command is DrawGroup) {
        if (hasCurrentColor(command.commands)) {
          return true;
        }
      }
    }
    return false;
  }

  /// Checks if `viewBoxRect` is needed for `userSpaceOnUse` gradients.
  bool needsViewBoxRect(List<PaintCommand> commands) {
    for (final command in commands) {
      if (command is DefineGradient && command.units == PaintingGradientUnits.userSpaceOnUse) {
        return true;
      }
      if (command is DrawGroup && needsViewBoxRect(command.commands)) {
        return true;
      }
    }
    return false;
  }

  /// Finds IDs of gradients that need stretching for non-square elements.
  Set<String> findGradientsNeedingStretch(List<PaintCommand> commands) {
    final ids = <String>{};
    for (final command in commands) {
      if (command is DrawGroup) {
        ids.addAll(findGradientsNeedingStretch(command.commands));
      } else if (command is DrawCommand) {
        final String? shaderId = command.style.fill?.shaderId ?? command.style.stroke?.shaderId;
        if (shaderId != null && isNonSquare(command)) {
          ids.add(shaderId);
        }
      }
    }
    return ids;
  }

  /// Checks if a command represents a non-square shape.
  bool isNonSquare(DrawCommand command) {
    return switch (command) {
      DrawRect(:final double width, :final double height) => width != height,
      DrawOval(:final double rx, :final double ry) => rx != ry,
      DrawCircle() => false,
      DrawLine() => true,
      DrawPath() => true,
      DrawPolyline() => true,
      DrawPolygon() => true,
      DrawText() => true,
      DrawImage() => true,
      _ => true,
    };
  }

  /// Checks if any gradient in the tree needs a transformation.
  bool needsGradientTransform(
    List<PaintCommand> commands,
    Set<String> gradientsNeedingStretch,
  ) {
    for (final command in commands) {
      if (command is DefineGradient) {
        if (command.transformAttributes != null) {
          return true;
        }
        if (command is DefineRadialGradient &&
            command.units == PaintingGradientUnits.objectBoundingBox &&
            gradientsNeedingStretch.contains(command.id)) {
          return true;
        }
      }
      if (command is DrawGroup &&
          needsGradientTransform(command.commands, gradientsNeedingStretch)) {
        return true;
      }
    }
    return false;
  }
}
