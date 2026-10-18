import 'dart:math' as math;

import '../../svg_model/_svg_model.dart';

/// Extension on [String] to convert it to an [SvgMarkerOrient].
extension ToSvgMarkerOrient on String {
  /// Parses the string as an [SvgMarkerOrient].
  SvgMarkerOrient? toSvgMarkerOrient() {
    final String trimmed = trim();
    if (trimmed.isEmpty) {
      return null;
    }
    if (trimmed == 'auto') {
      return SvgMarkerOrient.auto;
    }
    if (trimmed == 'auto-start-reverse') {
      return SvgMarkerOrient.autoStartReverse;
    }

    if (trimmed.endsWith('deg')) {
      final String numStr = trimmed.substring(0, trimmed.length - 3).trim();
      final double? val = double.tryParse(numStr);
      return val != null ? SvgMarkerOrientAngle(val) : null;
    }
    if (trimmed.endsWith('grad')) {
      final String numStr = trimmed.substring(0, trimmed.length - 4).trim();
      final double? val = double.tryParse(numStr);
      return val != null ? SvgMarkerOrientAngle(val * 0.9) : null;
    }
    if (trimmed.endsWith('rad')) {
      final String numStr = trimmed.substring(0, trimmed.length - 3).trim();
      final double? val = double.tryParse(numStr);
      return val != null ? SvgMarkerOrientAngle(val * 180.0 / math.pi) : null;
    }
    if (trimmed.endsWith('turn')) {
      final String numStr = trimmed.substring(0, trimmed.length - 4).trim();
      final double? val = double.tryParse(numStr);
      return val != null ? SvgMarkerOrientAngle(val * 360.0) : null;
    }

    final double? val = double.tryParse(trimmed);
    return val != null ? SvgMarkerOrientAngle(val) : null;
  }
}
