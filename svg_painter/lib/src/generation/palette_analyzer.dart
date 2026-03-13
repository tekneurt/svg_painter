import 'package:meta/meta.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';

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
  PaletteResult analyze(
    List<PaintCommand> commands, {
    SvgExposureMode mode = SvgExposureMode.none,
  }) {
    final Map<PaintCommand, String> fillAssignments = <PaintCommand, String>{};
    final Map<PaintCommand, String> strokeAssignments = <PaintCommand, String>{};

    final Map<_StyleKey, List<PaintCommand>> fillGroups = <_StyleKey, List<PaintCommand>>{};
    final Map<_StyleKey, List<PaintCommand>> strokeGroups = <_StyleKey, List<PaintCommand>>{};

    _collectGroups(commands, fillGroups, strokeGroups, mode: mode);

    _assignNames(fillGroups, fillAssignments, 'fill');
    _assignNames(strokeGroups, strokeAssignments, 'stroke');

    return PaletteResult(fillAssignments, strokeAssignments);
  }

  void _collectGroups(
    List<PaintCommand> commands,
    Map<_StyleKey, List<PaintCommand>> fillGroups,
    Map<_StyleKey, List<PaintCommand>> strokeGroups, {
    required SvgExposureMode mode,
  }) {
    for (final PaintCommand command in commands) {
      if (command is DrawGroup) {
        _collectGroups(command.commands, fillGroups, strokeGroups, mode: mode);
      }

      bool shouldIndex(String? id, bool isExplicit) {
        if (mode == SvgExposureMode.none) {
          return false;
        }
        if (!isExplicit) {
          return true;
        }
        if (mode == SvgExposureMode.id) {
          return false;
        }
        if (mode == SvgExposureMode.indexed) {
          return true;
        }
        return id == null;
      }

      if (command is DrawCommand) {
        final PaintingStyle style = command.style;

        final PaintingFillStyle? fill = style.fill;
        if (fill != null && shouldIndex(command.id, fill.isExplicit)) {
          final _StyleKey key = _StyleKey.fromFill(fill);
          fillGroups.putIfAbsent(key, () => <PaintCommand>[]).add(command);
        }

        final PaintingStrokeStyle? stroke = style.stroke;
        if (stroke != null && shouldIndex(command.id, stroke.isExplicit)) {
          final _StyleKey key = _StyleKey.fromStroke(stroke);
          strokeGroups.putIfAbsent(key, () => <PaintCommand>[]).add(command);
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

    final List<MapEntry<_StyleKey, List<PaintCommand>>> defaultEntries = sortedEntries.where((
      MapEntry<_StyleKey, List<PaintCommand>> e,
    ) {
      final PaintCommand cmd = e.value.first;
      if (cmd is DrawCommand) {
        final PaintingPaintStyle? style = prefix == 'fill' ? cmd.style.fill : cmd.style.stroke;
        return style?.isExplicit == false;
      }
      return false;
    }).toList();

    final List<MapEntry<_StyleKey, List<PaintCommand>>> explicitEntries =
        sortedEntries
            .where((MapEntry<_StyleKey, List<PaintCommand>> e) => !defaultEntries.contains(e))
            .toList();

    if (defaultEntries.length == 1) {
      final String name = 'default${prefix[0].toUpperCase()}${prefix.substring(1)}';
      for (final PaintCommand cmd in defaultEntries.first.value) {
        result[cmd] = name;
      }
    } else if (defaultEntries.isNotEmpty) {
      for (int i = 0; i < defaultEntries.length; i++) {
        final String name = 'default${prefix[0].toUpperCase()}${prefix.substring(1)}${i + 1}';
        for (final PaintCommand cmd in defaultEntries[i].value) {
          result[cmd] = name;
        }
      }
    }

    if (explicitEntries.length == 1) {
      for (final PaintCommand cmd in explicitEntries.first.value) {
        result[cmd] = prefix;
      }
    } else if (explicitEntries.isNotEmpty) {
      for (int i = 0; i < explicitEntries.length; i++) {
        final String name = '$prefix${i + 1}';
        for (final PaintCommand cmd in explicitEntries[i].value) {
          result[cmd] = name;
        }
      }
    }
  }
}

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
    if (colorArgb == other.colorArgb) {
      return (shaderId ?? '').compareTo(other.shaderId ?? '');
    } else {
      return (colorArgb ?? 0).compareTo(other.colorArgb ?? 0);
    }
  }
}
