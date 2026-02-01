import 'package:meta/meta.dart';

import '../painting_model/_painting_model.dart';

/// Result of the palette analysis.
class PaletteResult {
  const PaletteResult(this.fillAssignments, this.strokeAssignments);

  /// Mapping of commands to their assigned fill property name (e.g., 'fill1').
  final Map<PaintCommand, String> fillAssignments;

  /// Mapping of commands to their assigned stroke property name (e.g., 'stroke1').
  final Map<PaintCommand, String> strokeAssignments;
}

/// Analyzes a list of paint commands to group and name shared styles.
class PaletteAnalyzer {
  const PaletteAnalyzer();

  /// Analyzes the commands and returns property assignments.
  PaletteResult analyze(List<PaintCommand> commands) {
    final Map<PaintCommand, String> fillAssignments = <PaintCommand, String>{};
    final Map<PaintCommand, String> strokeAssignments = <PaintCommand, String>{};

    final Map<_StyleKey, List<PaintCommand>> fillGroups = <_StyleKey, List<PaintCommand>>{};
    final Map<_StyleKey, List<PaintCommand>> strokeGroups = <_StyleKey, List<PaintCommand>>{};

    _collectGroups(commands, fillGroups, strokeGroups);

    _assignNames(fillGroups, fillAssignments, 'fill');
    _assignNames(strokeGroups, strokeAssignments, 'stroke');

    return PaletteResult(fillAssignments, strokeAssignments);
  }

  void _collectGroups(
    List<PaintCommand> commands,
    Map<_StyleKey, List<PaintCommand>> fillGroups,
    Map<_StyleKey, List<PaintCommand>> strokeGroups,
  ) {
    for (final PaintCommand command in commands) {
      if (command is DrawGroup) {
        _collectGroups(command.commands, fillGroups, strokeGroups);
      }

      if (command.id == null) {
        switch (command) {
          case DrawGroup():
            // Groups are currently not indexed for their own styles
            break;
          case DrawCommand():
            final PaintingStyle style = command.style;

            // Group Fills
            final PaintingFillStyle? fill = style.fill;
            if (fill == null) {
              // No fill
            } else if (fill.isExplicit) {
              final _StyleKey key = _StyleKey.fromFill(fill);
              fillGroups.putIfAbsent(key, () => <PaintCommand>[]).add(command);
            }

            // Group Strokes
            final PaintingStrokeStyle? stroke = style.stroke;
            if (stroke == null) {
              // No stroke
            } else if (stroke.isExplicit) {
              final _StyleKey key = _StyleKey.fromStroke(stroke);
              strokeGroups.putIfAbsent(key, () => <PaintCommand>[]).add(command);
            }
          case DefineCommand():
            break;
        }
      }
    }
  }

  void _assignNames(
    Map<_StyleKey, List<PaintCommand>> groups,
    Map<PaintCommand, String> result,
    String prefix,
  ) {
    if (groups.isEmpty) {
      return;
    }

    // Sort groups by frequency (descending), then by key (for stability).
    final List<MapEntry<_StyleKey, List<PaintCommand>>> sortedEntries = groups.entries.toList()
      ..sort((
        MapEntry<_StyleKey, List<PaintCommand>> a,
        MapEntry<_StyleKey, List<PaintCommand>> b,
      ) {
        final int countCompare = b.value.length.compareTo(a.value.length);

        if (countCompare == 0) {
          return a.key.compareTo(b.key);
        } else {
          return countCompare;
        }
      });

    // If there is only one group, name it simply 'fill' or 'stroke'.
    // Otherwise, use 'fill1', 'fill2', etc.
    if (sortedEntries.length == 1) {
      for (final PaintCommand cmd in sortedEntries.first.value) {
        result[cmd] = prefix;
      }
    } else {
      for (int i = 0; i < sortedEntries.length; i++) {
        final String name = '$prefix${i + 1}';
        for (final PaintCommand cmd in sortedEntries[i].value) {
          result[cmd] = name;
        }
      }
    }
  }
}

/// A key representing a unique visual style (color or shader).
@immutable
class _StyleKey implements Comparable<_StyleKey> {
  const _StyleKey(this.colorArgb, this.shaderId);

  factory _StyleKey.fromFill(PaintingFillStyle fill) {
    return _StyleKey(fill.colorArgb, fill.shaderId);
  }

  factory _StyleKey.fromStroke(PaintingStrokeStyle stroke) {
    return _StyleKey(stroke.colorArgb, stroke.shaderId);
  }

  final int? colorArgb;
  final String? shaderId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _StyleKey &&
          runtimeType == other.runtimeType &&
          colorArgb == other.colorArgb &&
          shaderId == other.shaderId;

  @override
  int get hashCode => colorArgb.hashCode ^ shaderId.hashCode;

  @override
  int compareTo(_StyleKey other) {
    // Stability sorting: arbitrary but consistent.
    if (colorArgb == other.colorArgb) {
      return (shaderId ?? '').compareTo(other.shaderId ?? '');
    } else {
      return (colorArgb ?? 0).compareTo(other.colorArgb ?? 0);
    }
  }
}
