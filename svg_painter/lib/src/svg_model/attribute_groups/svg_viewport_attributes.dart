import 'package:meta/meta.dart';

import '../svg_value.dart';

/// Represents the grouped attributes that apply specifically to viewport elements.
@immutable
final class SvgViewportAttributes {
  const SvgViewportAttributes({this.viewBox, this.preserveAspectRatio});

  /// The coordinate system mapping (mapped from `viewBox` attribute).
  final SvgViewBox? viewBox;

  /// How the viewBox is scaled to fit the viewport (mapped from `preserveAspectRatio` attribute).
  final SvgPreserveAspectRatio? preserveAspectRatio;

  @override
  String toString() {
    final List<String> parts = <String>[
      if (viewBox != null) 'viewBox: $viewBox',
      if (preserveAspectRatio != null) 'preserveAspectRatio: $preserveAspectRatio',
    ];
    return 'SvgViewportAttributes(${parts.join(', ')})';
  }
}
