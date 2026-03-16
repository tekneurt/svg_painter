import '../../svg_model/_svg_model.dart';

/// Extension on [String] to convert it to an [SvgPreserveAspectRatio].
extension ToSvgPreserveAspectRatio on String {
  /// Parses the string as an [SvgPreserveAspectRatio].
  ///
  /// Examples: "none", "xMidYMid meet", "xMinYMax slice".
  SvgPreserveAspectRatio toSvgPreserveAspectRatio() {
    final List<String> parts = trim().split(RegExp(r'\s+'));

    if (parts.isEmpty) {
      return SvgPreserveAspectRatio.defaults;
    }

    final String alignStr = parts[0];
    final SvgPreserveAspectRatioAlignment alignment = switch (alignStr) {
      'none' => SvgPreserveAspectRatioAlignment.none,
      'xMinYMin' => SvgPreserveAspectRatioAlignment.xMinYMin,
      'xMidYMin' => SvgPreserveAspectRatioAlignment.xMidYMin,
      'xMaxYMin' => SvgPreserveAspectRatioAlignment.xMaxYMin,
      'xMinYMid' => SvgPreserveAspectRatioAlignment.xMinYMid,
      'xMidYMid' => SvgPreserveAspectRatioAlignment.xMidYMid,
      'xMaxYMid' => SvgPreserveAspectRatioAlignment.xMaxYMid,
      'xMinYMax' => SvgPreserveAspectRatioAlignment.xMinYMax,
      'xMidYMax' => SvgPreserveAspectRatioAlignment.xMidYMax,
      'xMaxYMax' => SvgPreserveAspectRatioAlignment.xMaxYMax,
      _ => SvgPreserveAspectRatioAlignment.xMidYMid,
    };

    SvgPreserveAspectRatioScale scale = SvgPreserveAspectRatioScale.meet;
    if (parts.length > 1) {
      final String scaleStr = parts[1];
      if (scaleStr == 'slice') {
        scale = SvgPreserveAspectRatioScale.slice;
      }
    }

    return SvgPreserveAspectRatio(alignment: alignment, scale: scale);
  }
}
