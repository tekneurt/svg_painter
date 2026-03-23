part of '../svg_value.dart';

/// The alignment options for [SvgPreserveAspectRatio].
enum SvgPreserveAspectRatioAlignment {
  none,
  xMinYMin,
  xMidYMin,
  xMaxYMin,
  xMinYMid,
  xMidYMid,
  xMaxYMid,
  xMinYMax,
  xMidYMax,
  xMaxYMax,
}

/// The scale options for [SvgPreserveAspectRatio].
enum SvgPreserveAspectRatioScale {
  meet,
  slice,
}

/// Represents the `preserveAspectRatio` attribute.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/preserveAspectRatio
final class SvgPreserveAspectRatio extends SvgValue {
  const SvgPreserveAspectRatio({
    this.alignment = SvgPreserveAspectRatioAlignment.xMidYMid,
    this.scale = SvgPreserveAspectRatioScale.meet,
  });

  /// A pre-defined constant for the default behavior.
  static const SvgPreserveAspectRatio defaults = SvgPreserveAspectRatio();

  final SvgPreserveAspectRatioAlignment alignment;
  final SvgPreserveAspectRatioScale scale;

  @override
  String toString() => 'SvgPreserveAspectRatio(${alignment.name}, ${scale.name})';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is SvgPreserveAspectRatio &&
        other.alignment == alignment &&
        other.scale == scale;
  }

  @override
  int get hashCode => alignment.hashCode ^ scale.hashCode;
}
